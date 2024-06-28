import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orb_mobile/l10n/l10n.dart';
import 'package:orb_mobile/login/cubit/login_cubit.dart';
import 'package:platform/platform.dart';
import 'package:provider/provider.dart';

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
    this.localPlatform = const LocalPlatform(),
    super.key,
  });

  final Platform localPlatform;
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
    final isHomeFeedLoading = context.select(
        (LoginCubit cubit) => cubit.state.loginStatus == LoginStatus.checking);

    return Center(
      child: Text(
        context.l10n.appBarTitle ?? 'sadasd',
        style: AppTextStyles.headline1.copyWith(
          color: AppColors.primaryBlack,
        ),
      ),
    );
  }
}
