part of 'home_riverpod.dart';

@immutable
class HomeState extends Equatable {
  final LoadingStatus loadingStatus;
  final List<VisualCacheModel> visuals;
  final String selectedLanguage;
  final Locale? currentLocale;

  const HomeState(
      {this.loadingStatus = LoadingStatus.initial,
      this.visuals = const [],
      this.selectedLanguage = '',
      this.currentLocale});

  HomeState copyWith(
      {LoadingStatus? loadingStatus,
      List<VisualCacheModel>? visuals,
      String? selectedLanguage,
      Locale? currentLocale}) {
    return HomeState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        visuals: visuals ?? this.visuals,
        selectedLanguage: selectedLanguage ?? this.selectedLanguage,
        currentLocale: currentLocale ?? this.currentLocale);
  }

  @override
  List get props => [loadingStatus, visuals, selectedLanguage, currentLocale];
}
