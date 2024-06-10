# doctor

## Prerequisites 🛠️

1. Make sure that you have correct Flutter version installed. The version of Flutter that this project requires is defined in the [pubspec.yaml](pubspec.yaml) file under the `environment` section. Consider using [fvm](https://github.com/leoafarias/fvm) if you need to have multiple versions of Flutter installed on your machine.
2. Make sure that you have correct CocoaPods version installed. The version of CocoaPods that this project requires is defined at the end of the [Podfile.lock](ios/Podfile.lock) file. It is recommended to use [rvm](https://github.com/rvm/rvm) or [rbenv](https://github.com/rbenv/rbenv) to install CocoaPods.

---

## Getting Started 🚀

This project contains 2 flavors:

- development
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Doctor Mobile works on iOS, Android, but is primarily developed for Mobile platforms._

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "appBarTitle": "Orb",
    "@appBarTitle": {
        "description": "Text shown in the AppBar of the Home Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "appBarTitle": "Orb",
    "@appBarTitle": {
        "description": "Text shown in the AppBar of the Home Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:orb_mobile/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
    <array>
        <string>en</string>
    </array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "appBarTitle": "Orb",
    "@appBarTitle": {
        "description": "Text shown in the AppBar of the Home Page"
    }
}
```

### Generating Translations

To use the latest translations changes, you will need to generate them:

1. Generate localizations for the current project:

```sh
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

Alternatively, run `flutter run` and code generation will take place automatically.

[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization