
## Guía de ejecución — Demoblaze

### Prerequisitos

| Requisito | Versión mínima |
|---|---|
| Java | 17 |
| Maven | 3.8+ (o usar el wrapper incluido `mvnw`) |
| Conexión a internet | Requerida (la API es pública) |

> No se requiere instalar Karate por separado. Las dependencias se descargan automáticamente con Maven.

---

### 1. Clonar y preparar el proyecto

```bash
git clone https://github.com/MatiasNuniez/reto_karate_demoblaze.git
cd api_karate
```

---

### 2. Ejecutar todos los tests

**Linux / macOS:**
```bash
./mvnw test
```

**Windows (PowerShell):**
```powershell
.\mvnw.cmd test
```

---

### 6. Ver el reporte HTML

Después de cada ejecución, Karate genera un reporte en:

```
target/karate-reports/karate-summary.html
```

Abrirlo directamente en el navegador:
```powershell
Start-Process "target\karate-reports\karate-summary.html"
```

---

### Escenarios incluidos

| Feature | Escenario | Tags |
|---|---|---|
| `signup.feature` | Crear un nuevo usuario exitosamente | `@smoke @regression` |
| `signup.feature` | Intentar registrar un usuario ya existente | `@negative @regression` |
| `login.feature` | Login con credenciales correctas retorna token | `@smoke @regression @auth` |
| `login.feature` | Login con password incorrecto retorna error | `@negative @regression` |

## Documentación clave

- `.github/README.md`
- `.github/AGENTS.md`
- `.github/copilot-instructions.md`
- `.github/instructions/karate.instructions.md`
- `.github/specs/README.md`

## Nota sobre la versión de Karate

El template queda pinneado en **Karate 1.5.2**. Según las notas oficiales de **v1.5.0**, desde esa serie Karate requiere **Java 17** y el Maven `group-id` cambió de `com.intuit.karate` a `io.karatelabs`, mientras los imports Java siguen en `com.intuit.karate.*` en la serie `1.5.x`. Fuente oficial:

- https://github.com/karatelabs/karate/releases

---