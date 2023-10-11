

class IngredientEntity {

  int id;

  String name;
  String? description;
  String? type;

  IngredientEntity({
     this.id=0,

    required this.name,
     this.description,
    this.type,
  });

}