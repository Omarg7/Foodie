
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../domain/entity/meal_entity.dart';



class MealModel  extends HiveObject with EquatableMixin  implements MealEntity {


 @override
 @HiveField(0)
 int mealId;
 @override
 @HiveField(1)
  String name;
 @override
 @HiveField(2)
  String category;
 @override
 @HiveField(3)
  String area;
 @override
 @HiveField(4)
  List<String> instructions;
 @override
 @HiveField(5)
  String thumbnail;
 @override
 @HiveField(6)
  List<String> tags;
 @override
 @HiveField(7)
  String youtubeLink;
 @override
 @HiveField(8)
  List<String> ingredients;
 @override
 @HiveField(9)
  List<String> measures;
 @override
 @HiveField(10)
 String recipeLink;
 @override
 @HiveField(11)
 String? imageSource;
 @override
 @HiveField(12)
 String? strCreativeCommonsConfirmed;
 @override
 @HiveField(13)
 String? dateModified;
 @override


  MealModel({



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
 factory MealModel.fromME(MealEntity meal) {

   return MealModel(
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
  factory MealModel.fromJson(Map<String, dynamic> json) {
    final ingredients = <String>[];
    final measures = <String>[];

    // Extract ingredients and measures
    for (int i = 1; i <= 20; i++) {
      final ingredient =json.containsKey('strIngredient$i')? json['strIngredient$i'] as String?:'';
      final measure =json.containsKey('strMeasure$i')? json['strMeasure$i'] as String?:'';

      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
      }

      if (measure != null && measure.isNotEmpty) {
        measures.add(measure);
      }
    }
String instructions=json.containsKey('strInstructions')? json['strInstructions'] as String:'';
    List<String> instructionsList=instructions.split('\n')
        .map((line) => line.trim())
        .toList();
    return MealModel(

        mealId: int.tryParse(json['idMeal']) as int,
        name: json['strMeal'] as String,
        category:json.containsKey('strCategory')? json['strCategory'] as String:'',
        area:json.containsKey('strArea')? json['strArea'] as String:'',
        instructions:json.containsKey('strInstructions')?instructionsList:[],
        thumbnail:json.containsKey('strMealThumb') && json['strMealThumb']!=null? json['strMealThumb'] as String:'',
        tags:json.containsKey('strTags')? (json['strTags'] as String?)?.split(',') ?? []:[],
        youtubeLink:json.containsKey('strYoutube') && json['strYoutube']!=null? json['strYoutube'] as String:'',
        ingredients: ingredients,
        measures: measures, recipeLink:json.containsKey('strSource') && json['strSource']!=null? json['strSource'] as String:'',
      strCreativeCommonsConfirmed:json.containsKey('strCreativeCommonsConfirmed') && json['strCreativeCommonsConfirmed']!=null? json['strCreativeCommonsConfirmed'] as String?:'',
      imageSource:json.containsKey('strImageSource') && json['strImageSource']!=null? json['strImageSource'] as String?:'',
      dateModified:json.containsKey('dateModified') && json['dateModified'] !=null? json['dateModified'] as String?:'',

    );
  }
 factory MealModel.emptyResponse() {

   return MealModel(
     mealId: -1,

     name: '',
     category: '',
     area: '',
     instructions: [],
     thumbnail: '',
     tags: [],
     youtubeLink: '',
     ingredients: [],
     measures: [], recipeLink: '',
     strCreativeCommonsConfirmed: '',
     imageSource: '',
     dateModified: '',

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

  @override
  // TODO: implement props
  List<Object?> get props => [mealId];


}