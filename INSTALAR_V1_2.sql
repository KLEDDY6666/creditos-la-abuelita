-- Ejecutar una sola vez en Supabase SQL Editor como propietario de las tablas.
-- No borra registros existentes. Las funciones verifican rol y sesión en servidor.
CREATE OR REPLACE FUNCTION public.admin_editar_cliente(p_id uuid, p_nombre text, p_telefono text, p_observacion text)
RETURNS void LANGUAGE plpgsql SECURITY DEFINER SET search_path = '' AS $$
BEGIN
 IF auth.uid() IS NULL OR NOT EXISTS (SELECT 1 FROM public.perfiles WHERE id=auth.uid() AND activo IS TRUE AND lower(rol)='admin') THEN
  RAISE EXCEPTION 'Acceso exclusivo del administrador';
 END IF;
 IF length(trim(coalesce(p_nombre,''))) < 2 OR length(p_nombre)>150 THEN RAISE EXCEPTION 'Nombre inválido'; END IF;
 UPDATE public.clientes SET nombre=trim(p_nombre), telefono=nullif(trim(p_telefono),''), observacion=nullif(trim(p_observacion),'') WHERE id=p_id;
 IF NOT FOUND THEN RAISE EXCEPTION 'Cliente no encontrado'; END IF;
END; $$;
CREATE OR REPLACE FUNCTION public.admin_eliminar_cliente(p_id uuid)
RETURNS void LANGUAGE plpgsql SECURITY DEFINER SET search_path = '' AS $$
BEGIN
 IF auth.uid() IS NULL OR NOT EXISTS (SELECT 1 FROM public.perfiles WHERE id=auth.uid() AND activo IS TRUE AND lower(rol)='admin') THEN
  RAISE EXCEPTION 'Acceso exclusivo del administrador';
 END IF;
 IF NOT EXISTS (SELECT 1 FROM public.clientes WHERE id=p_id) THEN RAISE EXCEPTION 'Cliente no encontrado'; END IF;
 DELETE FROM public.movimientos WHERE cliente_id=p_id;
 DELETE FROM public.clientes WHERE id=p_id;
END; $$;
REVOKE ALL ON FUNCTION public.admin_editar_cliente(uuid,text,text,text) FROM PUBLIC;
REVOKE ALL ON FUNCTION public.admin_eliminar_cliente(uuid) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.admin_editar_cliente(uuid,text,text,text) TO authenticated;
GRANT EXECUTE ON FUNCTION public.admin_eliminar_cliente(uuid) TO authenticated;
