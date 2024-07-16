import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthServices with ChangeNotifier {
  // get instance of firebaseauth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //exceptionController to handel the erorrs
  final StreamController<Exception> _exceptionController =
      StreamController.broadcast();
  get exceptionController => _exceptionController;
  String? errorMessage;
  String? get error => errorMessage;
  //get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  //sign in method

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      throw errorMessage = error.message!;
    }
  }

  //sign up method
  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      throw errorMessage = error.message!;
    }
  }

  //sign out method
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (error) {
      throw errorMessage = error.message!;
    }
  }

  //reset the password
  Future resetThePassword(String email) async {
    try {
      return await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error) {
      throw errorMessage = error.message!;
    }
  }
}
