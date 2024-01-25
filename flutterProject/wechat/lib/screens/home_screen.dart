import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: const Icon(CupertinoIcons.home),
        title: const Text('We Chat'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
        ],
       ),
       floatingActionButton: Padding( 
         padding: const EdgeInsets.only(bottom: 10),
         child: FloatingActionButton(
          onPressed: (){}, 
          backgroundColor: const Color.fromARGB(255, 214, 149, 173),
          child: const Icon(Icons.add_comment_rounded),
          ),
       ),
    );
   
  }
} 