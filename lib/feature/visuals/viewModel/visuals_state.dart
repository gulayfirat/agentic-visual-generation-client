part of 'visuals_riverpod.dart';

@immutable
class VisualsState extends Equatable {
  final List<Uint8List> imageBytes;
  final LoadingStatus loadingStatus;
  final PermissionStatus permissionStatus;
  final String? errorMessage;

  const VisualsState({
    this.imageBytes = const [],
    this.loadingStatus = LoadingStatus.initial,
    this.permissionStatus = PermissionStatus.denied,
    this.errorMessage,
  });

  VisualsState copyWith({
    List<Uint8List>? imageBytes,
    LoadingStatus? loadingStatus,
    PermissionStatus? permissionStatus,
    String? errorMessage,
    List<Uint8List>? downloadedImageBytes,
  }) {
    return VisualsState(
      imageBytes: imageBytes ?? this.imageBytes,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      permissionStatus: permissionStatus ?? this.permissionStatus,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        imageBytes,
        loadingStatus,
        permissionStatus,
        errorMessage,
      ];
}
