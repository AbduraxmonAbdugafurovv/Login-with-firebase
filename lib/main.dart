import 'package:firebase_core/firebase_core.dart';
import 'package:firebaselogin/routes/my_routes.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  final _myRoute = MyRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        brightness: Brightness.dark        
      ),

      initialRoute: "/",
      onGenerateRoute:_myRoute.onGenerateRoute
    );
  }
}
