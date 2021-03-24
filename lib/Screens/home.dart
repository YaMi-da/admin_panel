import 'package:admin_panel/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel/Widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Option selectedOption = Option.Login;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: size.width/2,
                  color: Color.fromRGBO(146, 27, 31, 1),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 150),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Need A Ride?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "You've Come to The Right Place",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                            ),
                          ],
                        ),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: size.width/2,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 50, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image(
                                image: AssetImage('images\\taxi_express_logo.png'),
                                width: 110,
                              ),
                              SizedBox(width: 10,),
                              Text(
                                "Taxi Express",
                                style: TextStyle(
                                  color: Color.fromRGBO(146, 27, 31, 1),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 700),
                        transitionBuilder: (widget, animation) => ScaleTransition(
                            child: widget,scale: animation
                        ),

                        child: selectedOption == Option.Login ? Login(onSignUpSelected: (){
                          setState(() {
                            selectedOption = Option.SignUP;
                          });
                        },
                        ) : SignUp(
                          onLogInSelected: (){
                            setState(() {
                              selectedOption = Option.Login;
                            });
                          },
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
