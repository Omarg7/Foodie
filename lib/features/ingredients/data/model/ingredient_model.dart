
import '../../domain/entity/ingredient_entity.dart';

class IngredientModel implements IngredientEntity {
  @override
  String? description;

  @override
  int id;

  @override
  String name;

  @override
  String? type;
  IngredientModel({
    this.id=0,

    required this.name,
    this.description,
    this.type,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      id: int.tryParse(json['idIngredient'])??0,
      name: json['strIngredient'],
      description: json['strDescription'],
      type: json['strType'],
    );
  }


}