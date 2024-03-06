import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wechat/api/api.dart';
import 'package:wechat/helper/dialogs.dart';
import 'package:wechat/main.dart';
import 'package:wechat/screens/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

bool _isAnimate = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), (){
      setState(() {
        _isAnimate = true;
      });
    });
  }

  _handleGoogleBtnClick(){
    Dialogs.showProgressbar(context);

    _signInWithGoogle().then((user) {
      Navigator.pop(context);
      if(user!=null){
      log('\nUser: ${user.user}');
      log('\nUserAdditionalInfo: ${user.additionalUserInfo}');


        Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (_)=>const HomeScreen()));
      }
    });
  }

Future<UserCredential?> _signInWithGoogle() async {
  try{
    //incase internet doesnt work it throws an error
    await InternetAddress.lookup('google.com');
    // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await APIs.auth.signInWithCredential(credential);
  }catch(e){
    log('\n_signInWithGoogle: $e');
    //to show internet isnt working
    // ignore: use_build_context_synchronously
    Dialogs.showSnackbar(context, 'something went wrong check it ');
    return null;
  }
}



  @override
  Widget build(BuildContext context) {
    //initiallizing media query (for getting device screen size)
    // mq = MediaQuery.of(context).size;
    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome to We Chat'),
       
       ),
       //body
       body: Stack(children: [
        //app logo
        AnimatedPositioned(
          top: mq.height *.15,
          width: mq.width*.5,
          //animation 
          right: _isAnimate? mq.width*.25: -mq.width*.5,
          duration:const Duration(seconds: 1),
          child: Image.asset('images/chat.png')),
          //google login button
        Positioned(
          bottom: mq.height *.15,
          width: mq.width*.9,
          left: mq.width*.05,
          height: mq.height*.06,
        
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100], shape: const StadiumBorder(), elevation: 1),
            onPressed: (){
            _handleGoogleBtnClick();
            }, 
            //google icon
            icon: Image.asset('images/search.png', height: mq.height*.04,),
            label:  RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 15),
                children: [
                  TextSpan(text: 'Sign in with '),
                  TextSpan(text: 'Google', style: TextStyle(fontWeight: FontWeight.w500)),
                ]
              ),
            )))
            
          ],),
    );
   
  }
} 