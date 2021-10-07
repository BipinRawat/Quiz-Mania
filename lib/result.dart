import 'category.dart';
import 'quiz2page.dart';
import 'tech_quiz_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class resultpage extends StatefulWidget {
  String value;
  int marks;
  resultpage({Key key,@required this.value,@required this.marks}) : super(key: key);

  @override
  _resultpageState createState() => _resultpageState(marks,value);
}

class _resultpageState extends State<resultpage> {
  String value;
  int marks;
  _resultpageState(this.marks,this.value);

  List<String> images =[
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzrOuzTEQzdW6qi9ZJdUmYqJWAvuMWMD1tRA&usqp=CAU",
    "https://previews.123rf.com/images/floralset/floralset1707/floralset170700196/82265135-smiley-emoticon-yellow-face-with-emotions-facial-expression-3d-realistic-emoji-sad-happy-angry-faces.jpg",
    "https://cutewallpaper.org/21/sad-emoji-wallpapers/Sad-Emoji-Images-For-Whatsapp-DP-HD-2019-Whatsapp-Pixel.jpg",

    ];

  String message;
  String image;

  @override
  void initState() {
    if(marks < 20) {
      image = images[2];
      message = "You Should Try Hard..\n " + "You Scored $marks/50";
    } else if(marks < 35) {
      image = images[1];
      message = "You Can Do Better..\n" + "You Scored $marks/50";
    }else{
      image = images[0];
      message = "You Did Very Well..\n" "You Scored $marks/50";
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: Text(
          "Result",
          style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w900),
        ),
      ),
      body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
          BgImage(),
      Column(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Material(
              elevation: 10.0,
              child: Container(
                color: Colors.deepOrange,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Material(
                        child:  Container(
                          width: 500.0,
                          height: 300.0,
                          child: ClipRect(
                            child: Image.network(
                                image,
                              ),
                            ),
                          ),
                        ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 15.0,
                      ),
                        child: Center(
                          child: Text(
                            message,
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.yellowAccent,
                    child: OutlineButton(
                      onPressed: (){
                     Navigator.of(context).pushReplacement(MaterialPageRoute(
                         builder: (context) => category()
                     ));
                    },
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                      borderSide: BorderSide(width: 3.0, color: Colors.black),
                      splashColor: Colors.black,
                      color: Colors.yellowAccent,
                    ),
                  ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  color: Colors.yellowAccent,
                  child: OutlineButton(

                    onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => MyPageDetail()
                      ));
                    },
                    child: Text(
                      "Home Page",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                    borderSide: BorderSide(width: 3.0, color: Colors.black),
                    splashColor: Colors.black,
                    color: Colors.yellowAccent,
                  ),
                )],
              ),
          ),
        ],
      ),
    ])
    );
  }
}
