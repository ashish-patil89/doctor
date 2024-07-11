import 'package:app_ui/app_ui.dart';
import 'package:doctor/l10n/l10n.dart';
import 'package:flutter/material.dart';

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
