part of 'splash_cubit.dart';

enum SplashStatus {
  initial,
  success,
}

final class SplashState extends Equatable {
  const SplashState({
    required this.splashStatus,
  });

  const SplashState.initial()
      : this(
          splashStatus: SplashStatus.initial,
        );

  /// The status of [feedPublications].
  final SplashStatus splashStatus;

  @override
  List<Object?> get props => [
        splashStatus,
      ];

  SplashState copyWith({
    SplashStatus? splashStatus,
  }) {
    return SplashState(
      splashStatus: splashStatus ?? this.splashStatus,
    );
  }
}
