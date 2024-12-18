import 'package:project/data/models/auth/create_user_req.dart';

abstract class Authrepository {

  
  Future<void> signup(CreateUserReq createUSerReq);

  Future<void> signIn();
}