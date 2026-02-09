part of 'generate_visual_riverpod.dart';

@immutable
class GenerateVisualState extends Equatable {
  final LoadingStatus loadingStatus;
  final int currentPageIndex;
  final PostType? selectedPostType;
  final VisualMood? selectedMood;
  final ColorToneType? selectedColor;
  final bool isAddText;
  final PostTextStyleType selectedStyle;
  final VisualResponseModel? visualResponse;
  final List<Uint8List> imageBytes;

  const GenerateVisualState({
    this.loadingStatus = LoadingStatus.initial,
    this.currentPageIndex = 0,
    this.selectedPostType,
    this.selectedMood,
    this.selectedColor,
    this.isAddText = true,
    this.selectedStyle = PostTextStyleType.modern,
    this.visualResponse,
    this.imageBytes = const [],
  });

  GenerateVisualState copyWith({
    LoadingStatus? loadingStatus,
    int? currentPageIndex,
    PostType? selectedPostType,
    VisualMood? selectedMood,
    ColorToneType? selectedColor,
    bool? isAddText,
    PostTextStyleType? selectedStyle,
    VisualResponseModel? visualResponse,
    List<Uint8List>? imageBytes,
  }) {
    return GenerateVisualState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      selectedPostType: selectedPostType ?? this.selectedPostType,
      selectedMood: selectedMood ?? this.selectedMood,
      selectedColor: selectedColor ?? this.selectedColor,
      isAddText: isAddText ?? this.isAddText,
      selectedStyle: selectedStyle ?? this.selectedStyle,
      visualResponse: visualResponse ?? this.visualResponse,
      imageBytes: imageBytes ?? this.imageBytes,
    );
  }

  @override
  List get props => [
        loadingStatus,
        currentPageIndex,
        selectedPostType,
        selectedMood,
        selectedColor,
        isAddText,
        selectedStyle,
        visualResponse,
        imageBytes,
      ];
}
