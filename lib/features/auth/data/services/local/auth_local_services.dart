
import 'package:cooking_recipes/features/auth/domain/use_case/auth_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../../../../core/failure/failure.dart';
import '../../model/user_model.dart';
import 'auth_base_services.dart';

class LocalAuthServices extends BaseAuthServices{
  static const String auth='auth';
  static Box<UserModel> hiveBox(auth) => Hive.box<UserModel>(auth);

  LocalAuthServices();
  static Future<LocalAuthServices> init() async {
    await Hive.openBox<UserModel>(auth);

    return LocalAuthServices();
  }
  @override
  Future<Either<Failure, UserModel>> addNewUser(UserModel user)async {
    try{
      final box = hiveBox(auth);
      await box.add(user);
      return  Right(user);
    }catch(e){

      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Either<Failure, bool> checkUsernameAvailability(String username) {
    try{
      final box = hiveBox(auth);
      final user = box.values.firstWhere((element) =>
      element.username == username,orElse: () => throw('username available'),);

      return  const Right(false);
    }catch(e){
      if(e.toString()=='username available'){
        return const Right(true);
      }else{
        return Left(ServiceFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUserAccount(DeleteUserAccountParameter parameter) async{
    try{
      final box = hiveBox(auth);

      final itemToRemove = box.values.firstWhere((element) =>
      element.username == parameter.username && parameter.password==element.password);
      await itemToRemove.delete();
      return const Right(true);
    }catch(e){
      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> forgetPassword(ForgetPasswordParameter parameter)async {
    try{
      final box = hiveBox(auth);
      final user = box.values.firstWhere((element) =>
      element.username == parameter.username && parameter.fullname==element.name,orElse: () => throw('Account info isn\'t correct'),);
      return  const Right(true);
    }catch(e){
      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getLastUid() async{
    try{
      final box = hiveBox(auth);
      int lastId = box.values.last.id;
      return   Right(lastId);
    }catch(e){
      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserData(GetUserParameter parameter)async {
    try{
      final box = hiveBox(auth);
      final user = box.values.firstWhere((element) =>
      element.username == parameter.username && parameter.fullName==element.name);
      return  Right(user);
    }catch(e){
      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> login(AuthParam credentials)async {
    try{
      final box = hiveBox(auth);
      final user = box.values.firstWhere((element) =>
      element.username == credentials.username && credentials.password==element.password,orElse: () => throw('No User with these credentials'),);
      return  Right(user);

    }catch(e){
      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> newPassword(NewPasswordParameter parameter) async{
    try{
      final box = hiveBox(auth);
      final user = box.values.firstWhere((element) =>
      element.username == parameter.username,orElse: () => throw('Account info isn\'t correct'),);
        user.password = parameter.newPassword;
         await box.put(user.key, user);
        return  Right(user);

    }catch(e){
      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateUserFavourites(UpdateUserFavouritesParameter parameter) {
    // TODO: implement updateUserFavourites
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> updateUserInfo(UserModel user) async{
    try{
      final box = hiveBox(auth);
      final userModel = box.values.firstWhere((element) =>
      element.username == user.username && user.password==element.password);
      await box.put(userModel.key, user);
      return  Right(user);

    }catch(e){
      return Left(ServiceFailure(e.toString()));
    }
  }





}