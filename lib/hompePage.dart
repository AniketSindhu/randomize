import 'package:flutter/material.dart';
import 'card.dart';
import 'config/colors.dart';
import 'config/size.dart';
import 'cardName.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> { 
  @override
  Widget build(BuildContext context) {
    var height=SizeConfig.getHeight(context);
    var width=SizeConfig.getWidth(context);
    return Scaffold(
      body:Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: height/5,
            margin: EdgeInsets.symmetric(horizontal:width/20,vertical: height/13),
            child: Column(
              children: <Widget>[
                Text("Randomize",style:TextStyle(fontWeight:FontWeight.bold,fontSize:26)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("A random quote",style:TextStyle(fontSize:16)))
              ],
            ),
          ),
          Expanded(
            child:Container(
              margin: EdgeInsets.symmetric(horizontal:width/20),
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(choices.length,(index){
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 16),
                    child: card(choice: choices[index]),
                  );
                  }
                )
              ),
            )
          )
        ],
      ),
      backgroundColor: AppColors.primaryWhite,
    );
  }
}