import 'package:flutter/material.dart';

import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'package:restoorder/components/button.dart';
import 'package:restoorder/pages/home/delivery_page.dart';
import 'package:restoorder/provider/payment_provider.dart';
import 'package:restoorder/provider/restaurant.dart';

import '../../provider/services/database/firestore.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    void userTapPay() {
      if (formKey.currentState!.validate()) {
        String receipt = context.read<Restaurant>().cardReceipt();
        context.read<FirestoreService>().saveOrderToDatabase(receipt);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Confirm payment"),
                Text(
                  "Card Number:${context.read<PayMentProvider>().cardNumber}",
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  "Expiry Date:${context.read<PayMentProvider>().expiryDate}",
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  "Card Holder:${context.read<PayMentProvider>().cardHolderName}",
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  "CVV:${context.read<PayMentProvider>().cvvCode}",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            actions: [
              MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DeliveryPage(),
                        ));
                  },
                  child: const Text("Yes"))
            ],
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "CheckOut",
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<PayMentProvider>(
              builder: (context, payment, child) {
                return Column(
                  children: [
                    CreditCardWidget(
                        cardBgColor: Theme.of(context).colorScheme.primary,
                        cardNumber: payment.cardNumber,
                        expiryDate: payment.expiryDate,
                        obscureCardCvv: false,
                        obscureCardNumber: false,
                        cardHolderName: payment.cardHolderName,
                        cvvCode: payment.cvvCode,
                        showBackView: false,
                        onCreditCardWidgetChange: (data) {}),
                    CreditCardForm(
                      autovalidateMode: AutovalidateMode.disabled,
                      disableCardNumberAutoFillHints: true,
                      cardNumber: payment.cardNumber,
                      expiryDate: payment.expiryDate,
                      cardHolderName: payment.cardHolderName,
                      cvvCode: payment.cvvCode,
                      onCreditCardModelChange: (data) {
                        payment.setCard(data.cardNumber, data.expiryDate,
                            data.cardHolderName, data.cvvCode);
                      },
                      formKey: formKey,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 70,
            ),
            Button(
              onTap: () {
                userTapPay();
              },
              text: 'Pay Now',
              padding: 12,
            ),
          ],
        ),
      ),
    );
  }
}
