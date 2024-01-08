import 'package:dostlar_app/src/data/local_db_data.dart';
import 'package:dostlar_app/src/domain/repository/user_repository.dart';

late final UserRepository repository;

Future<void> serviceLocator() async{

  /// third party api => storage
  final db = await LocalDataSourceImpl.init;

  ///data
  LocalDataSource dataSource = LocalDataSourceImpl(db: db);

  ///repository
  repository= UserRepositoryImpl(dataSource: dataSource);
}