class Dogs {
  final String name;
  final String life_span,temperament;
Dogs._({this.name, this.life_span,this.temperament,});
factory Dogs.fromJson(Map<String, dynamic> json) {
    return new Dogs._(
      name: json['name'].toString(),
      life_span: json['life_span'].toString(),
      temperament:json['temperament'].toString(),
    );
  }
}

class Dogimage {
  final String source;
Dogimage._({this.source});
factory Dogimage.fromJson(Map<String, dynamic> json) {
    return new Dogimage._(
      source:json['url'].toString(),
    );
  }
}