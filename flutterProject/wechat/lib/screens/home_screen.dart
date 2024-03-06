import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wechat/api/api.dart';
import 'package:wechat/widgets/chat_user_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       //app bar
       appBar: AppBar(
        leading: const Icon(CupertinoIcons.home),
        title: const Text('We Chat'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
        ],
       ),
       
       //floating button to add new user
       floatingActionButton: Padding( 
         padding: const EdgeInsets.only(bottom: 10),
         child: FloatingActionButton(
          onPressed: () async{
            await APIs.auth.signOut();
            await GoogleSignIn().signOut();
          }, 
          backgroundColor: const Color.fromARGB(255, 214, 149, 173),
          child: const Icon(Icons.add_comment_rounded),
          ),
       ),
    
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index){
          return const ChatUserCard();
        }),
    );
   
  }
} 