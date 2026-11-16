CRÉDITOS LA ABUELITA - PWA V1.0

1. Base SQL: se conecta a la base Supabase ya creada. No ejecutar de nuevo el SQL inicial.
2. Supabase > Project Settings > API Keys: copiar SOLAMENTE la clave publishable (o anon pública). Nunca usar secret ni service_role.
3. Supabase > Project Settings > General / API: copiar Project URL.
4. Editar config.js y completar url y publishableKey, o introducirlos en la pantalla inicial de conexión.
5. Subir todos los archivos a un repositorio GitHub. Settings > Pages > Deploy from a branch > main / (root). Abrir la URL HTTPS resultante.
6. Iniciar sesión con una de las dos cuentas creadas en Authentication. Se conserva la sesión en el navegador.
7. Para instalar: desde el navegador, usar 'Añadir a pantalla de inicio' / 'Instalar aplicación' cuando esté disponible.

NOTAS:
- Requiere conexión a internet para guardar y consultar. NO hay registro offline en esta versión.
- Las claves públicas pueden estar en GitHub; NUNCA publicar contraseña de usuario, contraseña de base, service_role ni secret key.
- Los movimientos no se pueden borrar desde la app. El registro de cancelación total usa la RPC transaccional existente.
- PDF A5, equivalente a media hoja A4; compartir depende del navegador y sistema operativo.
- Para seguridad real, validar las funciones y políticas SQL existentes antes de producción; esta versión es de pruebas.
- El menú 'Historial' permite ver cuentas en cero.
- El administrador y operador tienen funciones de registro; anulación administrativa no incluida en V1.0.

V1.1: El formulario de nuevo cliente está oculto inicialmente y se abre con el botón Nuevo cliente. La lista muestra por defecto solo clientes con saldo positivo, ordenados por deuda descendente. Al buscar se muestran también los clientes sin deuda. No se modificaron los procedimientos RPC ni la base de datos.

V1.2:
- IMPORTANTE: Antes de usar Administración, ejecutar INSTALAR_V1_2.sql en SQL Editor de Supabase.
- El rol en perfiles debe ser 'admin' (sin distinguir mayúsculas). Si tu rol tiene otra denominación, verificarlo antes de instalar.
- Administración: editar nombre, teléfono, observación; eliminar cliente y todos sus movimientos con doble confirmación. Es irreversible; respaldar antes de borrar datos reales.
- Créditos: varias líneas de productos con cantidad y precio unitario. Se guardan como UN movimiento con detalle textual (máximo 300 caracteres), sin cambiar las tablas existentes. Para créditos extensos, dividir operaciones. No es inventario.
- Cancelar abandona el formulario sin guardar. El selector muestra solo el nombre. El listado destaca saldos en rojo.
- No se ejecutó una prueba contra tu Supabase de producción. Prueba primero con un cliente ficticio.
