import 'package:app_ui/app_ui.dart';
import 'package:doctor/app/cubit/app_base_cubit.dart';
import 'package:doctor/deep_links/deep_links.dart';
import 'package:doctor/login/cubit/login_cubit.dart';
import 'package:doctor/navigation/observer/app_navigator_observer.dart';
import 'package:doctor/router/app_router.dart';
import 'package:doctor/signup/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  const App({
    required UserRepository userRepository,
    super.key,
  }) : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => AppRouter(
            navigatorObservers: [
              AppNavigatorObserver(),
            ],
          ),
          dispose: (_, AppRouter appRouter) => appRouter.dispose(),
        ),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: _userRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AppBaseCubit(),
              lazy: false,
            ),
            BlocProvider(
              create: (_) => LoginCubit(
                userRepository: _userRepository,
              ),
              lazy: false,
            ),
            BlocProvider(
              create: (_) => SignupCubit(
                userRepository: _userRepository,
              ),
              lazy: false,
            ),
            BlocProvider(
              create: (_) => DeepLinksCubit(
                routeUriStream: ConcatStream([]), //TODO Ashish
                userRepository: _userRepository,
              ),
              lazy: false,
            ),
          ],
          child: DeepLinksListener(
            child: const AppView(),
          ),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter.of(context);

    return MaterialApp.router(
      themeMode: ThemeMode.dark,
      theme: const AppTheme().themeData,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
    );
  }
}
