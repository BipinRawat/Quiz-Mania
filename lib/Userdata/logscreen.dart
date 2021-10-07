import 'package:flutter/material.dart';
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override

  String email;
  String password;

  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        TextField(decoration: InputDecoration(
          labelText: "Email"
        ),
          onChanged: (value){
          setState(() {
            email=value;
          });
          },
        ),
        TextField(decoration: InputDecoration(
            labelText: "Password"
        ),
          onChanged: (value){
            setState(() {
              password=value;
            });
          },
          obscureText: true,
        ),
        FlatButton(
          child: Text("Sign In"),
          onPressed: (){},
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton(
          child: Text("Sign In"),
          onPressed: (){},
        )
      ],
    ),
    );
  }
}
