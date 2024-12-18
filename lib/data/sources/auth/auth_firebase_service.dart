import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<void> signup(CreateUserReq createUserReq);
  Future<void> signin();
}

class AuthFirebaseImplimentation extends AuthFirebaseService {
  @override
  Future<void> signin() {
    
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
    }on FirebaseException catch (e) {}
  }
}
