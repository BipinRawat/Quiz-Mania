import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Registration Page",
        home: SignupPage(),
        theme: ThemeData(
          primarySwatch: Colors.white,
        ),
      )
  );
}
class SignupPage extends StatefulWidget {

  @override
  SignupPageState createState() => SignupPageState();
}
class SignupPageState extends State<SignupPage> {

  var myFormKey = GlobalKey<FormState>();
  var _Password = TextEditingController();
  var _confirmPassword = TextEditingController();
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  final Map<String, dynamic> formdata =
  {'first name':null,'last name':null,'email':null,'password':null,'confirm password':null };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Registration Page", style: TextStyle(
                    fontWeight: FontWeight.w900, color: Colors.white),
                ),
              ]
          ),
        ),
        body:
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              child: Container(
                child: Card(
                    color: Colors.white,
                    child: Column(
                        children: <Widget>[
                          imageProfile(context),

                          Form(
                              key: myFormKey,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(//First name
                                      onSaved: (String value){
                                        formdata['first name'] = value;
                                      },
                                      validator: (String msg) {
                                        if (msg.isEmpty) {
                                          return "Please Enter First Name";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Your First Name",
                                          labelText: "First Name",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.w900)
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField( //last name
                                      onSaved: (String value){
                                        formdata['lastname'] = value;
                                      },
                                      validator: (String msg) {
                                        if (msg.isEmpty) {
                                          return "Please Enter Last Name";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Your Last Name",
                                          labelText: "Last Name",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.w900)
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField( //email
                                      autovalidate: true,
                                      onSaved: (String value){
                                        formdata['email'] = value;
                                      },
                                      validator: EmailValidator(
                                          errorText: "Enter a valid email "),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Your Email",
                                          labelText: "Email",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.w900)
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField( //password
                                      onSaved: (String value){
                                        formdata['password'] = value;
                                      },
                                      controller: _Password,
                                      validator: (String msg) {
                                        if (msg.isEmpty) {
                                          return "Please Enter Password";
                                        }
                                        if (msg.length < 6) {
                                          return "Password is less than 6 char";
                                        }
                                        return null;
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Password",
                                          labelText: "Password",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.w900)
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField( //confirm password
                                      onSaved: (String value){
                                        formdata['confirm password'] = value;
                                      },
                                      controller: _confirmPassword,
                                      validator: (String msg) {
                                        if (msg != _Password.value.text) {
                                          return "Please Enter Same Password";
                                        }
                                        return null;
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "Enter Same Password",
                                          labelText: "Confirm Password",
                                          labelStyle: TextStyle(
                                              fontWeight: FontWeight.w900)
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                onPressed :

                                    () {
                                  if (myFormKey.currentState.validate()) {
                                    myFormKey.currentState.save();
                                    print(formdata);

                                    Scaffold.of(myFormKey.currentContext)
                                        .showSnackBar(
                                        SnackBar(content: Text(
                                            'Registration Successful')));

                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                  }
                                },
                                child: Text("Sign Up", style:
                                TextStyle(fontSize: 22,
                                    fontWeight: FontWeight.w900),),
                                color: Colors.deepOrange,
                                textColor: Colors.black,
                              )
                          ),
                          ]
                    )
                ),
              ),
            ),
          ),
        )
    );
  }

  Widget imageProfile(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 70.0,
            backgroundImage: _imageFile == null
                ? NetworkImage("https://lh3.googleusercontent.com/a-/AOh14Gh3xdtOUBIia8ck8smMcbwp0D4t98I6i8nmjVt4oQ=s96-c-rg-br100")
                : FileImage(File(_imageFile.path)),

          ),
          Positioned(
              bottom: 20.0,
              right: 20.0,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomsheet()),
                  );
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 25.0,),
              ))
        ],
      ),
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 100.0,
      width: 100.0,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile Picture",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {

                  takephoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takephoto(ImageSource.gallery);
                  Navigator.pop(context);
                },
                label: Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }
  void takephoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}