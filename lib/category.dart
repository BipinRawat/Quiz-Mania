import 'tech_quiz_home.dart';
import 'package:flutter/material.dart';
import 'gk_quiz_home.dart';

class category extends StatefulWidget {

  String value;
  category({Key key,@required this.value}) : super(key: key);
  @override
  _categoryState createState() => _categoryState(value);
}

class _categoryState extends State<category> {
  String value;
  _categoryState(this.value);


  List<String> catname= [
    "General Knowledge Quiz",
    "Technical Quiz",
  ];

  List<String> images = [
    "https://images-na.ssl-images-amazon.com/images/I/71-tOWTGAqL.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtDRvYlM5ZFdFfDU3ahIIVerv4DyCp_vCmXQ&usqp=CAU",
  ];

  List<String> des = [
    "This is the best way to improve Your General Knowledge. ",
    "This is the best way to improve Your Technical Knowledge. ",
  ];

  @override
  Widget customcard(String catname, String images, String des)  {
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 30.0,
        ),
        child: InkWell(
        onTap: (){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => gkhomepage(value: value),

      )
      );
    },
          child: Material(
            color: Colors.cyanAccent,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(20.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(75.0),
                      child: Container(
                        height: 110.0,
                        width: 110.0,
                        child: ClipOval(
                            child: Image.network(
                              images,fit: BoxFit.cover,)
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      catname,style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      des,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),
                      maxLines: 5,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
  @override
  Widget customcard1(String catname, String images, String des)  {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => homepage(value: value,),
          )
          );
        },
        child: Material(
          color: Colors.redAccent,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(20.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(75.0),
                    child: Container(
                      height: 110.0,
                      width: 110.0,
                      child: ClipOval(
                          child: Image.network(
                            images,fit: BoxFit.cover,)
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    catname,style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    des,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text( "WELCOME -  $value",style:
            TextStyle(fontWeight: FontWeight.w900),)
      ),
      body: Stack (
          fit: StackFit.expand,
          children: <Widget>[
            catback(),
            ListView(
              children: <Widget>[
                customcard(catname[0],images[0],des[0]),
                customcard1(catname[1],images[1],des[1]),
              ],
            ),
          ]),
    );
  }
}

class catback extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://media.istockphoto.com/photos/future-artificial-intelligence-robot-and-cyborg-picture-id1202870693?b=1&k=6&m=1202870693&s=170667a&w=0&h=0fV6G8qlb-_OrxzigajIFmn1xUneAr7dMVDwfuwPm0c=",
      fit: BoxFit.cover,
      color: Colors.black.withOpacity(0.2),
      colorBlendMode: BlendMode.darken,
    );
  }
}