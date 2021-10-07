import 'gk_quiz_page.dart';
import 'package:flutter/material.dart';

class gkhomepage extends StatefulWidget {

  String value;
  gkhomepage({Key key,@required this.value}) : super(key: key);

  @override
  _gkhomepageState createState() => _gkhomepageState(value);
}

class _gkhomepageState extends State<gkhomepage> {
  String value;
  _gkhomepageState(this.value);

  List<String> gktypename= [
    "World",
    "India",
    "Uttarakhand",
    "Sports",
  ];

  List<String> gkimages = [
    "https://images.unsplash.com/photo-1534294228306-bd54eb9a7ba8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8d29ybGR8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images-na.ssl-images-amazon.com/images/I/71RgfIeTq6L._SX569_.jpg",
    "https://images.unsplash.com/photo-1547453155-ae5be9428a4f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZGV2cHJheWFnfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1575361204480-aadea25e6e68?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjN8fHNwb3J0c3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  ];

  List<String> gkdes = [
    "Explore the world by just passing this quiz",
    "Explore the India by just passing this quiz",
    "Explore the uttarakhand by just passing this quiz",
    "Are You a Sports Person? TesT YourSelf",
  ];

  Widget customcard(String gktypename, String gkimages, String gkdes
      )  {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => gkloadjson(gktypename),
          )
          );
        },
        child: Material(
          color: Colors.teal,
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
                            gkimages,fit: BoxFit.cover,)
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    gktypename,style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    gkdes,
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
          title: Text( "Choose A Quiz - $value")
      ),
      body: Stack (
          fit: StackFit.expand,
          children: <Widget>[
            gkhomeback(),
            ListView(
              children: <Widget>[
                customcard(gktypename[0],gkimages[0],gkdes[0]),
                customcard(gktypename[1],gkimages[1],gkdes[1]),
                customcard(gktypename[2],gkimages[2],gkdes[2]),
                customcard(gktypename[3],gkimages[3],gkdes[3]),
              ],
            ),
          ]),
    );
  }
}
class gkhomeback extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://images.pexels.com/photos/2603464/pexels-photo-2603464.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      fit: BoxFit.cover,
    );
  }
}