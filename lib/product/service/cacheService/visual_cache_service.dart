import 'package:hive_flutter/hive_flutter.dart';
import 'package:postgen_app/model/visualModel/visualCacheModel/visual_cache_model.dart';
import '../../../core/base/baseService/base_cache_service.dart';
import '../../constant/hive_constant.dart';

class VisualCacheService extends BaseCacheService<VisualCacheModel> {
  VisualCacheService({required String boxName}) : super(boxName);

  @override
  Future<void> addItems(List<VisualCacheModel> items) async {
    await box?.addAll(items);
  }

  @override
  Future<void> putItems(List<VisualCacheModel> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  Future<VisualCacheModel?> getItem(String key) async {
    return box?.get(key);
  }

  @override
  Future<void> putItem(String key, VisualCacheModel item) async {
    await box?.put(key, item);
  }

  @override
  Future<void> deleteAllItems() async {
    await box?.deleteFromDisk();
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  @override
  Future<List<VisualCacheModel>?> getItems() async {
    return box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.visualCacheModelTypeId)) {
      Hive.registerAdapter(VisualCacheModelAdapter());
    }
  }
}
