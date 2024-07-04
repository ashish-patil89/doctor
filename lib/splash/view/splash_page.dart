import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orb_mobile/router/app_router.dart';
import 'package:orb_mobile/splash/cubit/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..init(),
      child: const SplashView(),
    );
    ;
  }
}

class SplashView extends StatefulWidget {
  const SplashView({
    super.key,
  });

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isHomeFeedLoading = context.select((SplashCubit cubit) =>
        cubit.state.splashStatus == SplashStatus.initial);

    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state.splashStatus == SplashStatus.success) {
          AppRouter.of(context).push(
            const LoginRoute(),
          );
        }
      },
      listenWhen: (previous, current) {
        return previous.splashStatus != current.splashStatus;
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28),
        color: AppColors.primaryGreen,
        child: Center(
          child: Assets.images.logoSplash.image(),
        ),
      ),
    );
  }
}
