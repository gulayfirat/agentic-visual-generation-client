import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:postgen_app/model/visualModel/visualCacheModel/visual_cache_model.dart';
import '../../../core/base/baseService/base_cache_service.dart';
import '../../../core/enums/loading_status.dart';
import '../../../product/constant/hive_constant.dart';
import '../../../product/service/cacheService/visual_cache_service.dart';
part 'visuals_state.dart';

final visualsRiverpod =
    NotifierProvider<VisualsRiverpod, VisualsState>(() => VisualsRiverpod());

class VisualsRiverpod extends Notifier<VisualsState> {
  @override
  VisualsState build() {
    return VisualsState();
  }

  Future<void> init(
      {required List<Uint8List> imageBytes, bool? isDetail}) async {
    cacheService ??=
        VisualCacheService(boxName: HiveConstants.visualCacheModelBoxName);
    state = state.copyWith(imageBytes: imageBytes);
    await cacheService!.init();
  }

  BaseCacheService<VisualCacheModel>? cacheService;

  Future<void> saveToGallery({required Uint8List imageBytes}) async {
    var status = await Permission.photosAddOnly.request();
    state = state.copyWith(permissionStatus: status);

    if (status.isGranted) {
      state = state.copyWith(loadingStatus: LoadingStatus.loading);
      try {
        final result = await ImageGallerySaver.saveImage(imageBytes);
        if (result['isSuccess']) {
          state = state.copyWith(loadingStatus: LoadingStatus.success);
        } else {
          state = state.copyWith(loadingStatus: LoadingStatus.error);
        }
      } catch (e) {
        log("Error: $e");
        state = state.copyWith(loadingStatus: LoadingStatus.error);
      }
    }
  }
}
