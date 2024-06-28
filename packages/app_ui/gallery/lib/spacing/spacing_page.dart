import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SpacingPage());
  }

  @override
  Widget build(BuildContext context) {
    const spacingList = [
      _SpacingItem(spacing: AppSpacing.xxxs, name: 'xxxs (1pt)'),
      _SpacingItem(spacing: AppSpacing.xxs, name: 'xxs (2pt)'),
      _SpacingItem(spacing: AppSpacing.xs, name: 'xs (4pt)'),
      _SpacingItem(spacing: AppSpacing.sm, name: 'sm (8pt)'),
      _SpacingItem(spacing: AppSpacing.md, name: 'md (12pt)'),
      _SpacingItem(spacing: AppSpacing.lg, name: 'lg (16pt)'),
      _SpacingItem(spacing: AppSpacing.xlg, name: 'xlg (24pt)'),
      _SpacingItem(spacing: AppSpacing.xxlg, name: 'xxlg (40pt)'),
      _SpacingItem(spacing: AppSpacing.xxxlg, name: 'xxxlg (64pt)'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Spacing')),
      body: ListView(
        shrinkWrap: true,
        children: spacingList,
      ),
    );
  }
}

class _SpacingItem extends StatelessWidget {
  const _SpacingItem({required this.spacing, required this.name});

  final double spacing;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Row(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                color: AppColors.primaryWhite,
                width: AppSpacing.xxs,
                height: AppSpacing.lg,
              ),
              Container(
                width: spacing,
                height: AppSpacing.lg,
                color: AppColors.white38,
              ),
              Container(
                color: AppColors.primaryWhite,
                width: AppSpacing.xxs,
                height: AppSpacing.lg,
              ),
            ],
          ),
          const Gap(AppSpacing.sm),
          Text(name),
        ],
      ),
    );
  }
}
