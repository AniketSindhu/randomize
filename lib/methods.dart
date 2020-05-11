import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:randomize/card.dart';
import 'dart:math';
import 'config/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'globals.dart'as globals;
import 'data/Movies.dart';
import 'APIs.dart';

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
        scrollable: true,
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
                  child:Container(
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
      }
    );
  }
);
}

  dice(BuildContext context){
    int num=1;
    List<int> randoms=[1,2,3,4,5,6];
    int total=0;
    const menuitems=<int>[1,2,3,4,5,6];
    final List<DropdownMenuItem<String>>_dropmenuitems=menuitems.map((int value) => DropdownMenuItem<String>(child:Text(value.toString()),value:value.toString(),)).toList();
    showDialog(
      context: context,
      builder: (BuildContext context){
        return StatefulBuilder(
          builder:(context,setState){
            return AlertDialog(
              scrollable: true,
              actions: <Widget>[
                RaisedButton(
                  onPressed:(){
                    total=0;
                    for(int i=0;i<=5;i++)
                      {
                        randoms[i]=Random().nextInt(6) + 1;
                          if(i<num)
                          {
                            total=total+randoms[i];
                          }
                      }                    
                    setState(() {
                    });
                  },
                  child:Text("Roll it",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black)),
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
              title:Center(child: Text("Roll The Dice",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              content: Center(
                child: Column(
                  children: <Widget>[
                    Text("How many dice you want to roll?",style: TextStyle(fontSize: 18),),
                    DropdownButton(
                      items:_dropmenuitems,
                      value: num.toString(),
                      iconDisabledColor: Colors.teal,
                      iconEnabledColor: Colors.teal,
                      style: TextStyle(color:Colors.teal,fontWeight:FontWeight.w500,fontSize: 18),
                      onChanged:(String value){
                        total=0;
                       setState(() {
                        num=int.parse(value);
                        for(int i=0;i<num;i++)
                          {
                            total=total+randoms[i];
                          }
                      });
                      }
                    ),
                    howMany(randoms,num),
                    SizedBox(height:10),
                    Text("Dice Total:$total",style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.w500),)
                  ],
                ),
              )
            );
          }
        );
      }
    );
  }
  Widget howMany(List<int>random,int num){
    if(num==1)
      {
        return rollaDice(random[0]);
      }
    else if(num==2)
      {
        return Wrap(
          spacing: 10,
          children: <Widget>[rollaDice(random[0]),rollaDice(random[1])]
        );
      }
    else if(num==3)
      {
        return Wrap(
          spacing: 10,
          children: <Widget>[rollaDice(random[0]),rollaDice(random[1]),rollaDice(random[2])]
        );
      }
    else if(num==4)
      {
        return Wrap(
          spacing: 10,
          children: <Widget>[rollaDice(random[0]),rollaDice(random[1]),rollaDice(random[2]),rollaDice(random[3])]
        );
      }
    else if(num==5)
      {
        return Wrap(
          spacing: 10,
          children: <Widget>[rollaDice(random[0]),rollaDice(random[1]),rollaDice(random[2]),rollaDice(random[3]),rollaDice(random[4])]
        );
      }
    else
      {
        return Wrap(
          spacing: 10,
          children: <Widget>[rollaDice(random[0]),rollaDice(random[1]),rollaDice(random[2]),rollaDice(random[3]),rollaDice(random[4]),rollaDice(random[5])]
        );
      }
  }

  Widget rollaDice(int random){
    switch (random) {
      case 1:return Icon(FlutterIcons.dice_one_faw5s,color: Colors.redAccent,size: 120,);
        break;
      case 2:return Icon(FlutterIcons.dice_two_faw5s,color: Colors.redAccent,size:120);
        break;
      case 3:return Icon(FlutterIcons.dice_three_faw5s,color: Colors.redAccent,size:120);
        break;
      case 4:return Icon(FlutterIcons.dice_four_faw5s,color: Colors.redAccent,size:120);
        break;
      case 5:return Icon(FlutterIcons.dice_five_faw5s,color: Colors.redAccent,size:120);
        break;
      case 6:return Icon(FlutterIcons.dice_six_faw5s,color: Colors.redAccent,size:120);
        break;      
      default:return Container();
    }
  }

  coin(BuildContext context){
    int rand =Random().nextInt(1) + 1;
    String selected="India";
    Random random = new Random();
    const menuitems=<String>["India","USD","Yen","Dhiram","Pounds","Antique"];
    final List<DropdownMenuItem<String>>_dropmenuitems=menuitems.map((String value) => DropdownMenuItem<String>(child:Text(value),value:value.toString(),)).toList();
    showDialog(
      context: context,
      builder: (BuildContext context){
        return StatefulBuilder(
          builder:(context,setState){
            return AlertDialog(
              scrollable: true,
              actions: <Widget>[
                RaisedButton(
                  onPressed:(){
                    setState(() {
                      rand =Random().nextInt(2) + 1;
                    });                    
                  },
                  child:Text("Flip it",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black)),
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
              title:Center(child: Text("Flip A Coin",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              content: Center(
                child: Column(
                  children: <Widget>[
                    Text("What coin you want to flip?",style: TextStyle(fontSize: 18),),
                    DropdownButton(
                      items:_dropmenuitems,
                      value: selected,
                      iconDisabledColor: Colors.teal,
                      iconEnabledColor: Colors.teal,
                      style: TextStyle(color:Colors.teal,fontWeight:FontWeight.w500,fontSize: 18),
                      onChanged:(String value){
                        setState(() {
                          selected=value;
                        });
                      }
                    ),
                    Container(
                      child:Image(
                        width: MediaQuery.of(context).size.width/2,
                        height: MediaQuery.of(context).size.width/2,
                        fit: BoxFit.fill,
                        image:AssetImage('assets/coins/${selected.toLowerCase()}_$rand.jpeg')) ),
                    SizedBox(height:10),
                    Text("Its a ${rand==2?"tails":"Heads"}",style: TextStyle(color:Color.fromARGB(255, random.nextInt(150), random.nextInt(255), random.nextInt(255)),fontWeight: FontWeight.w500,fontSize: 20),)
                  ],
                ),
              )
            );
          }
        );
      }
    );
  }


 card(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return StatefulBuilder(
          builder:(context,setState){
            return AlertDialog(
              scrollable: true,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: RaisedButton(
                    onPressed:(){
                      setState(() {
                        globals.remaining=52;
                        fetchDeck().then((data) {
                        globals.deck_id=data.deck_id;
                        fetchCard(globals.deck_id).then((data1) {
                          globals.image=data1.list[0]['image'];
                          globals.remaining=data1.remaining;
                          });
                        });
                      });                    
                    },
                    child:Text("New Deck",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black)),
                    color: Colors.redAccent,
                    disabledColor: Colors.redAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: RaisedButton(
                    onPressed:(){
                      fetchCard(globals.deck_id).then((data1) {
                        globals.image=data1.list[0]['image'];
                        globals.remaining=data1.remaining;
                      });
                      setState(() {
                      });                   
                    },
                    child:Text("Draw",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black)),
                    color: Colors.teal,
                    disabledColor: Colors.teal,
                  ),
                ),                             
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FlatButton(
                    onPressed:(){
                      Navigator.pop(context);},
                    child: Text("Done",style: TextStyle(fontSize:18),)),
                ),
              ],
              backgroundColor: AppColors.primaryWhite,
              title:Center(child: Text("Random Card",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              content: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      child:Image(
                        width: MediaQuery.of(context).size.width/2,
                        height: MediaQuery.of(context).size.height/3,
                        fit: BoxFit.fill,
                        image:NetworkImage(globals.image==null?'https://res.cloudinary.com/teepublic/image/private/s--FfQ2HfW9--/t_Resized%20Artwork/c_fit,g_north_west,h_954,w_954/co_ffffff,e_outline:48/co_ffffff,e_outline:inner_fill:48/co_ffffff,e_outline:48/co_ffffff,e_outline:inner_fill:48/co_bbbbbb,e_outline:3:1000/c_mpad,g_center,h_1260,w_1260/b_rgb:eeeeee/c_limit,f_jpg,h_630,q_90,w_630/v1533062864/production/designs/2961761_0.jpg':globals.image))),
                    SizedBox(height:20),
                    Text("Remaining Cards: ${globals.remaining}",style: TextStyle(color: Colors.purpleAccent,fontWeight: FontWeight.w500,fontSize: 18),)
                  ],
                ),
              )
            );
          }
        );
      }
    );
  }

  name(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return StatefulBuilder(
          builder:(context,setState){
            return AlertDialog(
              scrollable: true,
              actions: <Widget>[
                RaisedButton(
                  onPressed:(){               
                    setState(() {
                      fetchName().then((data) {globals.name=data.name;});
                    });
                  },
                  child:Text("Try again",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black)),
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
              title:Center(child: Text("Random Name",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              content: Center(
                child: Text(globals.name==null?"":globals.name,style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.w500,fontSize: 30),),
              )
            );
          }
        );
      }
    );
  }
  movies(BuildContext context){
    const menuitems=<String>["Hollywood","Bollywood"];
    Random random = new Random();
    int rand=(0+ random.nextInt(116));
    String selected="Hollywood"; 
    final List<DropdownMenuItem<String>>_dropmenuitems=menuitems.map((String value) => DropdownMenuItem<String>(child:Text(value),value:value.toString(),)).toList();
    showDialog(
      context: context,
      builder: (BuildContext context){
        return StatefulBuilder(
          builder:(context,setState){
            return AlertDialog(
              scrollable: true,
              actions: <Widget>[
                RaisedButton(
                  onPressed:(){                  
                    setState((){
                      rand=(0+ random.nextInt(116));
                      print(rand);
                    });
                  },
                  child:Text("Draw",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black)),
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
              title:Center(child: Text("Random Movie",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              content: Center(
                child: Column(
                  children: <Widget>[
                    DropdownButton(
                      items:_dropmenuitems,
                      value: selected,
                      iconDisabledColor: Colors.teal,
                      iconEnabledColor: Colors.teal,
                      style: TextStyle(color:Colors.teal,fontWeight:FontWeight.w500,fontSize: 18),
                      onChanged:(String value){
                       setState(() {
                        selected=value;
                        value=="Hollywood"?fetchMovie(true):fetchMovie(false);
                      });
                      }
                    ),
                    Container(
                      child:Image(
                        width: MediaQuery.of(context).size.width/2,
                        height: MediaQuery.of(context).size.height/3,
                        fit: BoxFit.fill,
                        image:NetworkImage(globals.movieList[rand].url))),                    
                    SizedBox(height:10),
                    Text("Ttile:${globals.movieList[rand].title}",style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.w500,fontSize: 18),textAlign: TextAlign.center,),
                    Text("Year:${globals.movieList[rand].year}",style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.w500,fontSize: 18),),
                    Text("IMDb rating:${globals.movieList[rand].rating}",style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.w500,fontSize: 18),)
                  ],
                ),
              )
            );
          }
        );
      }
    );
  }

