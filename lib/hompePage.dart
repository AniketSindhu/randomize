import 'package:flutter/material.dart';
import 'card.dart';
import 'config/colors.dart';
import 'config/size.dart';
import 'cardName.dart';
import 'package:http/http.dart' as http;
import 'data/quotes.dart';
import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'globals.dart'as globals;
import 'APIs.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  
  Future<Quotes> quotes;

  Future<Quotes> fetchQuotes() async {
  final response = await http.get('https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Quotes.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

  void initState(){
    super.initState();
    fetchDeck().then((data) {
      globals.deck_id=data.deck_id;
      fetchCard(globals.deck_id).then((data1) {
        globals.image=data1.list[0]['image'];
        globals.remaining=data1.remaining;
      });
    });
    fetchCountries();
    fetchGame();
  }
  @override
  Widget build(BuildContext context) {
    var height=SizeConfig.getHeight(context);
    var width=SizeConfig.getWidth(context);
    return Scaffold(
      body:CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppColors.primaryWhite,
            pinned: true,
            floating: true,
            expandedHeight: height/3.5,
            title: Text("Randomize",style:TextStyle(fontWeight:FontWeight.bold,fontSize:30,color: Colors.black)),
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left:width/20,right:width/20,top: height/9.6),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:14),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("A random quote:",style:TextStyle(fontSize:18))),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FutureBuilder<Quotes>(
                          future: fetchQuotes(),
                          builder: (context, snapshot) {
                            if(snapshot.hasData){
                            return AutoSizeText("${snapshot.data.quoteText}",style:TextStyle(fontSize:21,fontWeight: FontWeight.w500,),textAlign: TextAlign.start);
                            }
                            else if(snapshot.hasError){
                            return AutoSizeText("Everything is good if you have good internet",style:TextStyle(fontSize:21,fontWeight: FontWeight.w500,),textAlign: TextAlign.start);
                            }
                            return Center(child: CircularProgressIndicator());
                          }
                        )),
                    )
                  ],
                ),
              )
            )
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: List.generate(choices.length,(index){
            return Cards(choice: choices[index]);
          }
        )
      )
    ]
  ),
  backgroundColor: AppColors.primaryWhite,);
}}