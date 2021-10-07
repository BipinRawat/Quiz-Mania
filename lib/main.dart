import 'logindata/loginPage.dart';
import 'quiz2page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz App",
      home: QuizApp(),
    )
  );
}
class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyNavigation();
  }
}
class _MyNavigation extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true,
        title: Text("QUIZ MANIA",style: TextStyle(
            fontWeight: FontWeight.w900,
        color: Colors.black,fontSize: 25),),
      ),
      body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
          FrontImg(),
                   Container(
                     padding: EdgeInsets.only(top: 20.0),
                     alignment: Alignment.topCenter,
                       child: TyperAnimatedTextKit(
                           text: ["IMPROVE ","YOUR","KNOWLEDGE","WITH","QUIZ MANIA"],
                           textStyle: TextStyle(
                               fontSize: 50.0,
                             fontFamily: 'SweetShine',
                             fontWeight: FontWeight.w900,
                             color: Colors.black,
                       ),
                     ),
          ),
        Container(
          padding: EdgeInsets.only(bottom: 20.0),
          alignment: Alignment.bottomRight,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor:0.1 ,
              child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                  side: BorderSide(color: Colors.white)
              ),
            color: Colors.black,
            child: Text("Let's Start",style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.w900,color: Colors.white),),
            onPressed:() {
            Navigator.push(context,
            MaterialPageRoute(builder:
                (context)=>MyPageDetail()
                  )
                );
              }
            ),
          ),
        ),
            Container(
              padding: EdgeInsets.only(bottom: 20.0),
              alignment: Alignment.bottomLeft,
              child: FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor:0.1 ,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        side: BorderSide(color: Colors.white)
                    ),
                    color: Colors.black,
                    child: Text("Login",style: TextStyle(fontSize: 30,
                        fontWeight: FontWeight.w900,color: Colors.white),),
                    onPressed:() {
                      Navigator.push(context,
                          MaterialPageRoute(builder:
                              (context)=>LoginPage()
                          )
                      );
                    }
                ),
              ),
            ),
          ]),
    );
  }
}
class FrontImg extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://images.pexels.com/photos/3683107/pexels-photo-3683107.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      fit: BoxFit.cover,
    );
  }
}