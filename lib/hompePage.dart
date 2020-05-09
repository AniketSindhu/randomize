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
                    Padding(
                      padding: const EdgeInsets.only(top:8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(" It’s going to be hard, but hard does not mean impossible.",style:TextStyle(fontSize:22,fontWeight: FontWeight.w500,),textAlign: TextAlign.start)),
                    )
                  ],
                ),
              )
            )
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: List.generate(choices.length,(index){
            return card(choice: choices[index]);
          }
        )
      )
    ]
  ),
  backgroundColor: AppColors.primaryWhite,);
}}