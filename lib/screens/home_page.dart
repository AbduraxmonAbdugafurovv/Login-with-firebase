import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(onPressed: signOut, icon:const Icon(Icons.login_outlined)),
        ],
      ) ,
    );
  }
signOut()async{
  await FirebaseAuth.instance.signOut();
  Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
}

}