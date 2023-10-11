
import '../../domain/entity/area_entity.dart';
import '../../../ingredients/domain/entity/ingredient_entity.dart';


class AreaModel implements AreaEntity {
  @override
  int id;

  @override
  String name;
  AreaModel({
    this .id=0,
    required this.name,

  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      name: json['strArea'],
    );
  }
}