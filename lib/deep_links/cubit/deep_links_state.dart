part of 'deep_links_cubit.dart';

/// We intentionally do not use equatable here, because we want to be able to
/// fire state changes even if the same states are emitted.
sealed class DeepLinksState {
  const DeepLinksState();
}

final class DeepLinksInitial extends DeepLinksState {}

class DeepLinkToUserProfileLoaded extends DeepLinksState {
  const DeepLinkToUserProfileLoaded({
    required this.userHandle,
  });

  final String userHandle;
}

class DeepLinkToCommunityLoaded extends DeepLinksState {
  const DeepLinkToCommunityLoaded({
    this.communityId,
    this.communityHandle,
  });

  final String? communityId;
  final String? communityHandle;
}

class DeepLinkToPublicationLoaded extends DeepLinksState {
  const DeepLinkToPublicationLoaded({
    required this.publicationId,
  });

  final String publicationId;
}

class DeepLinkToCreateCommunityLoaded extends DeepLinksState {
  const DeepLinkToCreateCommunityLoaded({
    this.withIntroduction = false,
  });

  final bool withIntroduction;
}

class DeepLinkUnauthenticatedUser extends DeepLinksState {}
