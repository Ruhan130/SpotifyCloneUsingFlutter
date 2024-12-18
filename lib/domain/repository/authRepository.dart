import 'package:dartz/dartz.dart';
import 'package:project/data/models/auth/create_user_req.dart';

abstract class Authrepository {


  Future<Either> signup(CreateUserReq createUserReq);

  Future<void> signIn();
}