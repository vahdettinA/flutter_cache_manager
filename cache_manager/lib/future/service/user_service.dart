import 'dart:io';

import 'package:chace_maneger/future/model/user_model.dart';
import 'package:dio/dio.dart';

abstract class IUserService {
  final Dio dio;
  IUserService(this.dio);
  final baseurl = "https://reqres.in/api";
  Future<List<Data>> fechuser();
}

class UserService extends IUserService {
  UserService(super.dio);
  final _paturl = "/users?page=2";
  @override
  Future<List<Data>> fechuser() async {
    var response = await dio.get("$baseurl$_paturl");
    if (response.statusCode == HttpStatus.ok) {
      var jsonbody = response.data;
      if (jsonbody is Map<String, dynamic>) {
        return UserModel.fromJson(jsonbody).data ?? [];
      }
    }
    return [];
  }
}
