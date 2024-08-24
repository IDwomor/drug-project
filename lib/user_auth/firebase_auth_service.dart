import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService{
  //for storing data in cloud firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //for authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String res = "Some error occurred";

  //for sign up
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
    required String confirmPassword,
}) async {
    try {
      if(email.isNotEmpty || password.isNotEmpty || confirmPassword.isNotEmpty) {
        //to register user in firebase auth with email and password
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password
        );
        await _firestore.collection("users").doc(credential.user!.uid).set({
          'name': name,
          "email": email,
          'uid': credential.user!.uid,
        });
        res = "success";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  Future<String> logInUser({
    required String email,
    required String password,
}) async {
    try{
      if (email.isNotEmpty || password.isNotEmpty){
        //log in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email, password: password
        );
        res = "success";
      } else {
        res = "Please enter all the field";
      }
    } catch(e) {
      return e.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}