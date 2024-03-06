import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wechat/api/api.dart';
import 'package:wechat/main.dart';
import 'package:wechat/screens/auth/login_screen.dart';
import 'package:wechat/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), (){

      //exit full screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
        
        if(APIs.auth.currentUser != null){
            log('\nUser: ${APIs.auth.currentUser}');
      log('\nUserAdditionalInfo: ${FirebaseAuth.instance.currentUser}');
                  // navigate to home screen 
           Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_)=>const HomeScreen()));
        } else{
                  // navigate to login screen 
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_)=>const LoginScreen()));
        }


   
    });
  }
  @override
  Widget build(BuildContext context) {
    //initiallizing media query (for getting device screen size)
    mq = MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome to We Chat'),
       
       ),
       //body
       body: Stack(children: [
        //app logo
        Positioned(
          top: mq.height *.15,
          width: mq.width*.5,
          //animation 
          right: mq.width*.25,
          child: Image.asset('images/chat.png')),
          //google login button
        Positioned(
          bottom: mq.height *.15,
          width: mq.width,
        
          child:const Text('Wechat is when we chat ❤️',
           textAlign: TextAlign.center,
           style: TextStyle(
            fontSize: 16, 
            color: Colors.black87 
            ))
          )
            
          ],),
    );
   
  }
} 