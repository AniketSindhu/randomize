class Deck {
  final String deckId;
  Deck({this.deckId});

  factory Deck.fromJson(Map<String, dynamic> json) {
    return Deck(
      deckId: json['deck_id'],
    );
  }
}
class RandomCard {
  final List list;
  int remaining;
  RandomCard({this.list,this.remaining});

  factory RandomCard.fromJson(Map<String, dynamic> json) {
    return RandomCard(
      list: json['cards'],
      remaining:json['remaining']
    );
  }
}
