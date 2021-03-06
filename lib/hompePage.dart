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
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  
  Future<Quotes> quotes;
  
  BannerAd _bannerAd;
  
  static const MobileAdTargetingInfo targetingInfo=MobileAdTargetingInfo(
  testDevices:<String>[],
  nonPersonalizedAds: true,
  );
  
  BannerAd CreateBannerAd(){
    return BannerAd(
      adUnitId: 'ca-app-pub-8295782880270632/6775367851',
      size: AdSize.fullBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event){
        print("banner ad $event");
      }
    );
  }
  
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
  Future<void> share() async {
    await FlutterShare.share(
      title: 'Hey,I found out a great app!',
      text: 'Use this app to genrate random numbers,color,countries,movies & many more.',
      linkUrl: 'https://play.google.com/store/apps/details?id=com.aniket.randomize',
      chooserTitle: 'Hey,I found out a great app!'
    );
  }

  void initState(){
    super.initState();
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-8295782880270632~5809770541');
    _bannerAd=CreateBannerAd()..load()..show();
    
    quotes=fetchQuotes();
    fetchDeck().then((data) {
      globals.deckId=data.deckId;
      fetchCard(globals.deckId).then((data1) {
        globals.image=data1.list[0]['image'];
        globals.remaining=data1.remaining;
      });
    });
    
    fetchMovie(true);
    fetchFact().then((value) {
      globals.fact=value.fact;
    });
    fetchCountries();
    fetchGame();
    fetchElement();
    fetchDog();
    fetchFood();
  }
@override
  void dispose(){
    _bannerAd..dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height=SizeConfig.getHeight(context);
    var width=SizeConfig.getWidth(context);
    return Column(
      children: <Widget>[
        Expanded(
          child: Scaffold(
            drawer: Drawer(
              
              child: Container(
                color: AppColors.primaryWhite,
                child: ListView(
                   padding: EdgeInsets.only(top:20),
                   children: <Widget>[
                     DrawerHeader(
                       decoration: BoxDecoration(
                         color: Colors.teal,
                         image: DecorationImage(
                           image: AssetImage("assets/icon.png"),
                            fit: BoxFit.scaleDown),
                       ),
                       child: Align(alignment:Alignment.bottomLeft,child: Text('Randomize',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black),)),
                     ),
                     ListTile(
                       title: Text('Share with your friends',style: TextStyle(fontSize:20,color: Colors.black),),
                       leading: Icon(Icons.share,size: 40,color: Colors.teal,),
                       onTap: () {
                         share();
                        },
                      ),
                      Divider(height:3,color: Colors.black,),
                      ListTile(
                      title: Text('Rate the app',style: TextStyle(fontSize:20,color: Colors.black),),
                      leading: Icon(Icons.star,size: 40,color: Colors.teal,),
                      onTap: () {
                        launch('https://play.google.com/store/apps/details?id=com.aniket.randomize');
                      },
                     ),
                     Divider(height:3,color: Colors.black,),
                     ListTile(
                      title: Text('About the developer',style: TextStyle(fontSize:20,color: Colors.black),),
                      leading: Icon(Icons.developer_mode,size: 40,color: Colors.teal,),
                      onTap: () {
                         launch('https://github.com/AniketSindhu');
                      },
                     ),
                      Divider(height:3,color: Colors.black,),
                    ],
                  ),
              ),
             ),
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
                                future: quotes,
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
  backgroundColor: AppColors.primaryWhite,),
        ),
        Container(
          height:60,
          color:Colors.indigo[50]
        )
      ],
    );
}}