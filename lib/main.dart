
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:userauthentication/language.dart';
import 'package:userauthentication/number.dart';
import 'package:userauthentication/otp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'language',
    routes: {
      'language':(context) => Language(),
      'number' :(context) => MyNumber(),
      'otp' :(context) => MyOtp()
    },
  ));
}
