class Game {
  final String name,genre;
  final String platform;
  final int rating;
  final int year;
Game._({this.name,this.rating,this.platform,this.year,this.genre});
factory Game.fromJson(Map<String, dynamic> json) {
    return Game._(
      name: json['title'].toString(),
      rating: json['score'].toInt(),
      platform:json['platform'],
      year:json['release_year'].toInt(),
      genre:json['genre']
    );
  }
}