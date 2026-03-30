## HTTP 200 para todo — incluyendo errores
La API nunca retorna un error del tipo 400. Todos los errores funcionales vienen en HTTP 200 con un body {"errorMessage": "..."}. Esto es una mala práctica REST y nos permite identificar el error rapido. Lo bueno es que con Karate podemos manejarlo con match response == el objeto JSON.

## Los errores son JSON, el éxito es string vacío
El body de un registro exitoso es "" — un string vacío, no un objeto. Esto rompe la expectativa de una API JSON. Tenemos que validar con un solo requisito -> status 200.

## El password viaja en Base64, no cifrado
La API requiere el password codificado en Base64 (dGVzdDEyMzQ=). Esto no es seguridad real — Base64 es reversible. En un proyecto real habría que elevar esto como hallazgo de seguridad.