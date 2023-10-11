
class MealEntity {


   int mealId;
   String name;
   String category;
   String area;
   List<String> instructions;
   String thumbnail;
   List<String> tags;
   String youtubeLink;
   List<String> ingredients;
   List<String> measures;
   String recipeLink;
   String? imageSource;
   String? strCreativeCommonsConfirmed;
   String? dateModified;

  MealEntity({

    required this.mealId,
    required this.name,
    required this.category,
    required this.area,
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
}