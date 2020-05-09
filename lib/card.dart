
import 'package:flutter/material.dart';
import 'package:randomize/config/colors.dart';
import 'cardName.dart';
import 'methods.dart';

class card extends StatefulWidget {
  const card({Key key, this.choice}) : super(key: key);
  final Choice choice;
  @override
  _cardState createState() => _cardState();
}

class _cardState extends State<card> {

  detectTap(Choice choice,BuildContext context){
    switch (choice.title) {
      case "Random Number":randomNumber(context);
        break;
      case "Roll a dice":dice(context);
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