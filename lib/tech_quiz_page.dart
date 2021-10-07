import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'main.dart';
import 'result.dart';
import 'package:flutter/material.dart';

class loadjson extends StatelessWidget {

  String langname;
  loadjson(this.langname);
  String assettoload;

  setasset() {
    if (langname == "Python") {
      assettoload = "assets/python.json";
    } else if (langname == "JavaScript") {
      assettoload = "assets/javascript.json";
    } else if (langname == "C++") {
      assettoload = "assets/cpp.json";
    } else {
      assettoload = "assets/html.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return Scaffold(
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
        builder: (context, snapshot){
          List mydata = json.decode(snapshot.data.toString());
          if (mydata == null){
              return Center(
                child: Text(
                    "Loading",
                  ),
                );
                 }
          else{
            return quizpage(mydata : mydata);
          }
        },
      ),
    );
  }
}
class quizpage extends StatefulWidget {

  final mydata;

  quizpage({Key key,@required this.mydata}) : super(key: key);

  @override
  _quizpageState createState() => _quizpageState(mydata: mydata);
}

class _quizpageState extends State<quizpage> {
 List mydata;
  _quizpageState({this.mydata});
  int i=1;
  int marks=0;
  Color colortoshow = Colors.cyan;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int timer = 30;
  bool canceltimer = false;
  String showtimer = "30";
  Map<String,Color> btncolor = {
    "a" : Colors.cyan,
    "b" : Colors.cyan,
    "c" : Colors.cyan,
    "d" : Colors.cyan,
  };

  void nextquestion(){             //nextquestion
    canceltimer = false;
    timer = 30;
    setState(() {
      if(i<10){
        i++;
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(
         builder: (context) => resultpage(marks : marks),
         ));
      }
      btncolor["a"] = Colors.cyan;
      btncolor["b"] = Colors.cyan;
      btncolor["c"] = Colors.cyan;
      btncolor["d"] = Colors.cyan;
    });
    starttimer();
  }
  @override
  void initstate() {
    starttimer();
    super.initState();
  }
  @override
  void setState(fn){
    if(mounted) {
      super.setState(fn);
    }
  }

  void starttimer() async {                //timer
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if(timer < 1){
          t.cancel();
          nextquestion();
        }
        else if(canceltimer == true) {
          t.cancel();
        }
        else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void checkanswer(String k) {                    //answercheck
    if(mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      //answer is correct
      marks = marks + 5;
      colortoshow = right;
    }else{
      colortoshow = wrong;
    }
    setState(() {
        canceltimer = true;
        btncolor[k] = colortoshow;
        Timer(Duration(seconds: 1),nextquestion);
    });
  }
Widget choicebutton(String k){                      //choicebutton
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0),
    child: MaterialButton(
      onPressed: () => checkanswer(k),
      child: Text(
        mydata[1][i.toString()][k],
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
        maxLines: 1,
      ),
      color: btncolor[k],
      splashColor: Colors.cyan[700],
      highlightColor: Colors.cyan[700],
      minWidth: 200.0,
      height: 45.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return showDialog(context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "DIT Quiz",
            ),
            content: Text(
              "You Can't Go Back At this Stage."
            ),
            actions: <Widget>[
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
                  child: Text(
                    "OK"
                  ),
              )
            ],
          )
          );
        },
    child: Scaffold(
      body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            TeckQuizBgImage(),
         Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Container(
                 padding: EdgeInsets.all(15.0),
                 alignment: Alignment.bottomLeft,
                 child: Text(
                   "Q -  " + mydata[0][i.toString()],
                   style: TextStyle(
                     fontSize: 20.0,
                     fontWeight: FontWeight.w900,
                     color: Colors.white
                   ),
                 ),
                )
            ),
            Expanded(
                flex: 6,
                child: Container(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     choicebutton('a'),
                     choicebutton('b'),
                     choicebutton('c'),
                     choicebutton('d'),
                   ],
                 ),
                )
            ),
            SpinKitHourGlass(color: Colors.redAccent,
              size: 40.0,),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Center(
                    child: Text(
                      showtimer,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
            )
          ]
        ),
    ]
      ),
    ),
    );
  }
}
class TeckQuizBgImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.network(
     "https://images.unsplash.com/photo-1529753253655-470be9a42781?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTE3fHxibGFjayUyMHRleHR1cmV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      fit: BoxFit.cover,
      color: Colors.black.withOpacity(0.2),
      colorBlendMode: BlendMode.darken,
    );
  }
}