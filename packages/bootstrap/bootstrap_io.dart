import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bootstrap.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    developer.log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(AppBuilder builder) async {
  await runZonedGuarded(
    () async {
      Bloc.observer = const AppBlocObserver();

      WidgetsFlutterBinding.ensureInitialized();

      // Stringify equatable objects (e.g. errors)
      // before sending them to Sentry.
      EquatableConfig.stringify = true;

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      runApp(
        await builder(
          secureStorage: const FlutterSecureStorage(),
          sharedPreferences: await SharedPreferences.getInstance(),
        ),
      );
    },
    (exception, stackTrace) async {
      developer.log('Uncaught exception: $exception\n$stackTrace');
    },
  );
}
