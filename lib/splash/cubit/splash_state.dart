part of 'splash_cubit.dart';

enum SplashStatus {
  initial,
  success,
}

final class SplashState extends Equatable {
  const SplashState({
    required this.splashStatus,
    this.isValidSession = false,
  });

  const SplashState.initial()
      : this(
          splashStatus: SplashStatus.initial,
        );

  /// The status of [feedPublications].
  final SplashStatus splashStatus;
  final bool isValidSession;

  @override
  List<Object?> get props => [
        splashStatus,
        isValidSession,
      ];

  SplashState copyWith({
    bool? isValidSession,
    SplashStatus? splashStatus,
  }) {
    return SplashState(
      splashStatus: splashStatus ?? this.splashStatus,
      isValidSession: isValidSession ?? this.isValidSession,
    );
  }
}
