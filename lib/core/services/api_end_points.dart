class APIHelper{
  static const String baseUrl="https://www.themealdb.com/api/json/v1/";
  static const String searchMealByNameEndPoint="/search.php";
  static const String filterByFirstLetterEndPoint="/search.php";
  static const String mealFullInfoEndPoint="/lookup.php";
  static const String randomMealEndPoint="/random.php";

  static const String categoriesEndPoint="/categories.php";


  static const String areasEndPoint="/list.php";
  static const String ingredientsEndPoint="/list.php";
  static const String filterByMainIngredientEndPoint="/filter.php";
  static const String filterByCategoryEndPoint="/filter.php";

  static const String filterByAreaEndPoint="/filter.php";
  static const String authKey="1";

  static const String searchByNameParameterKey="s";
  static const String mealByIDParameterKey="i";
  static const String areasParameterKey="a";
  static const String ingredientsParameterKey="i";
  static const String filterByCategoryParameterKey="c";
  static const String filterByFirstLetterParameterKey="f";
  static const String filterByAreaParameterKey="a";
  static const String filterByMainIngredientParameterKey="i";
}