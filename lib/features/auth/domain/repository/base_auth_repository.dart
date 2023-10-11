import 'package:cooking_recipes/core/use_case/base_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entity/user_entity.dart';
import '../use_case/auth_use_case.dart';
import '../use_case/get_user_by_id_use_case.dart';

abstract class IAuthRepository{
  Future<Either<Failure,UserEntity>> registerUser(UserEntity parameters  );
  Future<Either<Failure,UserEntity>> login(AuthParam parameters  );

  Future<Either<Failure,UserEntity>> getUserInfo(GetUserParameter parameter );
  Future<Either<Failure, bool>> forgetPassword(ForgetPasswordParameter parameter);
  Future<Either<Failure, UserEntity>> newPassword(NewPasswordParameter parameter);
  Future<Either<Failure, bool>> updateUserFavourites(UpdateUserFavouritesParameter parameter);
  Either<Failure, bool> checkUsernameAvailability(String username);
  Future<Either<Failure, int>> getLastUid();

  Future<Either<Failure, UserEntity>> updateUserInfo(UserEntity parameter);
  Future<Either<Failure, bool>> deleteUserAccount(DeleteUserAccountParameter parameter);
  Future<Either<Failure, bool>> setRememberMe(bool rememberMeVal);
  Future<Either<Failure, int>> getLastLoginUid();
  Future<Either<Failure, bool>> getRememberMe();
  Future<Either<Failure, bool>> setLastLoginUid(int uid);

}