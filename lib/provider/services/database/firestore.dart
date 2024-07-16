import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class FirestoreService with ChangeNotifier {
  //get collection of orders
  final CollectionReference orders =
      FirebaseFirestore.instance.collection("orders");
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  //save order to db
  Future<void> saveOrderToDatabase(String receipt) async {
    try {
      await orders.add({
        'date': DateTime.now(),
        'user': FirebaseAuth.instance.currentUser!.uid,
        'order': receipt,
      });
      notifyListeners();
    } on FirebaseException catch (e) {
      Exception(e);
    }
  }
  //save user to db

  Future<void> saveUserToDatabase(
      String email, String phone, String userName) async {
    try {
      await users.add({
        'email': email,
        'userName': userName,
        'phone': phone,
        'uid': FirebaseAuth.instance.currentUser!.uid
      });
      notifyListeners();
    } on FirebaseException catch (e) {
      Exception(e);
    }
  }

  // show order
  List<String> ordersHistory = [];
  Future showOrder() async {
    try {
      await FirebaseFirestore.instance
          .collection('orders')
          .where('user', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get()
          // ignore: avoid_function_literals_in_foreach_calls
          .then((snapShot) => snapShot.docs.forEach((element) {
                if (!ordersHistory.contains(element.reference.id)) {
                  ordersHistory.add(element.reference.id);
                }
              }));

      return ordersHistory;
    } on FirebaseException {
      rethrow;
    }
  }

  //show user info
  String? docId;
  Future showUsers() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) => value.docs.forEach((element) {
                docId = element.reference.id;
              }));
    } on FirebaseException {
      rethrow;
    }
  }
}
