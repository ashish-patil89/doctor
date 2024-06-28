import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const TypographyPage());
  }

  @override
  Widget build(BuildContext context) {
    final textStyleList = [
      const _TextItem(name: 'Large Title 1', style: AppTextStyles.largeTitle1),
      const _TextItem(name: 'Headline 1', style: AppTextStyles.headline1),
      const _TextItem(name: 'Headline 2', style: AppTextStyles.headline2),
      const _TextItem(name: 'Headline 3', style: AppTextStyles.headline3),
      const _TextItem(name: 'Body 1', style: AppTextStyles.bodyText1),
      const _TextItem(name: 'Body 2', style: AppTextStyles.bodyText2),
      const _TextItem(name: 'Callout', style: AppTextStyles.callout),
      const _TextItem(name: 'Caption', style: AppTextStyles.caption),
      const _TextItem(name: 'Caption 2', style: AppTextStyles.caption2),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Typography')),
      body: ListView(shrinkWrap: true, children: textStyleList),
    );
  }
}

class _TextItem extends StatelessWidget {
  const _TextItem({required this.name, required this.style});

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.lg,
      ),
      child: Text(name, style: style),
    );
  }
}
