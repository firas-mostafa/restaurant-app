import 'package:flutter/material.dart';

class PayMentProvider with ChangeNotifier {
  String _cardNumber = '';
  String _expiryDate = "";
  String _cardHolderName = '';
  String _cvvCode = '';

  String get cardNumber => _cardNumber;

  String get expiryDate => _expiryDate;
  String get cardHolderName => _cardHolderName;
  String get cvvCode => _cvvCode;

  void setCard(String cardNumber, String expiryDate, String cardHolderName,
      String cvvCode) {
    _cardNumber = cardNumber;
    _expiryDate = expiryDate;
    _cardHolderName = cardHolderName;
    _cvvCode = cvvCode;
    notifyListeners();
  }
}
