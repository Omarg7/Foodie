import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:hive/hive.dart';
part 'favourite_model.g.dart';
@HiveType(typeId:100)
class FavouriteModel  extends HiveObject implements MealEntity{
  @override
  @HiveField(0)
  String area;

  @override
  @HiveField(1)
  String category;

  @override
  @HiveField(2)
  String? dateModified;
  @override
  @HiveField(3)
  String? imageSource;

  @override
  @HiveField(4)
  List<String> ingredients;

  @override
  @HiveField(5)
  List<String> instructions;



  @override
  @HiveField(6)
  int mealId;

  @override
  @HiveField(7)
  List<String> measures;

  @override
  @HiveField(8)
  String name;

  @override
  @HiveField(9)
  String recipeLink;

  @override
  @HiveField(10)
  String? strCreativeCommonsConfirmed;

  @override
  @HiveField(11)
  List<String> tags;

  @override
  @HiveField(12)
  String thumbnail;
  @override
  @HiveField(13)
  String youtubeLink;
  @HiveField(14)
  String uid;
  FavouriteModel({

required this.uid,
    required this.name,
    required this.category,
    required this.area,
    required this.mealId,
    required this.instructions,
    required this.thumbnail,
    required this.tags,
    required this.youtubeLink,
    required this.ingredients,
    required this.measures,
    required this.recipeLink,
    this.imageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });
  factory FavouriteModel.fromME(MealEntity meal,String uid) {

    return FavouriteModel(uid: uid,
      mealId: meal.mealId,
      name: meal.name,
      category:meal.category,
      area: meal.area,
      instructions: meal.instructions,
      thumbnail: meal.thumbnail,
      tags: meal.tags,
      youtubeLink: meal.youtubeLink,
      ingredients: meal.ingredients,
      measures: meal.measures, recipeLink: meal.thumbnail,
      strCreativeCommonsConfirmed: meal.thumbnail,
      imageSource: meal.thumbnail,
      dateModified: meal.thumbnail,

    );
  }
  toMealEntity() {

    return MealEntity(
      mealId: mealId,

      name: name,
      category:category,
      area: area,
      instructions: instructions,
      thumbnail: thumbnail,
      tags: tags,
      youtubeLink: youtubeLink,
      ingredients: ingredients,
      measures: measures, recipeLink: thumbnail,
      strCreativeCommonsConfirmed: thumbnail,
      imageSource: thumbnail,
      dateModified: thumbnail,

    );
  }
}
