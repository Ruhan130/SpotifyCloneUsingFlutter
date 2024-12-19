import 'package:dartz/dartz.dart';
import 'package:project/core/usecase/usecase.dart';
import 'package:project/data/models/auth/signin_user.dart';
import 'package:project/domain/repository/authRepository.dart';
import 'package:project/service_locator.dart';

class SigninUseCase implements Usecase<Either, SigninUserReq>{
  @override
  Future<Either> call({SigninUserReq? Params}) {
    return sl<Authrepository>().signIn(Params!);
  }

} 