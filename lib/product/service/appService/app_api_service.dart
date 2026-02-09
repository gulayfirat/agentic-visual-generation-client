import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../../core/base/baseService/base_api_service.dart';
import '../../../core/base/baseService/handle_service_error.dart';
import '../../../core/base/base_model.dart';
import '../../../core/enums/service_path.dart';
import '../../../core/manager/network_manager.dart';

class AppApiService extends BaseApiService {
  static AppApiService? _instace;
  static AppApiService get instance {
    if (_instace != null) return _instace!;
    _instace = AppApiService();
    return _instace!;
  }

  @override
  Future<dynamic> getListData<T extends BaseModel>({
    T? objectModel,
    required String path,
  }) async {
    try {
      final response = await NetworkManager.instance.dio.get(path);
      if (response.statusCode == 200) {
        final data = response.data;
        final resultPosts =
            List<T>.from(data.map((e) => objectModel?.fromJson(e)));
        return resultPosts;
      }
    } on DioException catch (e) {
      log('Error: $e');
      HandleServiceError().handleError(e);
      return null;
    }
    return null;
  }

  @override
  Future<dynamic> getObjectData<T extends BaseModel>({
    required T objectModel,
    required String path,
  }) async {
    try {
      final response = await NetworkManager.instance.dio.get(path);
      if (response.statusCode == HttpStatus.ok) {
        return objectModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      log('Error: $e');
      HandleServiceError().handleError(e);
      return false;
    }
  }

  @override
  Future<T?> createData<T extends BaseModel, R extends BaseModel>({
    required T objectModel,
    required R requestModel,
    required ServicePath path,
  }) async {
    try {
      Response response = await NetworkManager.instance.dio.post(
        path.subUrl,
        data: requestModel.toJson(),
      );

      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        return objectModel.fromJson(response.data) as T;
      }
    } on DioException catch (e) {
      HandleServiceError().handleError(e);
      log("Network Error: ${e.toString()}");
    }
    return null;
  }

  @override
  Future<bool?> updateData<T extends BaseModel>(
      {required T objectModel, required String path}) async {
    final response =
        await NetworkManager.instance.dio.put(path, data: objectModel.toJson());
    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool?> deleteData<T extends BaseModel>({required String path}) async {
    final response = await NetworkManager.instance.dio.delete(path);
    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else {
      return false;
    }
  }
}
