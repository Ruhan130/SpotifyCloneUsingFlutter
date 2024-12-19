import 'package:dartz/dartz.dart';
import 'package:project/core/usecase/usecase.dart';
import 'package:project/data/models/auth/create_user_req.dart';
import 'package:project/domain/repository/authRepository.dart';
import 'package:project/service_locator.dart';

class SignupUseCase implements Usecase<Either, CreateUserReq>{
  
  
  @override
  Future<Either> call({CreateUserReq ? Params})async {
    return sl<Authrepository>().signup(Params!);
    
  }
}