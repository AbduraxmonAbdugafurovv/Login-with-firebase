import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselogin/constant/const.dart';
import 'package:firebaselogin/constant/containerbutton.dart';
import 'package:firebaselogin/core/components/textformfield.dart';
import 'package:firebaselogin/core/widget/appbar.dart';
import 'package:firebaselogin/sizeconfig.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        debugPrint('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfigs().init(context);
    return Scaffold(
      appBar: appbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(40)),
            child: Form(
              child: Column(
                children: [
                  textFormField(_emailController, "Email"),
                  SizedBox(
                    height: getHeight(30),
                  ),
                  textFormField(_passwordController, "Password")
                ],
              ),
            ),
          ),
          SizedBox(
            height: getHeight(30),
          ),
          InkWell(
            child: containerButton("Sign Up"),
            onTap: signUp,
          ),
          SizedBox(height: getHeight(30),),
          InkWell(
            child: containerButton("Sign In"),
            onTap: signIn,
          )
        ],
      ),
    );
  }

  signUp() async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      showMySnackbar("Muvaffaqiyatli otdingiz: ${user.user!.email.toString()}",
          ColorConst.green);
      await auth.currentUser!.sendEmailVerification();
      Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showMySnackbar('The password provided is too weak.', ColorConst.red);
      } else if (e.code == 'email-already-in-use') {
        showMySnackbar(
            'The account already exists for that email.', ColorConst.red);
      }
    } catch (e) {
      showMySnackbar("Error:  $e", ColorConst.red);
    }
  }

  signIn() async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
        Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
        showMySnackbar("Dasturga kirdingiz: ${user.user!.email.toString()}" , ColorConst.green);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showMySnackbar('No user found for that email.', ColorConst.red);
      } else if (e.code == 'wrong-password') {
        showMySnackbar(
            'Wrong password provided for that user.', ColorConst.red);
      }
    }
  }

  showMySnackbar(
    String content,
    Color color,
  ) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(content),
      ),
    );
  }
}
