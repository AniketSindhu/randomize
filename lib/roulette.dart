import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';

class Ask extends StatefulWidget {
  @override
  _AskState createState() => _AskState();
}

class _AskState extends State<Ask> {
  TextEditingController first=TextEditingController();
  TextEditingController second=TextEditingController();
  TextEditingController third=TextEditingController();
  TextEditingController fourth=TextEditingController();
  TextEditingController fifth=TextEditingController();
  TextEditingController sixth=TextEditingController();
  @override
  void dispose() {
    super.dispose();
    first.dispose();
    second.dispose();
    third.dispose();
    fourth.dispose();
    fifth.dispose();
    sixth.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Map<int, String> labels;
    return Scaffold(
      appBar:AppBar(title:Text("Custom Roulette",style: TextStyle(color:Colors.black),),backgroundColor: Colors.amber,elevation: 4.0,centerTitle: true,),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Center(
          child:Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Enter six objects/name and remember the color",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color:Colors.white),),
              ),
              TextField(
                controller: first,
                maxLength: 10,
                style: TextStyle(color:Colors.purple,fontSize: 20,fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color:Colors.purple,fontSize: 20,fontWeight: FontWeight.w500),
                  hintText: "First input(Purple)",
                  suffixIcon: Icon(FlutterIcons.circle_faw5s,color: Colors.purple,),
                  contentPadding: EdgeInsets.symmetric(vertical:10,horizontal:5)),
              ),
              TextField(
                controller:second,
                maxLength: 10,
                style: TextStyle(color:Color.fromRGBO(255,0,255,1),fontSize: 20,fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color:Color.fromRGBO(255,0,255,1),fontSize: 20,fontWeight: FontWeight.w500),
                  hintText: "Second input(Magenta)",
                  suffixIcon: Icon(FlutterIcons.circle_faw5s,color: Color.fromRGBO(255,0,255,1)),
                  contentPadding: EdgeInsets.symmetric(vertical:10,horizontal:5)),
              ),
              TextField(
                controller: third,
                maxLength: 10,
                style: TextStyle(color:Colors.redAccent,fontSize: 20,fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color:Colors.redAccent,fontSize: 20,fontWeight: FontWeight.w500),
                  hintText: "Third input(Red)",
                  suffixIcon: Icon(FlutterIcons.circle_faw5s,color: Colors.redAccent,),
                  contentPadding: EdgeInsets.symmetric(vertical:10,horizontal:5)),
              ),
              TextField(
                controller: fourth,
                maxLength: 10,
                style: TextStyle(color:Colors.orange[600],fontSize: 20,fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color:Colors.orange[600],fontSize: 20,fontWeight: FontWeight.w500),
                  hintText: "Third input(Dark orange)",
                  suffixIcon: Icon(FlutterIcons.circle_faw5s,color: Colors.orange[600]),
                  contentPadding: EdgeInsets.symmetric(vertical:10,horizontal:5)),
              ),
              TextField(
                controller: fifth,
                maxLength: 10,
                style: TextStyle(color:Colors.orange[200],fontSize: 20,fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color:Colors.orange[200],fontSize: 20,fontWeight: FontWeight.w500),
                  hintText: "Fifth input(Light orange)",
                  suffixIcon: Icon(FlutterIcons.circle_faw5s,color: Colors.orange[200],),
                  contentPadding: EdgeInsets.symmetric(vertical:10,horizontal:5)),
              ),
              TextField(
                controller: sixth,
                maxLength: 10,
                style: TextStyle(color:Colors.yellow[200],fontSize: 20,fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color:Colors.yellow[200],fontSize: 20,fontWeight: FontWeight.w500),
                  hintText: "Sixth input(Yellow)",
                  suffixIcon: Icon(FlutterIcons.circle_faw5s,color: Colors.yellow[200],),
                  contentPadding: EdgeInsets.symmetric(vertical:10,horizontal:5)),
              ),
              SizedBox(height:20),
              RaisedButton(
                color: Colors.amber,
                child: new Text("Roll It",style: TextStyle(color:Colors.black,fontWeight:FontWeight.w500),),
                onPressed: () {
                  labels = {
                    1: first.text,
                    2: second.text,
                    3: third.text,
                    4: fourth.text,
                    5: fifth.text,
                    6: sixth.text,
                  };
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Basic(labels)));
                }
              )              
            ],
          )
        ),
      ),
    );
  }
}



class Basic extends StatelessWidget {
  final StreamController _dividerController = StreamController<int>();
  final _wheelNotifier = StreamController<double>();
  final Map<int, String> labels;
  Basic(this.labels);
  dispose() {
    _dividerController.close();
    _wheelNotifier.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Custom Roulette",style: TextStyle(color:Colors.black),),backgroundColor: Colors.amber,elevation: 4.0,centerTitle: true,),
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinningWheel(
              Image.asset('assets/wheel-6-300.png'),
              secondaryImage:Image.asset('assets/roulette-center-300.png'),
              secondaryImageHeight: 110,
              secondaryImageWidth: 110,
              width: 310,
              height: 310,
              canInteractWhileSpinning: false,
              initialSpinAngle: _generateRandomAngle(),
              spinResistance: 0.2,
              dividers: 6,
              onUpdate: _dividerController.add,
              onEnd: _dividerController.add,
              shouldStartOrStop: _wheelNotifier.stream,
            ),
            StreamBuilder(
              stream: _dividerController.stream,
              builder: (context, snapshot) =>
                  snapshot.hasData ? BasicScore(snapshot.data,labels) : Container(),
            ),
            SizedBox(height:30),
            new RaisedButton(
              color: Colors.amber,
              child: new Text("Roll It",style: TextStyle(color:Colors.black,fontWeight:FontWeight.w500),),
              onPressed: () =>
                  _wheelNotifier.sink.add(_generateRandomVelocity()),
            )
          ],
        ),
      ),
    );
  }

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
  double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;
}

class BasicScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels;

  BasicScore(this.selected,this.labels);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]}',
        style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20,color: Colors.redAccent));
  }
}
