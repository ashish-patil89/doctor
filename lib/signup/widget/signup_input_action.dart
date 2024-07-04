import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
  FocusNode focusNodePhone = FocusNode();

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController()..addListener(_nameValueChanged);
    _phoneController = TextEditingController()..addListener(_phoneValueChanged);
    _emailController = TextEditingController()..addListener(_emailValueChanged);
    _passwordController = TextEditingController()
      ..addListener(_passwordValueChanged);
  }

  void _nameValueChanged() {
    context.read<SignupCubit>().updateName(_nameController.text.toLowerCase());
  }

  void _phoneValueChanged() {
    try {
      final phone = int.tryParse(_phoneController.text);
      context.read<SignupCubit>().updatePhone(phone);
    } catch (e) {}
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
    final dob = context.select(
      (SignupCubit cubit) => cubit.state.dob,
    );
    final gender = context.select(
      (SignupCubit cubit) => cubit.state.gender,
    );
    final agreedOnTerms = context.select(
      (SignupCubit cubit) => cubit.state.agreedOnTerms,
    );
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Name
              Text(
                context.l10n.name,
                style: AppTextStyles.callout
                    .copyWith(color: AppColors.secondaryBlack),
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

              /// Number
              Gap(AppSpacing.spacing20),
              Text(
                context.l10n.number,
                style: AppTextStyles.callout
                    .copyWith(color: AppColors.secondaryBlack),
              ),
              Gap(AppSpacing.spacing5),
              AppTextField.primary(
                padding: EdgeInsets.symmetric(horizontal: 16),
                controller: _phoneController,
                focusNode: focusNodePhone,
                showUnderlineInputBorder: true,
                border: Border.all(color: AppColors.whiteBorder),
                style: AppTextStyles.bodyText1
                    .copyWith(color: AppColors.secondaryBlack),
                keyboardType: TextInputType.phone,
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

              /// DOB
              Gap(AppSpacing.spacing20),
              Text(
                context.l10n.dateOfBirth,
                style: AppTextStyles.callout
                    .copyWith(color: AppColors.secondaryBlack),
              ),
              Gap(AppSpacing.spacing5),
              AppButtonOutlined.primary(
                title: Text(
                  dob ?? '',
                  style: AppTextStyles.bodyText1.copyWith(
                    color: AppColors.secondaryBlack,
                  ),
                ),
                textAlignment: Alignment.centerLeft,
                withTransparentBackground: true,
                borderSide: const BorderSide(
                  color: AppColors.whiteBorder,
                ),
                suffixChild: Assets.icons.calendar.svg(
                  colorFilter: const ColorFilter.mode(
                    AppColors.primaryOrange,
                    BlendMode.dstIn,
                  ),
                ),
                onPressed: () async {
                  final dateOfBirth = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (dateOfBirth != null) {
                    final dobStr = DateFormat('dd-MM-yyyy').format(dateOfBirth);
                    context.read<SignupCubit>().updateDob(dobStr);
                  }
                },
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),

              /// Gender
              Gap(AppSpacing.spacing20),
              Text(
                context.l10n.gender,
                style: AppTextStyles.callout
                    .copyWith(color: AppColors.secondaryBlack),
              ),
              Gap(AppSpacing.spacing5),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButtonOutlined.primary(
                    title: Text(
                      context.l10n.male,
                      style: AppTextStyles.bodyText1.copyWith(
                        color: gender == Gender.male
                            ? AppColors.primaryWhite
                            : AppColors.secondaryBlack,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: gender == Gender.male
                          ? AppColors.primaryOrange
                          : AppColors.secondaryBlack,
                    ),
                    buttonColor:
                        gender == Gender.male ? AppColors.primaryOrange : null,
                    maxSize: Size(100, 45),
                    withTransparentBackground: gender != Gender.male,
                    onPressed: () async {
                      context.read<SignupCubit>().updateGender(Gender.male);
                    },
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  Gap(AppSpacing.spacing15),
                  AppButtonOutlined.primary(
                    title: Text(
                      context.l10n.female,
                      style: AppTextStyles.bodyText1.copyWith(
                        color: gender == Gender.female
                            ? AppColors.primaryWhite
                            : AppColors.secondaryBlack,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: gender == Gender.female
                          ? AppColors.primaryOrange
                          : AppColors.secondaryBlack,
                    ),
                    buttonColor: gender == Gender.female
                        ? AppColors.primaryOrange
                        : null,
                    maxSize: Size(100, 45),
                    withTransparentBackground: gender != Gender.female,
                    onPressed: () async {
                      context.read<SignupCubit>().updateGender(Gender.female);
                    },
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  Gap(AppSpacing.spacing15),
                  AppButtonOutlined.primary(
                    title: Text(
                      context.l10n.other,
                      style: AppTextStyles.bodyText1.copyWith(
                        color: gender == Gender.other
                            ? AppColors.primaryWhite
                            : AppColors.secondaryBlack,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: gender == Gender.other
                          ? AppColors.primaryOrange
                          : AppColors.secondaryBlack,
                    ),
                    buttonColor:
                        gender == Gender.other ? AppColors.primaryOrange : null,
                    maxSize: Size(100, 45),
                    withTransparentBackground: gender != Gender.other,
                    onPressed: () async {
                      context.read<SignupCubit>().updateGender(Gender.other);
                    },
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ],
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
    );
  }
}
