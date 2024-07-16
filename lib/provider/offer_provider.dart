import 'package:flutter/material.dart';

class OfferProvider with ChangeNotifier {
  List<String> listOfOffer = [
    "assets/images/offers/1.png",
    "assets/images/offers/2.png",
    "assets/images/offers/3.png"
  ];

  int currentIndex = 0;
  void changeCurrentIndex(index) {
    currentIndex = index;
    if (index >= listOfOffer.length) {
      currentIndex = 0;
    }
    notifyListeners();
  }
}
