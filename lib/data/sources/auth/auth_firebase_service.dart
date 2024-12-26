import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/data/models/auth/create_user_req.dart';
import 'package:project/data/models/auth/signin_user.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signUserReq);
}

class AuthFirebaseImplimentation extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signUserReq.email, password: signUserReq.password);
      return Right("Account Login Scccessfully");
    } on FirebaseException catch (e) {
      String message = '';
      if(e.code == 'invalid-password'){
        message = "No user found for this email";
      }
      else if(e.code == 'invalid-credential'){
        message = 'Wrong password provided for that user' ; 
      }
      return left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      return Right('Signup Was Successfull');
    } on FirebaseException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is to weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'Email is already in use';
      }
            print("aaaaaaaaaaaaaaaaaaaaaaaaa${e.message}");
      return left(message);

    }
  }
}
