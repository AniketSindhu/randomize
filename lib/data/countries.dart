class Country {
  final String name;
  final String url,capital,continent;
Country._({this.name, this.url,this.capital,this.continent});
factory Country.fromJson(Map<String, dynamic> json) {
    return new Country._(
      name: json['name'],
      url: json['flag'],
      capital:json['capital'],
      continent:json['region']
    );
  }
}