import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:restoorder/provider/restaurant.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
      ),
      child: Column(
        children: [
          const Text("Thank you for your order"),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary)),
            child: Consumer<Restaurant>(
              builder: (context, restaurant, child) =>
                  Text(restaurant.cardReceipt()),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Estimated delivery time is: 4:10 PM"),
        ],
      ),
    );
  }
}
