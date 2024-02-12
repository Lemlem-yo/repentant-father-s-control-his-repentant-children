import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:niu/HomePage2.dart';
import 'package:niu/services/Auth_Services.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


import 'firebase_options.dart';
import 'log-authentication-pages/SignUpPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Widget currentPage = SignUpPage();
  AuthClass authClass = AuthClass();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();

  }
  //
  void checkLogin() async {
    String? token = await authClass.getToken();
    if(token != null){
      setState(() {
        currentPage=HomePage2();
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}
