


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:niu/main.dart';

import '../HomePage2.dart';


class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  final storage = new FlutterSecureStorage();
//
  Future<void> googleSignIn(BuildContext context) async {
    try{
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        try{
          UserCredential userCredential = await _auth.signInWithCredential(credential);
          storeTokenAndData(userCredential);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => HomePage2()),
                  (route) => false);

        }catch(e){
          final snackbar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      }
      else{
        final snackbar = SnackBar(content: Text('Not abel to sign In '));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }

    }catch(e){
      final snackbar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  // Storage of the google accout using token and flutter_secure_storage
  Future<void> storeTokenAndData(UserCredential userCredential) async {
    await storage.write(key: "token", value: userCredential.credential?.token.toString());
    await storage.write(key: "userCredential", value: userCredential.toString());
  }
  Future<String?> getToken() async{
    return await storage.read(key: "token");
  }
  //Logout function

  Future<void> logout() async{
    try{
      await _googleSignIn.signOut();
      await _auth.signOut();
      await storage.delete(key: "token");
    }catch(e){}
  }
  // function that verify phone Number
  Future<void> verifyPhoneNumber(String phoneNumber, BuildContext context, Function setData) async{
    //
    PhoneVerificationCompleted verificationCompleted = (PhoneAuthCredential phoneAuthCredential) async {
      //
      showSnackBar(context, "Verification Completed");

    };
    //
    PhoneVerificationFailed verificationFailed = (FirebaseAuthException exception){
      //
      showSnackBar(context, exception.toString());
    };

    PhoneCodeSent codeSent = (String verificationID, [int? forceResnedingtoken]){
      //
      showSnackBar(context, "Verfication Code sent on the phone number");
      setData(verificationID);
    };
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      //
      showSnackBar(context, "Time out");
    };
    try{
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }

  //
  void showSnackBar(BuildContext context, String text ){
    //content
    final snackBar = SnackBar(content: Text(text) );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //
  Future<void> signInwithPhoneNumber(String verificationId, String smsCode, BuildContext context) async {
    try{

      //
      AuthCredential credential =
      PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      //

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      storeTokenAndData(userCredential);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (builder) => HomePage2()),
              (route) => false);
      showSnackBar(context, "logged In");
    }
    catch(e){

      showSnackBar(context, e.toString());
    }
  }

}