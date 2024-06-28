import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'bootstrap_io.dart' if (dart.library.html) 'bootstrap_web.dart';

typedef AppBuilder = Future<Widget> Function({
  required FlutterSecureStorage secureStorage,
  required SharedPreferences sharedPreferences,
});
