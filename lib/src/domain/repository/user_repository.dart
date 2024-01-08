
import 'dart:convert';

import 'package:dostlar_app/src/data/local_db_data.dart';
import 'package:dostlar_app/src/domain/model/user_model.dart';

abstract class UserRepository{
  Future<bool> storeCooking(User cooking);
  List<User> readCooking();
  Future<bool> deleteCooking(User cooking);
  Future<bool> clearCache();
}


class UserRepositoryImpl implements UserRepository{

  final LocalDataSource dataSource;

  const UserRepositoryImpl({required this.dataSource});


  @override
  Future<bool> clearCache() {
    return dataSource.remove(StorageKey.cooked);
  }

  @override
  Future<bool> deleteCooking(User cooking) async{
    /// Object => json => String
    final list = readCooking();
    list.remove(cooking);
    final json = list.map((cook) => cook.toJson()).toList();
    final data = jsonEncode(json);
    return await dataSource.store(StorageKey.cooked, data);
  }

  @override
  List<User> readCooking() {
    /// String => json => Object
    String data = dataSource.read(StorageKey.cooked) ?? "[]";
    final json = jsonDecode(data) as List;
    return json.map((item) => User.fromJson(item as Map<String, Object?>)).toList();
  }

  @override
  Future<bool> storeCooking(User user) async{
    /// Object => json => String
    final list = readCooking();
    list.add(user);
    final json = list.map((cook) => user.toJson()).toList();
    final data = jsonEncode(json);
    return await dataSource.store(StorageKey.cooked, data);
  }

}