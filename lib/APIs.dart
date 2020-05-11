import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:randomize/data/name.dart';
import 'data/cards.dart';

Future<Deck> fetchDeck() async {
  final response = await http.get('https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Deck.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load deck');
  }
}
Future<randomCard> fetchCard(String deck_id) async {
  final response = await http.get('https://deckofcardsapi.com/api/deck/$deck_id/draw/?count=1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('$deck_id');
    return randomCard.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load deck');
  }
}

Future<Name> fetchName() async {
  final response = await http.get('https://api.namefake.com/');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Name.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load deck');
  }
}