
import 'dart:convert';

import 'package:dostlar_app/src/data/local_db_data.dart';
import 'package:dostlar_app/src/domain/model/user_model.dart';

abstract class UserRepository{
  Future<bool> storeUser(User user);
  List<User> readUser();
  Future<bool> deleteUser(User user);
  Future<bool> clearCache();
}


class UserRepositoryImpl implements UserRepository{

  final LocalDataSource dataSource;

  const UserRepositoryImpl({required this.dataSource});


  @override
  Future<bool> clearCache() {
    return dataSource.remove(StorageKey.id);
  }

  @override
  Future<bool> deleteUser(User user) async{
    /// Object => json => String
    final list = readUser();
    list.remove(user);
    final json = list.map((odam) => odam.toJson()).toList();
    final data = jsonEncode(json);
    return await dataSource.store(StorageKey.id, data);
  }

  @override
  List<User> readUser() {
    /// String => json => Object
    String data = dataSource.read(StorageKey.id) ?? "[]";
    final json = jsonDecode(data) as List;
    return json.map((item) => User.fromJson(item as Map<String, Object?>)).toList();
  }

  @override
  Future<bool> storeUser(User user) async{
    /// Object => json => String
    final list = readUser();
    list.add(user);
    final json = list.map((person) => person.toJson()).toList();
    final data = jsonEncode(json);
    return await dataSource.store(StorageKey.id, data);
  }

}