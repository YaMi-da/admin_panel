import 'dart:html';

import 'package:admin_panel/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_db_web_unofficial/DatabaseSnapshot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';


class Login extends StatefulWidget {

  final Function onSignUpSelected;
  Login({@required this.onSignUpSelected});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _autoValidate = false;

  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();


  String validatePass(value){
    if(value.isEmpty)
      return "*Password Required.";
    else if(value.length < 6)
      return "Should be At Least 6 Characters.";
    else if(value.length > 15)
      return "Should be Less Than 15 Characters.";
    else
      return null;
  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.height > 770 ? 64 : size.height > 670 ? 32 : 16),
      child: Center(
        child: Card(
          elevation: 20.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 700),
            height: size.height * (size.height > 770 ? 0.7 : size.height > 670 ? 0.8 : 0.9),
            width: 500,
            color: Colors.white,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 30,
                        child: Divider(
                          color: Color.fromRGBO(146, 27, 31, 1),
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Form(
                        // ignore: deprecated_member_use
                          autovalidate: _autoValidate,
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                child : Center(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      contentPadding: new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                                      filled: true,
                                      fillColor: Colors.grey[500].withOpacity(0.3),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey, width: 2, style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 2, style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      errorBorder: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.red, width: 3.0),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      focusedErrorBorder: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.red, width: 3.0),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      errorStyle: TextStyle(
                                        color: Colors.red,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                        color: Colors.black45,
                                      ),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Icon(
                                          FontAwesomeIcons.envelope,
                                          size: 28,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    controller: _email,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      height: 1.5,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    validator: MultiValidator(
                                        [
                                          RequiredValidator(errorText: "*Email Required."),
                                          EmailValidator(errorText: "Not a Valid Email."),
                                        ]
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                child : Center(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      contentPadding: new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                                      filled: true,
                                      fillColor: Colors.grey[500].withOpacity(0.3),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey, width: 2, style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 2, style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      errorBorder: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.red, width: 3.0),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      focusedErrorBorder: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.red, width: 3.0),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      errorStyle: TextStyle(
                                        color: Colors.red,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: Colors.black45,
                                      ),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Icon(
                                          FontAwesomeIcons.envelope,
                                          size: 28,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    controller: _pass,
                                    obscureText: true,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      height: 1.5,
                                    ),
                                    textInputAction: TextInputAction.done,
                                    validator: validatePass,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Container(
                                  height: size.height * 0.07,
                                  width: size.width * 0.08,
                                  // ignore: deprecated_member_use
                                  child: RaisedButton(
                                    onPressed: () {
                                      if(formKey.currentState.validate()){
                                        loginAndAuthenticateUser(context);
                                      }
                                      else{
                                        _autoValidate =true;
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    color: Color.fromRGBO(146, 27, 31, 1),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'New Here? Create an Account',
                                    style: TextStyle(
                                      height: 1.5,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(width: 8,),
                                  GestureDetector(
                                    onTap: () {
                                      widget.onSignUpSelected();
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        height: 1.5,
                                        color: Color.fromRGBO(146, 27, 31, 1),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
            )
          ),
        ),
      ),
    );
  }


  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  loginAndAuthenticateUser(BuildContext context) async{


    final User firebaseUser = (await _firebaseAuth.
    signInWithEmailAndPassword(email:_email.text, password: _pass.text
    ).catchError((errMsg){
      Navigator.pop(context);
      displayToastMessage("Error: " + errMsg.toString() , context);
    })).user;

    if(firebaseUser != null){
      driverRef.child(firebaseUser.uid).once().then((DatabaseSnapshot snap){
        if(snap.value != null){
          displayToastMessage("Logged In", context);
        }
        else{
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage("Account Doesn't exist.", context);
        }
      });
    }
    else{
      Navigator.pop(context);
      displayToastMessage("Error Occured. Can't sign in.", context);
    }
  }

  displayToastMessage(String msg, BuildContext context, ) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Color.fromRGBO(146, 27, 31, 1),
      textColor: Colors.white,
      fontSize: 20,
    );
  }

}
