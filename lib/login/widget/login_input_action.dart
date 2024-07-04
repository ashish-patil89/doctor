import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orb_mobile/l10n/l10n.dart';
import 'package:orb_mobile/login/cubit/login_cubit.dart';
import 'package:orb_mobile/router/app_router.dart';

class LoginInputAction extends StatefulWidget {
  const LoginInputAction({
    super.key,
  });

  @override
  State<LoginInputAction> createState() => _LoginInputActionState();
}

class _LoginInputActionState extends State<LoginInputAction> {
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodePassword = FocusNode();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController()..addListener(_emailValueChanged);
    _passwordController = TextEditingController()
      ..addListener(_passwordValueChanged);
  }

  void _emailValueChanged() {
    context.read<LoginCubit>().updateEmail(_emailController.text.toLowerCase());
  }

  void _passwordValueChanged() {
    context.read<LoginCubit>().updatePassword(_passwordController.text);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.email,
                style: AppTextStyles.callout
                    .copyWith(color: AppColors.secondaryBlack),
              ),
              Gap(AppSpacing.spacing5),
              AppTextField.primary(
                padding: EdgeInsets.symmetric(horizontal: 16),
                controller: _emailController,
                focusNode: focusNodeEmail,
                showUnderlineInputBorder: true,
                border: Border.all(color: AppColors.whiteBorder),
                style: AppTextStyles.bodyText1
                    .copyWith(color: AppColors.secondaryBlack),
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                onChanged: (s) {},
                onSubmitted: (s) {},
              ),
              Gap(AppSpacing.spacing20),
              Text(
                context.l10n.password,
                style: AppTextStyles.callout
                    .copyWith(color: AppColors.secondaryBlack),
              ),
              Gap(AppSpacing.spacing5),
              AppTextField.primary(
                padding: EdgeInsets.symmetric(horizontal: 16),
                controller: _passwordController,
                focusNode: focusNodePassword,
                showUnderlineInputBorder: true,
                style: AppTextStyles.bodyText1
                    .copyWith(color: AppColors.secondaryBlack),
                border: Border.all(color: AppColors.whiteBorder),
                keyboardType: TextInputType.text,
                obscureText: true,
                onChanged: (s) {},
                onSubmitted: (s) {},
              ),
              Gap(AppSpacing.spacing13),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  context.l10n.forgotPassword,
                  style: AppTextStyles.callout
                      .copyWith(color: AppColors.primaryGreen),
                ),
              ),
              Gap(AppSpacing.spacing20),
              AppButton.fullWidth(
                buttonColor: AppColors.primaryOrange,
                onPressed: () async {
                  context.read<LoginCubit>().login();
                },
                child: Text(context.l10n.signIn),
              ),
              Gap(AppSpacing.spacing20),
              AppButtonOutlined.primary(
                onPressed: () async {
                  AppRouter.of(context).push(SignupRoute());
                },
                withTransparentBackground: true,
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: AppColors.primaryOrange,
                ),
                title: Text(
                  context.l10n.createAccount,
                  style: AppTextStyles.bodyText1.copyWith(
                    color: AppColors.primaryOrange,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
