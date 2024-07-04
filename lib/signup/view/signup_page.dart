import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orb_mobile/l10n/l10n.dart';
import 'package:orb_mobile/login/cubit/login_cubit.dart';
import 'package:orb_mobile/signup/widget/signup_input_action.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SignupView();
  }
}

class SignupView extends StatefulWidget {
  const SignupView({
    super.key,
  });

  static const appBarHeight = 42.0 +
      AppConstants.appBarButtonsTopPadding +
      AppConstants.appBarButtonsBottomPadding;

  @override
  State<SignupView> createState() => _FeedViewState();
}

class _FeedViewState extends State<SignupView> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Gap(AppConstants.appBarHeight),
                Text(
                  context.l10n.createAccountSignupTitle,
                  style: AppTextStyles.headline1
                      .copyWith(color: AppColors.primaryBlack),
                ),
                Gap(AppSpacing.spacing13),
                Text(
                  context.l10n.createAccountSignupSubTitle,
                  style: AppTextStyles.callout
                      .copyWith(color: AppColors.secondaryBlack),
                ),
                Gap(AppSpacing.spacing54),
                SignupInputAction(),
              ],
            ),
            if (isLoginProcessing)
              LoadingWidget(
                type: LoadingType.normal,
              ),
          ],
        ),
      ),
    );
  }
}
