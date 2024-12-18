import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<void> signin();
}

class AuthFirebaseImplimentation extends AuthFirebaseService {
  @override
  Future<void> signin() {
    
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
          return Right('Signup Was Successfull');
    }on FirebaseException catch (e) {
      String message = ''; 
      if(e.code== 'weak-password'){
        message = 'The password provided is to weak';
      }
      else if(e.code == 'email-already-in-use'){
        message = 'Email is already in use';
      }
      return left(message);
    }
  }
}
