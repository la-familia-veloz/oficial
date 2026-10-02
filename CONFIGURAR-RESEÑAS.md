# Configurar las reseñas

Las reseñas usan Supabase para guardar los envíos. Antes de activarlas:

1. Crea un proyecto en Supabase.
2. En **SQL Editor**, ejecuta el contenido de `supabase-reviews.sql`.
3. En **Project Settings → API**, copia la URL del proyecto y su clave pública `anon`/publishable. No uses la clave `service_role` en la página.
4. Pega esos valores en `supabase-config.js`:

   ```js
   window.SUPABASE_CONFIG = {
       url: 'https://TU-PROYECTO.supabase.co',
       anonKey: 'TU-CLAVE-PUBLICA'
   };
   ```

5. Publica el sitio por HTTPS y, si Supabase restringe los orígenes permitidos, autoriza el dominio del sitio.
6. Para moderar los envíos, abre **Table Editor → reviews** en Supabase y cambia `status` de `pending` a `approved`. Para descartar uno, usa `rejected`.

La página solo consulta reseñas aprobadas. Los envíos nuevos quedan pendientes y el navegador nunca debe recibir una clave `service_role`.
