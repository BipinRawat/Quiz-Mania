import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signUp.dart';
import 'package:form_field_validator/form_field_validator.dart';
void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Login Page",
        home: LoginPage(),
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
      )
  );
}
class BgImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://images.unsplash.com/photo-1529539795054-3c162aab037a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8bG9naW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=60",
      fit: BoxFit.cover,
      color: Colors.black.withOpacity(0.3),
      colorBlendMode: BlendMode.darken,
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}
class LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children : <Widget>[
                Text("Login Page",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black),
                ),
              ]
          ),
        ),

        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            BgImage(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Card(
                        color: Colors.white,
                        child: Column(
                            children: <Widget>[
                              Container(
                                height:100,
                                width: 100,
                                child: ClipOval(
                                    child: Image.network("https://res-2.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco/v1491391747/atxlmkwempkziue1gyrc.png",fit: BoxFit.cover,)
                                ),
                              ),
                              Form(
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          autovalidate: true,
                                          validator: EmailValidator(errorText: "Enter a valid email "),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: "Enter Your Email",labelText: "Email",
                                              labelStyle:TextStyle(fontWeight: FontWeight.w900)
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        TextFormField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: "Enter Password",
                                              labelText: "Password",
                                              labelStyle:TextStyle(fontWeight: FontWeight.w900)
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    onPressed: () {
                                      null;
                                    },
                                    child: Text("Sign In"),
                                    color: Colors.green,
                                    textColor: Colors.white,
                                  )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignupPage())
                                    );},
                                  child: Text("Create a new user ?"),
                                  color: Colors.deepOrange,
                                  textColor: Colors.white,
                                ),
                              ),
                            ]
                        )
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}