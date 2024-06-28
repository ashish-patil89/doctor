import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:orb_mobile/l10n/l10n.dart';

class AppBase extends StatefulWidget {
  const AppBase({super.key});

  @override
  State<AppBase> createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          context.l10n.appBarTitle,
          style: AppTextStyles.largeTitle1.copyWith(
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
