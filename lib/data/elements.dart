class Elements {
  final String name;
  final String config,symbol,source;
  final int number;
  final double mass;
Elements._({this.name, this.config,this.symbol,this.source,this.number,this.mass});
factory Elements.fromJson(Map<String, dynamic> json) {
    return new Elements._(
      name: json['name'],
      config: json['electron_configuration'],
      symbol:json['symbol'],
      source:json['source'],
      number:json['number'].toInt(),
      mass:json['atomic_mass'].toDouble()
    );
  }
}