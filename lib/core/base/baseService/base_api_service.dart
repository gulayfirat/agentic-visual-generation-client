import 'package:postgen_app/core/base/base_model.dart';
import '../../enums/service_path.dart';

abstract class BaseApiService {
  Future<dynamic> getListData<T extends BaseModel>(
      {T? objectModel, required String path});

  Future<dynamic> getObjectData<T extends BaseModel>(
      {required T objectModel, required String path});

  Future<T?> createData<T extends BaseModel, R extends BaseModel>(
      {required T objectModel,
      required R requestModel,
      required ServicePath path});

  Future<bool?> updateData<T extends BaseModel>(
      {required T objectModel, required String path});

  Future<bool?> deleteData<T extends BaseModel>({required String path});
}
