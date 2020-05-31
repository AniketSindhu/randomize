import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:randomize/config/colors.dart';
import 'cardName.dart';
import 'roulette.dart';
import 'methods.dart';
import 'globals.dart'as globals;

class Cards extends StatefulWidget {
  const Cards({Key key, this.choice}) : super(key: key);
  final Choice choice;
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
 
  
  InterstitialAd _interstitialAd;
  static const MobileAdTargetingInfo targetingInfo=MobileAdTargetingInfo(
  testDevices:<String>[],
  nonPersonalizedAds: true,
  );

  InterstitialAd CreateInterstitialAd(){
    return InterstitialAd(
      adUnitId: 'ca-app-pub-8295782880270632/6252909088',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event){
          print("InterstitialAd $event");
        }
      );
    }

  detectTap(Choice choice,BuildContext context){
    switch (choice.title) {
      case "Random Number":randomNumber(context);
        break;
      case "Roll a dice":dice(context);
        break;
      case "Flip a coin":coin(context);
        break;
      case "Random card":card(context);
        break;
      case "Random name":name(context);
        break;
      case "Random movie":movies(context);
        break;
      case "Random fact":facts(context);
        break;
      case "Yes or no":yesNo(context);
        break;
      case "Random country":countries(context);
        break;
      case "Random game":games(context);
        break;
      case "Random password":randomPass(context);
        break;
      case "Random date":date(context);
        break;
      case "Random location":place(context);
        break;
      case "Random letter":letters(context);
        break;
      case "Custom roulette":Navigator.push(context,MaterialPageRoute(builder: (context)=>Ask()));
        break;
      case "Random color":color(context);
        break;
      case "Random element":elements(context);
        break;
      case "Random wikipedia page":wikipedia(context);
        break;
      case "Random dog breed":dogs(context);
        break;
      case "Random dish":food(context);
        break;
      default:
    }
  }
  void initState(){
    super.initState();
     FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-8295782880270632~5809770541');
     _interstitialAd=CreateInterstitialAd()..load();
  }
  @override
  void dispose() {
    super.dispose();
    _interstitialAd.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        globals.count++;
        print(globals.count);
        detectTap(widget.choice,context);
        if(globals.count%3==0)
        {CreateInterstitialAd()..load()..show();}
      },
      child: Container(
        decoration: BoxDecoration(boxShadow: AppColors.neumorpShadow),
        child: Card(
          color: AppColors.primaryWhite,
          child: Center(
            child:Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                widget.choice.icon,
                Padding(
                  padding: const EdgeInsets.only(top:30),
                  child: Text(widget.choice.title,style: TextStyle(color:Colors.black,fontWeight:FontWeight.w500,fontSize:16),),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}