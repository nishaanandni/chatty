import 'package:flutter/material.dart';
import 'package:wechat/screens/auth/login_screen.dart';

//global object for accessing device screen size
late Size mq;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We Chat',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 1,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
        titleTextStyle: TextStyle(
                color: Colors.black, 
                fontWeight: FontWeight.normal, 
                fontSize: 19), 
        backgroundColor: Color.fromARGB(255, 200, 230, 201),)
        ),
     
      home: const LoginScreen());
 }
}