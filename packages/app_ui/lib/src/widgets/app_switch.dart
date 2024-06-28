import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';

/// {@template app_switch}
/// The app switch.
/// {@endtemplate}
class AppSwitch extends StatelessWidget {
  /// {@macro app_switch}
  const AppSwitch._({
    this.enabled,
    this.onChange,
    this.activeColor,
    super.key,
  });

  /// The primary app-switch.
  const AppSwitch.primary({
    bool? enabled,
    ValueChanged<bool>? onChange,
    Color? activeColor,
    Key? key,
  }) : this._(
          key: key,
          enabled: enabled ?? false,
          onChange: onChange,
          activeColor: activeColor,
        );

  /// The switch state.
  final bool? enabled;

  /// The change notifier.
  final ValueChanged<bool>? onChange;

  /// The active color.
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: enabled ?? false,
      onChanged: onChange,
      activeColor: activeColor ?? AppColors.primaryBlack,
    );
  }
}
