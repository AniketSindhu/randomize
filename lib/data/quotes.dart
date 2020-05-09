class Quotes {
  final String quoteText;
  final String author;
  Quotes({this.quoteText,this.author});

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
      quoteText: json['quoteText'],
      author: json['author']
    );
  }
}
