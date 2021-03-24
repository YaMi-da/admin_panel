import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_db_web_unofficial/firebasedbwebunofficial.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel/Screens/screens.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseRef adminRef = FirebaseDatabaseWeb.instance.reference().child("Admin");
DatabaseRef riderRef = FirebaseDatabaseWeb.instance.reference().child("Users").child("Riders");
DatabaseRef driverRef = FirebaseDatabaseWeb.instance.reference().child("Users").child("Drivers");

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi Express',
      home: Home(),
      theme: ThemeData(
        fontFamily: "ProductSans-Medium",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
