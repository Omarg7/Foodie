
import '../../../../shared/domain/entity/meal_entity.dart';

 class UserEntity {

  int id;
  String name;
  String username;
  String password;
  String favFoodType;

  List<int> favouritesIds;
  String area;
  UserEntity({
    this.id=0,
    this.favouritesIds=const<int>[],
    required this.name,
    required this.area,
    required this.username,
    required this.password,
    required this.favFoodType,

  });


}