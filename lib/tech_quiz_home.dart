import 'tech_quiz_page.dart';
import 'package:flutter/material.dart';


class homepage extends StatefulWidget {

  String value;
  homepage({Key key,@required this.value}) : super(key: key);

  @override
  _homepageState createState() => _homepageState(value);
}

class _homepageState extends State<homepage> {
   String value;
   _homepageState(this.value);

  List<String> langname= [
    "Python",
    "JavaScript",
    "C++",
    "Html",
  ];

  List<String> techimages = [
    "http://clipart-library.com/image_gallery2/Python-Logo-PNG-Picture.png",
    "https://banner2.cleanpng.com/20180527/oio/kisspng-javascript-programming-language-ajax-5b0b285b692210.3071468515274578834306.jpg",
    "https://raw.githubusercontent.com/isocpp/logos/master/cpp_logo.png",
    "https://www.w3.org/html/logo/downloads/HTML5_Logo_512.png",
  ];

  List<String> techdes = [
    "Python is an interpreted, high-level and general-purpose programming language.",
    "JavaScript is the world's most popular programming language. ",
    "C++ is a cross-platform language that can be used to create high-performance applications",
    "HTML Stands for Hyper text Markup Language.",
  ];

  Widget Techcustomcard(String langname, String images, String des
      )  {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => loadjson(langname),
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
                    langname,style: TextStyle(
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
        title: Text( "Choose A Language $value")
      ),
      body: Stack (
      fit: StackFit.expand,
        children: <Widget>[
        homeback(),
      ListView(
       children: <Widget>[
         Techcustomcard(langname[0],techimages[0],techdes[0]),
         Techcustomcard(langname[1],techimages[1],techdes[1]),
         Techcustomcard(langname[2],techimages[2],techdes[2]),
         Techcustomcard(langname[3],techimages[3],techdes[3]),
       ],
      ),
    ]),
    );
  }
}
class homeback extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://images.unsplash.com/photo-1496868834840-5f4c98840aaa?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NjR8fHF1aXolMjBiYWNrZ3JvdW5kfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
      fit: BoxFit.cover,
      color: Colors.black.withOpacity(0.3),
      colorBlendMode: BlendMode.darken,
    );
  }
}