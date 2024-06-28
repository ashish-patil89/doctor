import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';

/// {@template info_widgets}
/// A widget used to show information.
/// {@endtemplate}
class InfoWidget extends StatelessWidget {
  /// {@macro info_widgets}
  const InfoWidget({
    required this.info,
    required this.title,
    required this.onTap,
    this.isLocalHero = false,
    this.heroTag,
    super.key,
  });

  /// The title of the widget.
  final String title;

  /// The description of the widget.
  final String info;

  /// The callback to be called when the widget is tapped.
  final GestureTapCallback onTap;

  /// Whether the widget should be wrapped in a [LocalHero].
  final bool isLocalHero;

  /// The hero tag for the widget.
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.menu,
          borderRadius: BorderRadius.circular(AppSpacing.lg),
        ),
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyles.calloutBold.copyWith(
                    color: AppColors.primaryBlack,
                  ),
                ),
                if (isLocalHero)
                  LocalHero(
                    tag: heroTag!,
                    child: Assets.icons.closeDark.svg(),
                  )
                else
                  Assets.icons.closeDark.svg(),
              ],
            ),
            const Gap(AppSpacing.sm),
            Text(
              info,
              style: AppTextStyles.callout.copyWith(
                color: AppColors.black60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
