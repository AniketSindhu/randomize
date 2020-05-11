class Movie {
  final String title;
  final String url,year;
  double rating;
Movie._({this.title, this.url,this.year,this.rating});
factory Movie.fromJson(Map<String, dynamic> json) {
    return new Movie._(
      title: json['title'],
      url: json['posterurl'],
      year:json['year'],
      rating:json['imdbRating']
    );
  }
}