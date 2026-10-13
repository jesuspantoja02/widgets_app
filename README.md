# widgets_app

Aplicación de aprendizaje en **Flutter** para practicar widgets, navegación y gestión de estado. Incluye un menú lateral con pantallas de ejemplo y temas dinámicos con **Riverpod** y **go_router**.

Este repositorio es parte del aprendizaje obtenido en el **curso de Flutter de Fernando Herrera en Udemy**. Instructor: [Fernando Herrera](https://www.linkedin.com/in/fernando-herrera-b6b204200/) (LinkedIn).

## Características

- Navegación declarativa con [go_router](https://pub.dev/packages/go_router)
- Estado global con [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
- Tema de la app configurable (color seed y modo oscuro vía `AppTheme` + `themeNotifierProvider`)
- Animaciones con [animate_do](https://pub.dev/packages/animate_do)

### Pantallas

| Ruta | Contenido |
|------|-----------|
| `/` | Inicio y menú |
| `/counter` | Contador con Riverpod |
| `/buttons` | Botones |
| `/cards` | Tarjetas |
| `/progress` | Indicadores de progreso |
| `/snackbar` | Snackbars y diálogos |
| `/animated-container` | `AnimatedContainer` |
| `/ui-controls` | Controles y tiles (Switch, Radio, etc.) |
| `/tutorial` | Tutorial introductorio |
| `/infinite-scroll` | Lista infinita y pull to refresh |
| `/theme-changer` | Selector de color del tema |

## Requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) compatible con **Dart ^3.12.2** (ver `pubspec.yaml`)
- Un dispositivo/emulador o escritorio habilitado (`flutter doctor`)

## Cómo ejecutar

```bash
git clone <url-del-repositorio>
cd widgets_app
flutter pub get
flutter run
```

Analizar el proyecto:

```bash
dart analyze
flutter test
```

## Estructura del proyecto

```
lib/
├── config/          # Tema, menú, rutas (go_router)
├── main.dart        # ProviderScope y MaterialApp.router
└── presentation/    # Pantallas, widgets y providers Riverpod
assets/images/       # Imágenes de la app
```

## Dependencias principales

- `flutter_riverpod` — providers y `StateNotifier`
- `go_router` — rutas
- `animate_do` — animaciones

## Qué no subir a Git

El `.gitignore` excluye artefactos de compilación (`build/`, `.dart_tool/`), cachés de pub, archivos de IDE, `.env` y claves de firma (ver también `android/.gitignore` e `ios/.gitignore`). **No commitees** keystores (`.jks`, `.keystore`) ni `key.properties`.

## Licencia

Proyecto educativo; añade una licencia si publicas el repositorio.
