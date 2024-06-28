import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppButtonsPage extends StatelessWidget {
  const AppButtonsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const AppButtonsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: ListView(
          shrinkWrap: true,
          children: [
            const Center(
              child: Text(
                'Primary',
                style: AppTextStyles.bodyText1,
              ),
            ),
            const Gap(AppSpacing.lg),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  children: [
                    Center(
                      child: AppButton.primary(
                        icon: Assets.icons.search.svg(),
                        padding: const EdgeInsets.fromLTRB(17, 18, 17, 18),
                        onPressed: () {},
                      ),
                    ),
                    const Gap(AppSpacing.lg),
                    Center(
                      child: AppButton.primary(
                        icon: Assets.icons.add.svg(),
                        onPressed: () {},
                        child: const Text('Primary'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(AppSpacing.xlg),
            const Center(
              child: Text(
                'Secondary',
                style: AppTextStyles.bodyText1,
              ),
            ),
            const Gap(AppSpacing.lg),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: AppButton.secondary(
                    icon: Assets.icons.bell.svg(),
                    child: const Text('3'),
                    onPressed: () {},
                  ),
                ),
                const Gap(AppSpacing.xs),
                Center(
                  child: AppButton.secondary(
                    icon: Assets.icons.menu.svg(),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const Gap(AppSpacing.lg),
            Center(
              child: AppButton.secondary(
                child: const Text('Secondary'),
                onPressed: () {},
              ),
            ),
            const Gap(AppSpacing.lg),
            Center(
              child: AppButton.secondary(
                child: const Text('Secondary Disabled'),
              ),
            ),
            const Gap(AppSpacing.lg),
          ],
        ),
      ),
    );
  }
}
