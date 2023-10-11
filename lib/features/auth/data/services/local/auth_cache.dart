import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/failure/failure.dart';
import '../../../../../core/utils/app_strings.dart';

abstract class IAuthCache {
  Future<Either<Failure,bool>> setLastLoginUid( int uid);
  Future<Either<Failure,int>>getLastLoginUid();
  Future<Either<Failure,bool>> setRememberMe( bool rememberMeVal);
  Future<Either<Failure,bool>> getRememberMe();
}

class AuthCacheImpl implements IAuthCache {
  final SharedPreferences sharedPreferences;

  AuthCacheImpl({required this.sharedPreferences});


  @override
  Future<Either<Failure,bool>> setRememberMe( bool rememberMeVal) async {
    try{
      await sharedPreferences.setBool(AppStrings.rememberCheckBox, rememberMeVal);
      return const Right(true);

    }catch(e){
      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure,bool>> getRememberMe() async {
    try{
      if(sharedPreferences.containsKey(AppStrings.rememberCheckBox)){

        return  Right(sharedPreferences.getBool(AppStrings.rememberCheckBox)!);
      }else{
        return const Left(ServiceFailure(AppStrings.emptyString));
      }


    }catch(e){
      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getLastLoginUid()async {
    try{
      if(sharedPreferences.containsKey(AppStrings.lastLogin)){

        return  Right(sharedPreferences.getInt(AppStrings.lastLogin)!);
      }else{
        return const Left(ServiceFailure('No User found'));
      }


    }catch(e){
      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> setLastLoginUid(int uid) async{
    try{
      await sharedPreferences.setInt(AppStrings.lastLogin, uid);
      return const Right(true);

    }catch(e){
      return Left(ServiceFailure(e.toString()));
    }
  }



}