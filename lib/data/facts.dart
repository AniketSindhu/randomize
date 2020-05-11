class Fact {
  final String fact;
  Fact({this.fact});

  factory Fact.fromJson(Map<String, dynamic> json) {
    return Fact(
      fact: json['text'],
    );
  }
}