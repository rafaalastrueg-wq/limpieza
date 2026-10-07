# En orden — puesta en marcha

## Archivos de la app

Mantén juntos `en-orden.html`, `app.js` y `Estatutos_Limpieza_Piso.pdf` al publicar la app en HTTPS. Ejecuta `configurar-supabase.sql` desde el **SQL Editor** de tu proyecto Supabase.

En Supabase, copia la **Project URL** y la **publishable key**. En un móvil, abre **Conectar móviles**, introduce esos datos y comparte el código privado generado con los otros dos móviles. Los tres deben abrir la misma dirección web y usar el mismo código.

## Limpiezas e informes

Cada firma digital requiere nombre, fecha y una foto de la zona ya limpia. La firma digital sustituye al cuadrante en papel. La app refresca las firmas compartidas cada cinco segundos.

Si alguien no firma su zona durante su semana, la semana siguiente le toca limpiar las tres zonas. El castigo se quita al completar y firmar las tres; si vuelve a incumplir, continúa. El informe semanal descarga un PNG con el resultado, las firmas, los castigos y las fotos.
