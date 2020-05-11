import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:randomize/data/Movies.dart';
import 'package:randomize/data/name.dart';
import 'data/cards.dart';
import 'globals.dart'as globals;

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

 fetchMovie(bool en) async {

  final response = await http.get(en?'https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/top-rated-movies-01.json':'https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/top-rated-indian-movies-01.json');
  if (response.statusCode == 200) {
      globals.movieList = (json.decode(response.body) as List)
          .map((data) => new Movie.fromJson(data))
          .toList();
  } else {
    throw Exception('Failed to load deck');
    }
  }