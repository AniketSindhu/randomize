import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:randomize/data/Movies.dart';
import 'package:randomize/data/dog.dart';
import 'package:randomize/data/games.dart';
import 'data/cards.dart';
import 'data/countries.dart';
import 'data/elements.dart';
import 'data/facts.dart';
import 'data/meal.dart';
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
Future<RandomCard> fetchCard(String deckId) async {
  final response = await http.get('https://deckofcardsapi.com/api/deck/$deckId/draw/?count=1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return RandomCard.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load deck');
  }
}

 fetchMovie(bool en) async {

  final response = await http.get(en?'https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/top-rated-movies-02.json':'https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/top-rated-indian-movies-01.json');
  if (response.statusCode == 200) {
      globals.movieList = (json.decode(response.body) as List)
          .map((data) => new Movie.fromJson(data))
          .toList();
  } else {
    throw Exception('Failed to load deck');
    }
  }

  Future<Fact> fetchFact() async {
  final response = await http.get('https://uselessfacts.jsph.pl/random.json?language=en');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Fact.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load deck');
  }
}

 fetchCountries() async {

  final response = await http.get('https://restcountries.eu/rest/v2/all');
  if (response.statusCode == 200) {
      globals.countryList = (json.decode(response.body) as List)
          .map((data) => new Country.fromJson(data))
          .toList();
  } else {
    throw Exception('Failed to load deck');
    }
  }

  fetchGame() async {

  final response = await http.get('https://phe0nix.github.io/sample-games-json-list/');
  if (response.statusCode == 200) {
      globals.gameList = (json.decode(response.body) as List)
          .map((data) => new Game.fromJson(data))
          .toList();
  } else {
    throw Exception('Failed to load deck');
    }
  }

  fetchElement() async {

  final response = await http.get('https://raw.githubusercontent.com/Bowserinator/Periodic-Table-JSON/master/PeriodicTableJSON.json');
  if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var rest = data["elements"] as List;
        globals.elementList = rest.map<Elements>((json) => Elements.fromJson(json)).toList();

  } else {
    throw Exception('Failed to load deck');
    }
  }

fetchDog() async {

  final response = await http.get('https://api.thedogapi.com/v1/images/search?size=med&mime_types=jpg&format=json&has_breeds=true&order=RANDOM&page=0&limit=1');
  if (response.statusCode == 200) {
    print('done');
        var data = json.decode(response.body);
        var rest = data[0]['breeds'] as List;
        var img =data as List;
        globals.dogimg=img.map<Dogimage>((json) => Dogimage.fromJson(json)).toList();
        globals.dogList = rest.map<Dogs>((json) => Dogs.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load deck');
    }
  }

fetchFood() async {

  final response = await http.get('https://www.themealdb.com/api/json/v1/1/random.php');
  if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var rest = data['meals'] as List;
        globals.foodList = rest.map<Meal>((json) => Meal.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load deck');
    }
  }