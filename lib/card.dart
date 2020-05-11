
import 'package:flutter/material.dart';
import 'package:randomize/config/colors.dart';
import 'cardName.dart';
import 'methods.dart';

class Cards extends StatefulWidget {
  const Cards({Key key, this.choice}) : super(key: key);
  final Choice choice;
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {

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
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>{detectTap(widget.choice,context)},
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