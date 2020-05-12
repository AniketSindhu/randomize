import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

  class Choice {
    const Choice({this.title, this.icon});
  
    final String title;
  
    final Icon icon;
  }
  
  const List<Choice> choices = const [
    const Choice(title: 'Random Number', icon: Icon(FlutterIcons.sort_numeric_down_faw5s,color: Colors.teal,size: 60,)),
    const Choice(title: 'Roll a dice', icon: Icon(FlutterIcons.dice_faw5s,color: Colors.teal,size: 60,)),
    const Choice(title: 'Flip a coin', icon: Icon(FlutterIcons.coins_faw5s,color: Colors.teal,size: 60,)),
    const Choice(title: 'Random card', icon: Icon(FlutterIcons.cards_playing_outline_mco,color: Colors.teal,size: 60,)),
    const Choice(title: 'Yes or no', icon: Icon(FlutterIcons.thumbs_up_faw5s,color: Colors.teal,size: 60,)),
    const Choice(title: 'Random password', icon: Icon(FlutterIcons.key_faw5s,color: Colors.teal,size: 60,)),
    const Choice(title: 'Custom roulette', icon: Icon(FlutterIcons.spinner_faw5s,color: Colors.teal,size: 60,)),
    const Choice(title: 'Random name', icon: Icon(FlutterIcons.signature_faw5s,color: Colors.teal,size: 60,)),
    const Choice(title: 'Random movie', icon: Icon(FlutterIcons.film_faw5s,color: Colors.teal,size: 60,)),
    const Choice(title: 'Random fact', icon: Icon(FlutterIcons.surprise_faw5s,color: Colors.teal,size: 60,)),
    const Choice(title: 'Random country', icon: Icon(FlutterIcons.globe_faw5s,color: Colors.teal,size: 60,)),
    const Choice(title: 'Random place', icon: Icon(FlutterIcons.location_arrow_faw5s,color: Colors.teal,size: 60,)),
    const Choice(title: 'Random date', icon: Icon(FlutterIcons.calendar_day_faw5s,color: Colors.teal,size: 60,)),
    const Choice(title: 'Random game', icon:Icon(FlutterIcons.gamepad_faw5s,color: Colors.teal,size: 60,) ),
  ];