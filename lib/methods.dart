import 'package:flutter/material.dart';
import 'dart:math';
import 'config/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';

randomNumber(BuildContext context){
    String result;
    final fromController=TextEditingController();
    final toController=TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context){
      return StatefulBuilder(
        builder:(context,setState){
      return AlertDialog(
        actions: <Widget>[FlatButton(
          onPressed:(){
            Navigator.pop(context);
            fromController.clear();
            toController.clear();
          },
        child: Text("Done",style: TextStyle(fontSize:14),))],
        backgroundColor: AppColors.primaryWhite,
        title:Center(child: Text("Random Number",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
        content: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text("Draw From",style: TextStyle(fontWeight:FontWeight.w500),),
                TextField(
                  decoration: InputDecoration(
                  labelText:"Enter starting no",),
                  keyboardType: TextInputType.number,
                  controller: fromController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:18),
                  child: Text("To",style: TextStyle(fontWeight:FontWeight.w500)),
                ),
                TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                  labelText:"Enter end no",),
                  keyboardType: TextInputType.number,
                  controller: toController,                
                ),
                SizedBox(height:20),
                RaisedButton(
                  onPressed:(){
                    if(fromController.text.length==0||toController.text.length==null)
                      { 
                        setState(() {
                          result='Text feild cant be empty';
                        });
                      }
                    else if(int.parse(fromController.text)>int.parse(toController.text))
                    { setState(() {
                        result='check your values';
                      });
                    }
                    else if(fromController.text.length>10||toController.text.length>10)
                      {
                        setState(() {
                          result="Max 10 digits allowed";
                        });
                      }
                    else
                    { Random random = new Random();  
                      setState(() {
                        result=(int.parse(fromController.text)+ random.nextInt(int.parse(toController.text)- int.parse(fromController.text))).toString();
                        
                      });
                      print("$result");
                    }
                  },
                  child:Text("Draw"),
                ),
                SizedBox(height:20),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("The Result:",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:16,left:16,right:16,),
                  child: Container(
                    width: 200,
                    height: 40,
                    child: Center(child: Text(result==null?"":"$result",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.red),)),
                    color: Colors.black,),
                )    
              ]
            ),
          ),
        ),
        );
      });
      }
    );
  }

  dice(BuildContext context){
    int rand =Random().nextInt(6) + 1;
    showDialog(
      context: context,
      builder: (BuildContext context){
        return StatefulBuilder(
          builder:(context,setState){
            return AlertDialog(
              actions: <Widget>[
                RaisedButton(
                  onPressed:(){
                    setState(() {
                        rand=Random().nextInt(6) + 1;
                      });
                  },
                  child:Text("Roll it again",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black)),
                  color: Colors.teal,
                  disabledColor: Colors.teal,
                ),
                SizedBox(width: 20,),                               
                FlatButton(
                  onPressed:(){
                    Navigator.pop(context);},
                  child: Text("Done",style: TextStyle(fontSize:18),)),
              ],
              backgroundColor: AppColors.primaryWhite,
              title:Center(child: Text("Roll A Dice",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              content: Expanded(
                child: Roll_a_dice(rand)
              )
            );
          }
        );
      }
    );
  }

  Widget Roll_a_dice(int random){
    switch (random) {
      case 1:return Icon(FlutterIcons.dice_one_faw5s,color: Colors.redAccent,size:180);
        break;
      case 2:return Icon(FlutterIcons.dice_two_faw5s,color: Colors.redAccent,size:180);
        break;
      case 3:return Icon(FlutterIcons.dice_three_faw5s,color: Colors.redAccent,size:180);
        break;
      case 4:return Icon(FlutterIcons.dice_four_faw5s,color: Colors.redAccent,size:180);
        break;
      case 5:return Icon(FlutterIcons.dice_five_faw5s,color: Colors.redAccent,size:180);
        break;
      case 6:return Icon(FlutterIcons.dice_six_faw5s,color: Colors.redAccent,size:180);
        break;      
      default:
    }
  }