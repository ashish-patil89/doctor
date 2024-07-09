import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orb_mobile/l10n/l10n.dart';
import 'package:orb_mobile/login/cubit/login_cubit.dart';
import 'package:orb_mobile/login/login.dart';
import 'package:orb_mobile/router/app_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });

  static const appBarHeight = 42.0 +
      AppConstants.appBarButtonsTopPadding +
      AppConstants.appBarButtonsBottomPadding;

  @override
  State<LoginView> createState() => _FeedViewState();
}

class _FeedViewState extends State<LoginView> {
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
    final isLoginProcessing = context.select(
      (LoginCubit cubit) => cubit.state.loginStatus == LoginStatus.checking,
    );

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.loginStatus == LoginStatus.success) {
          AppRouter.of(context).push(
            const HomeRoute(),
          );
        }
      },
      listenWhen: (previous, current) {
        return previous.loginStatus != current.loginStatus;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 196,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Assets.images.logo.image(),
                    ),
                  ),
                  Gap(AppSpacing.spacing30),
                  Text(
                    context.l10n.signIn,
                    style: AppTextStyles.headline1
                        .copyWith(color: AppColors.primaryBlack),
                  ),
                  Gap(AppSpacing.spacing13),
                  Text(
                    context.l10n.loginHeaderMessage,
                    style: AppTextStyles.callout
                        .copyWith(color: AppColors.secondaryBlack),
                  ),
                  Gap(AppSpacing.spacing54),
                  LoginInputAction(),
                ],
              ),
              if (isLoginProcessing)
                LoadingWidget(
                  type: LoadingType.normal,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
