import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orb_mobile/l10n/l10n.dart';
import 'package:orb_mobile/signup/cubit/cubit.dart';

class SignupInputAction extends StatefulWidget {
  const SignupInputAction({
    super.key,
  });

  @override
  State<SignupInputAction> createState() => _SignupInputActionState();
}

class _SignupInputActionState extends State<SignupInputAction> {
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeName = FocusNode();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController()..addListener(_nameValueChanged);
    _emailController = TextEditingController()..addListener(_emailValueChanged);
    _passwordController = TextEditingController()
      ..addListener(_passwordValueChanged);
  }

  void _nameValueChanged() {
    context.read<SignupCubit>().updateName(_nameController.text.toLowerCase());
  }

  void _emailValueChanged() {
    context
        .read<SignupCubit>()
        .updateEmail(_emailController.text.toLowerCase());
  }

  void _passwordValueChanged() {
    context.read<SignupCubit>().updatePassword(_passwordController.text);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final agreedOnTerms = context.select(
      (SignupCubit cubit) => cubit.state.agreedOnTerms,
    );

    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.signupInvalid?.isNotEmpty ?? false) {
          if (context.mounted) {
            context.read<SignupCubit>().resetErrors();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    state.signupInvalid ?? '',
                  ),
                ),
              );
          }
        }
        if (state.emailInvalid?.isNotEmpty ?? false) {
          if (context.mounted) {
            focusNodeEmail.requestFocus();
            context.read<SignupCubit>().resetErrors();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    state.emailInvalid ?? '',
                  ),
                ),
              );
          }
        }
        if (state.passwordInvalid?.isNotEmpty ?? false) {
          if (context.mounted) {
            focusNodePassword.requestFocus();
            context.read<SignupCubit>().resetErrors();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    state.passwordInvalid ?? '',
                  ),
                ),
              );
          }
        }
        if (state.signupStatus == SignupStatus.success) {
          if (context.mounted) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    'Success',
                  ),
                ),
              );
          }
        }
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Name
                Text(
                  context.l10n.name,
                  style: AppTextStyles.callout.copyWith(
                    color: AppColors.secondaryBlack,
                  ),
                ),
                Gap(AppSpacing.spacing5),
                AppTextField.primary(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  controller: _nameController,
                  focusNode: focusNodeName,
                  showUnderlineInputBorder: true,
                  border: Border.all(color: AppColors.whiteBorder),
                  style: AppTextStyles.bodyText1
                      .copyWith(color: AppColors.secondaryBlack),
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  onChanged: (s) {},
                  onSubmitted: (s) {},
                ),

                /// Email
                Gap(AppSpacing.spacing20),
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
                Row(
                  children: [
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      value: agreedOnTerms ?? false,
                      onChanged: (value) {
                        context.read<SignupCubit>().updateAgreeOnTerms(value);
                      },
                    ),
                    Flexible(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: context.l10n.agreeWith,
                              style: AppTextStyles.callout.copyWith(
                                color: AppColors.primaryBlack,
                              ),
                            ),
                            TextSpan(
                              text: ' ',
                            ),
                            TextSpan(
                              text: context.l10n.termsConditions,
                              style: AppTextStyles.callout.copyWith(
                                color: AppColors.primaryGreen,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(AppSpacing.spacing20),
                AppButton.fullWidth(
                  buttonColor: AppColors.primaryOrange,
                  onPressed: () async {
                    context.read<SignupCubit>().signup();
                  },
                  child: Text(context.l10n.createAccount),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
