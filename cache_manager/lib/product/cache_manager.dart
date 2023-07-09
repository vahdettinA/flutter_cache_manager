import 'dart:convert';

import 'package:chace_maneger/product/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ICacheManager {
  late SharedPreferences prefs;
  Future<void> initPreferens();
  Future<bool> addCacheItem<T>(String id, T model);
  Future<bool> removeCacheItem<T>(String id);
  Future<T> getCacheItem<T extends IBaseModel>(String id, IBaseModel model);
  List<T> getCacheList<T extends IBaseModel>(IBaseModel model);
  bool isCacheData<T>(String id);
}

class CacheManager extends ICacheManager {
  static CacheManager? _instace;
  static CacheManager get instance {
    if (_instace != null) return _instace!;
    _instace = CacheManager._init();
    return _instace!;
  }

  late SharedPreferences prefs;

  CacheManager._init() {
    initPreferens();
  }
  Future<void> initPreferens() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> addCacheItem<T>(String id, T model) async {
    final _setString = jsonEncode(model);
    return await prefs.setString('$T-id', _setString);
  }

  Future<bool> removeCacheItem<T>(String id) async {
    return await prefs.remove('$T-id');
  }

  Future<T> getCacheItem<T extends IBaseModel>(
      String id, IBaseModel model) async {
    final _getString = await prefs.getString('$T-id') ?? '';
    final getmodelJson = jsonDecode(_getString);
    return model.fromJson(getmodelJson);
  }

  List<T> getCacheList<T extends IBaseModel>(IBaseModel model) {
    final _cacheList =
        prefs.getKeys().where((element) => element.contains('$T')).toList();
    if (_cacheList.isNotEmpty) {
      return _cacheList
          .map((e) => model.fromJson(jsonDecode(prefs.getString(e) ?? '')) as T)
          .toList();
    }
    return [];
  }

  bool isCacheData<T>(String id) {
    return (prefs.getString('$T-id') ?? '').isNotEmpty;
  }
}
