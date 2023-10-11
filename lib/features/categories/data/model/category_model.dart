import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
class CategoryModel implements CategoryEntity {

  @override
  int categoryId;
  @override
  String name;
  @override
  String categoryThumb;
  @override
  String categoryDescription;
  CategoryModel({


    required this.categoryId,
    required this.name,
    required this.categoryThumb,
    required this.categoryDescription,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: int.tryParse(json['idCategory'])??0,
      name: json['strCategory'],
      categoryThumb: json['strCategoryThumb'],
      categoryDescription: json['strCategoryDescription'],
    );
  }
}