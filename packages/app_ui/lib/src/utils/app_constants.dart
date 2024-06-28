import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';

/// {@template app_constants}
/// The app constants.
/// {@endtemplate}
class AppConstants {
  /// The threshold for loading more attachment items.
  static const loaderAttachmentItemThreshold = 25;

  /// The maximum number of attachments allowed to select while creating a post.
  static const maxAttachmentsAllowedToSelect = 10;

  /// The threshold for loading more feed items.
  static const loaderFeedItemThreshold = 25;

  /// The threshold for loading more publication comment items.
  static const loaderPublicationCommentItemThreshold = 25;

  /// The threshold for loading more community items.
  static const loaderCommunityItemThreshold = 25;

  /// The threshold for loading more search items (users, communities).
  static const loaderSearchItemThreshold = 25;

  /// The default height for app bars used in orb.
  static const appBarHeight = 42.0 + topPadding + bottomPadding;

  /// The default top padding required in app bars.
  static const topPadding = kIsWeb ? AppSpacing.lg : AppSpacing.sm;

  /// The default bottom padding required in app bars.
  static const bottomPadding = AppSpacing.md;

  /// The media thumbnail dimension for 128px.
  static const mediaThumbnailDimension128 = 'thumbnailDimension128';

  /// The media thumbnail dimension for 768px.
  static const mediaThumbnailDimension768 = 'thumbnailDimension768';

  /// The media thumbnail dimension for 1180px.
  static const mediaThumbnailDimension1180 = 'thumbnailDimension1180';

  /// The max lines in the content of a publication.
  static const maxLinesForFeedPublicationContent = 5;

  /// The threshold for max count of user images.
  static const maxCountForUserImages = 4;

  /// The constant size for community images.
  static const communityImageSize = 42.0;

  /// The constant small size for user avatar dimension.
  static const int smallUserAvatarThumbnailDimension = 128;

  /// The constant medium size for user avatar dimension.
  static const int mediumUserAvatarThumbnailDimension = 256;

  /// The constant large size for user avatar dimension.
  static const int largeUserAvatarThumbnailDimension = 768;

  /// The constant size for media thumbnail dimension.
  static const int mediaThumbnailDimension = 1180;

  /// The offset threshold for opening the more options menu.
  static const double openMoreOptionsMenuOffsetThreshold = 15;

  /// The constant size for cover shimmer.
  static const coverSize = 579.0;

  /// The constant 120.
  static const constant120 = 120.0;

  /// The threshold for loading more items
  /// (profile friends, club members, notifications).
  static const loaderItemThreshold = 35;

  /// The profile name char limit 30.
  static const profileOrCommunityNameCharLimit = 30;

  /// THe AppStore identifier of Orb.
  static const appStoreId = '1638461963';

  /// THe Android package name of Orb.
  static const androidPackageName = 'app.orb.flutter';

  /// The threshold for showing common friends or clubs.
  static const thresholdForShowingStackOfImages = 3;

  /// The prefix used before club name.
  static const clubNamePrefix = 'orb.club/c';

  /// The prefix used before profile name.
  static const profileNamePrefix = 'orb.club/';

  /// The max lines in the content of about.
  static const maxLinesForAboutContent = 5;

  /// The max stacked entity of an album cover..
  static const maxStackedEntitiesForAlbumCover = 3;

  /// The max characters in the content of about.
  static const maxCharForAboutContent = 500;

  /// The DUST currency symbol.
  static const dustCurrencySymbol = 'DUST';

  /// The USD currency symbol.
  static const usdCurrencySymbol = 'USD';

  /// The USDC currency symbol.
  static const usdcCurrencySymbol = 'USDC';

  /// The key for custom club revenue.
  static const clubRevenueCustomKey = 'custom';

  /// The max category count for community.
  static const maxCategoryCountForCommunity = 3;

  /// The prefix used before add link.
  static const httpsLinkPrefix = 'https://';

  /// http link prefix.
  static const httpLinkPrefix = 'http://';

  /// www link prefix.
  static const wwwLinkPrefix = 'www.';

  /// The key of web links in club create/edit details..
  static const webLinkKey = 'web';

  /// The key of instagram link in club create/edit details..
  static const instagramLinkKey = 'insta';

  /// The key of x link in club create/edit details..
  static const xLinkKey = 'x';

  /// The max characters in the content of location.
  static const maxCharForLocationContent = 30;

  /// Top padding for app bar buttons.
  static const appBarButtonsTopPadding = kIsWeb ? AppSpacing.lg : AppSpacing.sm;

  /// Bottom padding for app bar buttons.
  static const appBarButtonsBottomPadding = AppSpacing.lg;
}
