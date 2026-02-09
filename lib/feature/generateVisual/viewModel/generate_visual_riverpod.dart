import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:postgen_app/product/config/visial_moods.dart';
import 'package:uuid/uuid.dart';

import '../../../core/base/baseService/base_cache_service.dart';
import '../../../core/enums/loading_status.dart';
import '../../../core/enums/service_path.dart';
import '../../../model/visualModel/visualCacheModel/visual_cache_model.dart';
import '../../../model/visualModel/visualRequestModel/visual_request_model.dart';
import '../../../model/visualModel/visualResponseModel/visual_response_model.dart';
import '../../../product/config/color_preferences.dart';
import '../../../product/config/post_text_style_types.dart';
import '../../../product/config/post_types.dart';
import '../../../product/constant/hive_constant.dart';
import '../../../product/service/appService/app_api_service.dart';
import '../../../product/service/cacheService/visual_cache_service.dart';
part 'generate_visual_state.dart';

final generateVisialRiverpod =
    NotifierProvider.autoDispose<GenerateVisualRiverpod, GenerateVisualState>(
        () {
  return GenerateVisualRiverpod();
});

class GenerateVisualRiverpod extends Notifier<GenerateVisualState> {
  @override
  GenerateVisualState build() {
    return const GenerateVisualState();
  }

  final AppApiService apiService = AppApiService();
  BaseCacheService<VisualCacheModel>? cacheService;
  final PageController pageViewController = PageController(initialPage: 0);
  final TextEditingController imageTextController = TextEditingController();
  final TextEditingController imageDescriptionController =
      TextEditingController();

  void init() async {
    cacheService ??=
        VisualCacheService(boxName: HiveConstants.visualCacheModelBoxName);
    await cacheService?.init();
    state = state.copyWith(currentPageIndex: 0);
  }

  void onPageChanged(int currentPageIndex) {
    state = state.copyWith(currentPageIndex: currentPageIndex);
  }

  void onPreviousPage() {
    if (state.currentPageIndex > 0) {
      pageViewController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void onNextPage() {
    if (state.currentPageIndex < 4) {
      pageViewController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void changedPostType(PostType postType) {
    if (state.selectedPostType == postType) {
      state = state.copyWith(selectedPostType: null);
    } else {
      state = state.copyWith(selectedPostType: postType);
    }
  }

  void changeVisualMood(VisualMood selectedMood) {
    state = state.copyWith(selectedMood: selectedMood);
  }

  void selectColor(ColorToneType selectedColor) {
    state = state.copyWith(selectedColor: selectedColor);
  }

  void changeShowTextOnImage(bool value) {
    state = state.copyWith(isAddText: value);
  }

  void selectPostTextStyleType(PostTextStyleType type) {
    state = state.copyWith(selectedStyle: type);
  }

  Future<List<Uint8List>?> generateAndSaveVisuals() async {
    if (imageDescriptionController.text.isEmpty &&
        imageTextController.text.isEmpty) {
      return null;
    }

    state = state.copyWith(loadingStatus: LoadingStatus.loading);

    try {
      VisualRequestModel request = VisualRequestModel(
        imageDescription: imageDescriptionController.text,
        text: imageTextController.text,
        postType: PostType.values[state.selectedPostType?.index ?? 0].label,
        isAddText: state.isAddText,
        postMood: state.selectedMood?.title ?? '',
        colorTone: state.selectedColor?.title ?? '',
        textStyle: state.selectedStyle.name,
      );

      final response =
          await apiService.createData<VisualResponseModel, VisualRequestModel>(
        objectModel: VisualResponseModel(),
        requestModel: request,
        path: ServicePath.generate,
      );

      if (response?.visualUrls != null && response!.visualUrls!.isNotEmpty) {
        final bytes = await saveImageToHive(imageUrls: response.visualUrls!);
        state = state.copyWith(
            visualResponse: response,
            loadingStatus: LoadingStatus.success,
            imageBytes: bytes);

        return bytes;
      } else {
        throw Exception("Image URL's were blank.");
      }
    } catch (e) {
      if (e is DioException) {
        log("Dio Error Type: ${e.type}");
        log("Dio Error Message: ${e.message}");
      }
      log("Error: $e");
      state = state.copyWith(loadingStatus: LoadingStatus.error);
      return null;
    }
  }

  Future<List<Uint8List>?> saveImageToHive(
      {required List<String> imageUrls}) async {
    if (imageUrls.isEmpty) return null;
    final uuid = const Uuid();
    List<Uint8List> imageBytesList = [];

    final tempDio = Dio();

    try {
      for (final url in imageUrls) {
        log("Downloading: $url");

        final response = await tempDio.get<List<int>>(
          url,
          options: Options(
            responseType: ResponseType.bytes,
            headers: {
              'User-Agent':
                  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',
              'Accept':
                  'image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8',
            },
          ),
        );

        if (response.statusCode == 200 && response.data != null) {
          imageBytesList.add(Uint8List.fromList(response.data!));
        } else {
          log("Could not download image: ${response.statusCode}");
        }
      }

      if (imageBytesList.isEmpty) return null;
      final model = VisualCacheModel(
        id: uuid.v4(),
        imageBytes: imageBytesList,
        createdAt: DateTime.now(),
      );

      await cacheService?.putItem(model.id, model);
      state = state.copyWith(imageBytes: imageBytesList);

      log("Successfully saved to Hive. Total images: ${imageBytesList.length}");
      return imageBytesList;
    } catch (e) {
      log("Error saving images to Hive: $e");
      return null;
    } finally {
      tempDio.close();
    }
  }
}
