import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

/// Different types of [LoadingType].
enum LoadingType {
  /// Normal loading indicator.
  normal,

  /// Shimmer loading indicator for texts.
  textShimmer,

  /// Shimmer loading indicator for blocks.
  blockShimmer,

  /// Orb loading indicator.
  orb,
}

/// Common widget used for showing loading indicator.
class LoadingWidget extends StatelessWidget {
  /// Creates a loading widget.
  const LoadingWidget({
    required this.type,
    this.width,
    this.height,
    this.borderRadius,
    this.border,
    this.baseColor,
    this.highlightColor,
    this.useWhiteLogo = true,
    super.key,
  });

  /// Default text shimmer loader size.
  static const defaultTextShimmerSize = Size(30, 14);

  /// Default block shimmer loader size.
  static const defaultBlockShimmerSize = Size(double.infinity, 100);

  /// Default orb loader size.
  static const defaultOrbLoaderSize = Size(40, 40);

  /// The type of this loading widget.
  final LoadingType type;

  /// The optional width of this loading widget.
  final double? width;

  /// The optional height of this loading widget.
  final double? height;

  /// The optional border radius of this loading widget.
  final BorderRadius? borderRadius;

  /// The optional border of this loading widget.
  final Border? border;

  /// The optional base color of this loading widget.
  final Color? baseColor;

  /// The optional highlight color of this loading widget.
  final Color? highlightColor;

  /// The optional boolean to use white logo for [LoadingType.orb].
  final bool useWhiteLogo;

  @override
  Widget build(BuildContext context) {
    late final Widget widget;

    switch (type) {
      case LoadingType.normal:
        widget = RepaintBoundary(
          child: Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(
                baseColor ?? AppColors.primaryGreen,
              ),
            ),
          ),
        );
      case LoadingType.textShimmer:
        widget = Shimmer(
          gradient: LinearGradient(
            colors: <Color>[
              baseColor ?? AppColors.primaryWhite.withOpacity(0.55),
              baseColor ?? AppColors.primaryWhite.withOpacity(0.55),
              highlightColor ?? AppColors.primaryWhite.withOpacity(0.62),
              baseColor ?? AppColors.primaryWhite.withOpacity(0.55),
              baseColor ?? AppColors.primaryWhite.withOpacity(0.55),
            ],
            stops: const <double>[0, 0.35, 0.5, 0.65, 1],
          ),
          child: Container(
            height: height ?? defaultTextShimmerSize.height,
            width: width ?? defaultTextShimmerSize.width,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: border,
              color: baseColor ?? AppColors.primaryWhite.withOpacity(0.4),
            ),
          ),
        );
      case LoadingType.blockShimmer:
        widget = Container(
          width: width ?? defaultBlockShimmerSize.width,
          height: height ?? defaultBlockShimmerSize.height,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(32),
            border: border,
          ),
          child: Shimmer(
            gradient: LinearGradient(
              colors: <Color>[
                baseColor ?? AppColors.primaryWhite.withOpacity(0.55),
                baseColor ?? AppColors.primaryWhite.withOpacity(0.55),
                highlightColor ?? AppColors.primaryWhite.withOpacity(0.62),
                baseColor ?? AppColors.primaryWhite.withOpacity(0.55),
                baseColor ?? AppColors.primaryWhite.withOpacity(0.55),
              ],
              stops: const <double>[0, 0.35, 0.5, 0.65, 1],
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: borderRadius ?? BorderRadius.circular(32),
                border: border,
              ),
            ),
          ),
        );
      case LoadingType.orb:
        final loader = Lottie.asset(
          Assets.lottie.orbLogo,
          repeat: true,
          width: width ?? defaultOrbLoaderSize.width,
          height: height ?? defaultOrbLoaderSize.height,
        );
        widget = RepaintBoundary(
          child: useWhiteLogo
              ? loader
              : ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    AppColors.primaryBlack,
                    BlendMode.modulate,
                  ),
                  child: loader,
                ),
        );
    }

    return widget;
  }
}
