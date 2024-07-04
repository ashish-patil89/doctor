import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'deep_links_state.dart';

class DeepLinksCubit extends Cubit<DeepLinksState> {
  DeepLinksCubit({
    required Stream<Uri> routeUriStream,
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(DeepLinksInitial()) {
    _userRepository = userRepository;
    _routeUriSubscription = routeUriStream.listen(_handleRouteUriUpdated);
  }

  late final StreamSubscription<Uri> _routeUriSubscription;
  UserRepository _userRepository;

  Future<void> _handleRouteUriUpdated(Uri routeUri) async {}

  String? parseDeepLinkToOrb(Uri uri) {
    /// Check if the incoming URI is a deep link
    /// with the `orbapp` scheme or the `orb.club` host.
    return uri.scheme == 'orbapp' || uri.host == 'orb.club' ? uri.path : null;
  }

  String? parseDeepLinkToUserProfile(Uri uri) {
    /// Check if the incoming URI is a deep link to a user profile, e.g.:
    /// `/@andrea`.
    if (uri.pathSegments.length == 1) {
      final pathSegment = uri.pathSegments[0];
      if (pathSegment.startsWith('@')) {
        /// Strip out the '@' character from the handle.
        final userHandle = pathSegment.substring(1);

        return userHandle;
      }
    }

    return null;
  }

  String? parseDeepLinkToInvite(Uri uri) {
    /// Check if the incoming URI is a deep link to a invite, e.g.:
    /// `/invites/inviteId=123`.
    if (uri.pathSegments.length == 1) {
      final pathSegment = uri.pathSegments[0];

      if (pathSegment.startsWith('invites')) {
        final inviteId = uri.queryParameters['inviteId'];

        return inviteId;
      }
    }

    return null;
  }

  String? parseDeepLinkToCommunityProfile(Uri uri) {
    /// Check if the incoming URI is a deep link to a community profile, e.g.:
    /// `/c/anime`.
    if (uri.pathSegments.length == 2) {
      final pathSegment = uri.pathSegments[0];
      if (pathSegment == 'c') {
        final communityHandle = uri.pathSegments[1];

        return communityHandle;
      }
    }
    return null;
  }

  String? parseLegacyDeepLinkToCommunityProfile(Uri uri) {
    /// Check if the incoming URI is a deep link to a community profile, e.g.:
    /// `/community/656deed9ee3b8567c467af55`.
    if (uri.pathSegments.length == 2) {
      final pathSegment = uri.pathSegments[0];
      if (pathSegment == 'community') {
        final communityId = uri.pathSegments[1];

        return communityId;
      }
    }
    return null;
  }

  String? parseDeepLinkToPublication(Uri uri) {
    /// Check if the incoming URI is a deep link to a publication, e.g.:
    /// `/p/0x06-0x0d-DA-8552f59a` or `/post/0x06-0x0d-DA-8552f59a`.
    if (uri.pathSegments.length == 2) {
      final pathSegment = uri.pathSegments[0];
      if (pathSegment == 'p' || pathSegment == 'post') {
        final publicationId = uri.pathSegments[1];

        return publicationId;
      }
    }
    return null;
  }

  ({bool withIntroduction})? parseDeepLinkToCreateCommunity(Uri uri) {
    /// Check if the incoming URI is a deep link to
    /// a create club (community) page,
    /// e.g.: `/create-club`.
    if (uri.pathSegments.length == 1) {
      final pathSegment = uri.pathSegments[0];

      if (pathSegment.startsWith('create-club')) {
        return (
          withIntroduction: uri.queryParameters['introduction'] == 'true'
        );
      }
    }

    return null;
  }

  /// Check if the incoming URI is a deep link to one of the supported screens.
  bool isDeepLink(Uri uri) {
    return parseDeepLinkToOrb(uri) != null ||
        parseDeepLinkToUserProfile(uri) != null ||
        parseDeepLinkToCommunityProfile(uri) != null ||
        parseLegacyDeepLinkToCommunityProfile(uri) != null ||
        parseDeepLinkToInvite(uri) != null ||
        parseDeepLinkToPublication(uri) != null ||
        parseDeepLinkToCreateCommunity(uri) != null;
  }

  @override
  Future<void> close() {
    _routeUriSubscription.cancel();
    return super.close();
  }
}
