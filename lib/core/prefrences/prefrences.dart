
class Consts{
  static Map<String,String> availableCountries={
    "Egyptian": "\ud83c\uddea\ud83c\uddec",
    "American": "\ud83c\uddfa\ud83c\uddf8",
    "British": "\ud83c\uddec\ud83c\udde7",
    "Canadian": "\ud83c\udde8\ud83c\udde6",
    "Chinese": "\ud83c\udde8\ud83c\uddf3",
    "Croatian": "\ud83c\udded\ud83c\uddf7",
    "Dutch": "\ud83c\uddf3\ud83c\uddf1",
    "Filipino": "\ud83c\uddf5\ud83c\udded",
    "French": "\ud83c\uddeb\ud83c\uddf7",
    "Greek": "\ud83c\uddec\ud83c\uddf7",
    "Indian": "\ud83c\uddee\ud83c\uddf3",
    "Irish": "\ud83c\uddee\ud83c\uddf7",
    "Italian": "\ud83c\uddee\ud83c\uddf9",
    "Jamaican": "\ud83c\uddef\ud83c\uddf2",
    "Japanese": "\ud83c\uddef\ud83c\uddf5",
    "Kenyan": "\ud83c\uddf0\ud83c\uddea",
    "Malaysian": "\ud83c\uddf2\ud83c\uddfe",
    "Mexican": "\ud83c\uddf2\ud83c\uddfd",
    "Moroccan": "\ud83c\uddf2\ud83c\udde6",
    "Polish": "\ud83c\uddf5\ud83c\uddf1",
    "Portuguese": "\ud83c\uddf5\ud83c\uddf9",
    "Russian": "\ud83c\uddf7\ud83c\uddfa",
    "Spanish": "\ud83c\uddea\ud83c\uddf8",
    "Thai": "\ud83c\uddf9\ud83c\udded",
    "Tunisian": "\ud83c\uddf9\ud83c\uddf3",
    "Turkish": "\ud83c\uddf9\ud83c\uddf7",
    "Vietnamese": "\ud83c\uddfb\ud83c\uddf3",
  };
  static List<String> availableFoodType=[
    "Beef",
    "Breakfast",
    "Chicken",
    "Dessert",
    "Goat",
    "Lamb",
    "Miscellaneous",
    "Pasta",
    "Pork",
    "Seafood",
    "Side",
    "Starter",
    "Vegan",
    "Vegetarian",
  ];
  static String getFlagByCountry(String country){
    if (availableCountries.containsKey(country)) {
      return availableCountries[country]??'🏳️';
    } else {
      return '🏳️'; // Key not found
    }
  }
}