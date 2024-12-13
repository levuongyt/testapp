import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class QLFireBase {
  static final QLFireBase singleton = QLFireBase._internal();

  factory QLFireBase(){
    return singleton;
  }

  QLFireBase._internal();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  RxBool isLoading=false.obs;
  Future<bool> login(String email, String password) async {
    bool result=false;
    isLoading.value=true;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      result=true;
      isLoading.value=false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      isLoading.value=false;
    }
    return result;
  }

  Future<bool> register(String email, String password) async {
    bool result=false;
    isLoading.value=true;
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
       result=true;
       isLoading.value=false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      isLoading.value=false;
    } catch (e) {
      print(e);
    }
    return result;
  }

  ///fb
  Future<bool> signInWithFacebook() async {
    bool result=false;
    isLoading.value=true;
    // Trigger the sign-in flow
    try{
     // await FirebaseAuth.instance.signOut();
     // await FacebookAuth.instance.logOut();
      final LoginResult loginResult = await FacebookAuth.instance.login();
        // Create a credential from the access token
      if(loginResult.status==LoginStatus.success){
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential('${loginResult.accessToken?.tokenString}');
        // Once signed in, return the UserCredential
        await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
        result=true;
        isLoading.value=false;
      }else{
        print('Lỗi:  ');
        Get.snackbar('Lỗi', 'Moi thu lai');
        isLoading.value=false;
      }

    }catch(e){
        Get.snackbar('Lỗi', 'Moi thu lai12');
        //isLoading.value=false;
    }
    return result;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignIn googleSignIn = GoogleSignIn(
      //scopes: ['email'],
      //signInOption: SignInOption.standard, // Thêm tùy chọn này
    );
    ///dangxuat

   await googleSignIn.signOut();
   final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
   // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}