import 'package:dartz/dartz.dart';
import 'package:project/data/models/auth/create_user_req.dart';
import 'package:project/data/models/auth/signin_user.dart';

abstract class Authrepository {


  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signIn(SigninUserReq signinUserReq);
}