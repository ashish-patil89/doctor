import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// The dimension of the thumbnail.
enum ThumbnailDimension {
  /// 128x128.
  dimension128._('thumbnailDimension128'),

  /// 256x256.
  dimension256._('thumbnailDimension256'),

  /// 768x768.
  dimension768._('thumbnailDimension768'),

  /// 1180x1180.
  dimension1180._('thumbnailDimension1180');

  const ThumbnailDimension._(this.value);

  /// The value of the thumbnail dimension.
  final String value;
}

/// {@template app_image}
/// A widget that displays a network image.
/// {@endtemplate}
class AppImage extends StatelessWidget {
  /// {@macro app_image}
  const AppImage({
    required this.imageUrl,
    this.thumbnailDimension,
    this.width,
    this.height,
    this.fit,
    this.colorBlendMode,
    this.color,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeInCurve = Curves.easeIn,
    this.fadeOutDuration = const Duration(milliseconds: 1000),
    this.fadeOutCurve = Curves.easeOut,
    this.imageBuilder,
    this.placeholder,
    this.progressIndicatorBuilder,
    this.errorWidget,
    super.key,
  });

  /// The image URL.
  final String imageUrl;

  /// The image width.
  final double? width;

  /// The image height.
  final double? height;

  /// The image fit.
  final BoxFit? fit;

  /// The image color blend mode.
  final BlendMode? colorBlendMode;

  /// The image color.
  final Color? color;

  /// The duration of the fade in animation.
  final Duration fadeInDuration;

  /// The curve of the fade in animation.
  final Curve fadeInCurve;

  /// The duration of the fade out animation.
  final Duration fadeOutDuration;

  /// The curve of the fade out animation.
  final Curve fadeOutCurve;

  /// The image builder.
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;

  /// The placeholder builder.
  final Widget Function(BuildContext, String)? placeholder;

  /// The progress indicator builder.
  final Widget Function(BuildContext, String, DownloadProgress)?
      progressIndicatorBuilder;

  /// The error widget builder.
  final Widget Function(BuildContext, String, Object)? errorWidget;

  /// The optional thumbnail dimension to use
  /// for the [imageUrl].
  final ThumbnailDimension? thumbnailDimension;

  @override
  Widget build(BuildContext context) {
    /// Example URL: https://media.orb.ac/thumbnailDimension128/https://gw.ipfs-lens.dev/ipfs/QmQQeBR2VkRXMrYFWDzbccWbJrbPLRbY18AV1JgZsqZXSf
    final updatedImageUrl = thumbnailDimension != null
        ? replaceThumbnailDimension(imageUrl, thumbnailDimension!)
        : imageUrl;

    return CachedNetworkImage(
      key: key,
      imageUrl: updatedImageUrl,
      width: width,
      height: height,
      fit: fit,
      color: color,
      colorBlendMode: colorBlendMode,
      fadeInDuration: fadeInDuration,
      fadeInCurve: fadeInCurve,
      fadeOutDuration: fadeOutDuration,
      fadeOutCurve: fadeOutCurve,
      imageBuilder: imageBuilder,
      placeholder: placeholder,
      progressIndicatorBuilder: progressIndicatorBuilder,
      errorWidget: errorWidget,
    );
  }
}

/// Replaces the thumbnail dimension in the [imageUrl]
/// with the given [thumbnailDimension].
String replaceThumbnailDimension(
  String imageUrl,
  ThumbnailDimension thumbnailDimension,
) {
  return imageUrl.replaceFirst(
    RegExp(r'thumbnailDimension\d+'),
    thumbnailDimension.value,
  );
}

/// Returns the thumbnail dimension based on the [size].
ThumbnailDimension? getThumbnailDimension(double size) {
  /// The final thumbnail size, which is the
  /// [size] multiplied by 3 to take into
  /// account the device pixel ratio.
  final thumbnailSize = size * 3;

  if (thumbnailSize <= _Dimensions.d128) {
    return ThumbnailDimension.dimension128;
  } else if (thumbnailSize > _Dimensions.d128 &&
      thumbnailSize <= _Dimensions.d256) {
    return ThumbnailDimension.dimension256;
  } else if (thumbnailSize > _Dimensions.d256 &&
      thumbnailSize <= _Dimensions.d768) {
    return ThumbnailDimension.dimension768;
  } else if (thumbnailSize > _Dimensions.d768) {
    return ThumbnailDimension.dimension1180;
  }
  return null;
}

abstract class _Dimensions {
  /// The size for [ThumbnailDimension.dimension128].
  static const d128 = 128;

  /// The size for [ThumbnailDimension.dimension256].
  static const d256 = 256;

  /// The size for [ThumbnailDimension.dimension768].
  static const d768 = 768;
}
