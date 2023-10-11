
import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../../../domain/use_case/auth_use_case.dart';
import '../../model/user_model.dart';


abstract class BaseAuthServices{



  Future<Either<Failure, bool>> forgetPassword(ForgetPasswordParameter parameter);
  Future<Either<Failure, UserModel>> newPassword(NewPasswordParameter parameter);
  Future<Either<Failure, bool>> updateUserFavourites(UpdateUserFavouritesParameter parameter);
  Either<Failure, bool> checkUsernameAvailability(String username);
  Future<Either<Failure,UserModel>> addNewUser(UserModel user);
  Future<Either<Failure,UserModel>> login(AuthParam credentials);
  Future<Either<Failure, UserModel>> updateUserInfo(UserModel user);
  Future<Either<Failure, bool>> deleteUserAccount(DeleteUserAccountParameter parameter);
  Future<Either<Failure, int>> getLastUid();
  Future<Either<Failure, UserModel>> getUserData(GetUserParameter parameter);


}