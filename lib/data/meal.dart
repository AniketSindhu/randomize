class Meal {
  final String name;
  final String image,url;
Meal._({this.name, this.image,this.url,});
factory Meal.fromJson(Map<String, dynamic> json) {
    return new Meal._(
      name: json['strMeal'].toString(),
      image: json['strMealThumb'].toString(),
      url:json['strYoutube'].toString(),
    );
  }
}