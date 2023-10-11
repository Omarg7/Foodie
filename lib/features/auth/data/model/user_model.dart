import 'package:cooking_recipes/features/auth/domain/entity/user_entity.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../../shared/data/model/meal_model.dart';
part 'user_model.g.dart';

@HiveType(typeId: 101)
class UserModel extends HiveObject with EquatableMixin implements UserEntity  {
  @override
  @HiveField(0)
  int id;

  @override
  @HiveField(1)
  String name;
  @override
  @HiveField(2)
  String username;
  @override
  @HiveField(3)
  String password;
  @override
  @HiveField(4)
  String area;


  @override
  @HiveField(5)
  String favFoodType;

  @override
  @HiveField(6)
  List<int> favouritesIds;

  UserModel({
    this.id=0,
    this.favouritesIds=const <int>[],
    required this.name,
    required this.password,
    required this.username,
    required this.area,
  required this.favFoodType,

  }) : super();
  factory UserModel.fromUE(UserEntity user){

    UserModel userModel=UserModel(favouritesIds: user.favouritesIds,name: user.name, username: user.username, password: user.password,id:user.id ,favFoodType: user.favFoodType ,area: user.area,);

    return userModel;
  }
  toUserEntity(){

  UserEntity user=  UserEntity(favouritesIds: favouritesIds,id: id,name: name, area: area, username: username, password: password, favFoodType: favFoodType,);
    return user;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [username,id];







}