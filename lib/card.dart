import 'package:flutter/material.dart';
import 'package:randomize/config/colors.dart';
import 'cardName.dart';


class card extends StatelessWidget {
  const card({Key key, this.choice}) : super(key: key);
  final Choice choice;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: AppColors.neumorpShadow),
      child: Card(
        color: AppColors.primaryWhite,
        child: Center(
          child:Column(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Icon(choice.icon,size: 70,color:Colors.amber,),
            Text(choice.title,style: TextStyle(color:Colors.black,fontWeight:FontWeight.w500),)
          ],)
        ),
      ),
    );
  }
}