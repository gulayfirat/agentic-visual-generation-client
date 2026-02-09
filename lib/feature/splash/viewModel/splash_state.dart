part of 'splash_riverpod.dart';

@immutable
class SplashState extends Equatable {
  final List<String> items;
  final bool isLoading;

  const SplashState({
    this.items = const [],
    this.isLoading = false,
  });

  SplashState copyWith({
    List<String>? items,
    bool? isLoading,
  }) {
    return SplashState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [items, isLoading];
}
