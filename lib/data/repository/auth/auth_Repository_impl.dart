import 'package:dartz/dartz.dart';
import 'package:project/data/models/auth/create_user_req.dart';
import 'package:project/data/models/auth/signin_user.dart';
import 'package:project/data/sources/auth/auth_firebase_service.dart';
import 'package:project/domain/repository/authRepository.dart';
import 'package:project/service_locator.dart';

class AuthRepositoryImpl extends Authrepository{
  @override
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    return sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
   return sl<AuthFirebaseService>().signup(createUserReq);
  }
}