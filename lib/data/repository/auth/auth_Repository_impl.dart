import 'package:project/data/models/auth/create_user_req.dart';
import 'package:project/data/sources/auth/auth_firebase_service.dart';
import 'package:project/domain/repository/authRepository.dart';
import 'package:project/service_locator.dart';

class AuthRepositoryImpl extends Authrepository{
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserReq createUserReq) async {
    await sl<AuthFirebaseService>().signup(createUserReq);
  }
}