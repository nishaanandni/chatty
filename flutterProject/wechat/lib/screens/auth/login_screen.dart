import 'package:flutter/material.dart';
import 'package:wechat/main.dart';
import 'package:wechat/screens/home_screen.dart';

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
    Future.delayed(Duration(milliseconds: 500), (){
      setState(() {
        _isAnimate = true;
      });
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
        AnimatedPositioned(
          top: mq.height *.15,
          width: mq.width*.5,
          //animation 
          right: _isAnimate? mq.width*.25: -mq.width*.5,
          duration: Duration(seconds: 1),
          child: Image.asset('images/chat.png')),
          //google login button
        Positioned(
          bottom: mq.height *.15,
          width: mq.width*.9,
          left: mq.width*.05,
          height: mq.height*.06,
        
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100], shape: StadiumBorder(), elevation: 1),
            onPressed: (){
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (_)=>HomeScreen()));
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