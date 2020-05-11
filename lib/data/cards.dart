class Deck {
  final String deck_id;
  Deck({this.deck_id});

  factory Deck.fromJson(Map<String, dynamic> json) {
    return Deck(
      deck_id: json['deck_id'],
    );
  }
}
class randomCard {
  final List list;
  int remaining;
  randomCard({this.list,this.remaining});

  factory randomCard.fromJson(Map<String, dynamic> json) {
    return randomCard(
      list: json['cards'],
      remaining:json['remaining']
    );
  }
}
