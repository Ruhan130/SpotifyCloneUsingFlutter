import 'package:get_it/get_it.dart';
import 'package:project/data/repository/auth/auth_Repository_impl.dart';
import 'package:project/data/sources/auth/auth_firebase_service.dart';
import 'package:project/domain/repository/authRepository.dart';

final sl = GetIt.instance ;

Future<void> initializeDependency()async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseImplimentation()
  );


  sl.registerSingleton<Authrepository>(
    AuthRepositoryImpl()
  );
}