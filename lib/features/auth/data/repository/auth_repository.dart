
import 'package:cooking_recipes/features/auth/domain/entity/user_entity.dart';
import 'package:cooking_recipes/features/auth/domain/use_case/get_user_info_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/repository/base_auth_repository.dart';
import '../../domain/use_case/auth_use_case.dart';
import '../model/user_model.dart';
import '../services/local/auth_cache.dart';
import '../services/local/auth_local_services.dart';

 class AuthRepository extends IAuthRepository{


   final AuthCacheImpl _authCacheImpl;
   final LocalAuthServices _authServicesImpl;
   AuthRepository( this._authCacheImpl, this._authServicesImpl);












   @override
   Future<Either<Failure, int>> getLastLoginUid() async =>
       await _authCacheImpl.getLastLoginUid();
   @override
   Future<Either<Failure, bool>> getRememberMe() async =>
       await _authCacheImpl.getRememberMe();



   @override
   Future<Either<Failure, bool>> setLastLoginUid(int uid) async =>
       await _authCacheImpl.setLastLoginUid(uid);

   @override
   Future<Either<Failure, bool>> setRememberMe(bool rememberMeVal) async =>
       await _authCacheImpl.setRememberMe( rememberMeVal);




   @override
   Future<Either<Failure, bool>> forgetPassword(ForgetPasswordParameter parameter)async => await _authServicesImpl.forgetPassword(parameter);





   @override
   Future<Either<Failure, UserEntity>> newPassword(NewPasswordParameter parameter) async {
     try{
       final res = await _authServicesImpl.newPassword(parameter);
       return handleUserModel(res);
     }catch(e){
       return Left(ServiceFailure(e.toString()));
     }
   }


   @override
   Future<Either<Failure, UserEntity>> updateUserInfo(UserEntity parameter) async {
     try{
      final res =
          await _authServicesImpl.updateUserInfo(UserModel.fromUE(parameter));
      return handleUserModel(res);
    }catch(e){
       return Left(ServiceFailure(e.toString()));
     }
  }


   @override
   Future<Either<Failure, bool>> deleteUserAccount(DeleteUserAccountParameter parameter) async=>await _authServicesImpl.deleteUserAccount(parameter);



   @override
   Future<Either<Failure, bool>> updateUserFavourites(UpdateUserFavouritesParameter parameter) async =>await _authServicesImpl.updateUserFavourites(parameter);

  @override
  Future<Either<Failure, UserEntity>> registerUser(UserEntity parameters) async {
    final res=await _authServicesImpl.addNewUser(UserModel.fromUE(parameters));
    return  handleUserModel(res);
  }

   Either<Failure, UserEntity> handleUserModel(Either<Failure, UserModel> response){

     try{
       return   response.fold((l) =>Left(l), (r)  {
         UserEntity  user= r.toUserEntity();
         return Right(user);
       });

     }catch(e){
       return  Left(ServiceFailure(e.toString()));
     }
  }
  @override
  Future<Either<Failure, UserEntity>> login(AuthParam parameters) async {

    final res = await _authServicesImpl.login(parameters);
   return handleUserModel(res);
  }

  @override
  Either<Failure, bool> checkUsernameAvailability(String username)  =>_authServicesImpl.checkUsernameAvailability(username);

  @override
  Future<Either<Failure, int>> getLastUid() async =>_authServicesImpl.getLastUid();

  @override
  Future<Either<Failure, UserEntity>> getUserInfo(GetUserParameter parameter)async {

 final res=   await _authServicesImpl.getUserData(parameter);
 return  handleUserModel(res);
  }







}