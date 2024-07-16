import 'package:flutter/material.dart';

import '../model/food_model.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback increment;
  final VoidCallback decrement;
  const QuantitySelector(
      {super.key,
      required this.quantity,
      required this.food,
      required this.increment,
      required this.decrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 30,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          GestureDetector(
              onTap: decrement,
              child: Icon(
                Icons.remove,
                color: Theme.of(context).colorScheme.onPrimary,
              )),
          const Spacer(),
          Text(
            "$quantity",
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 13,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          GestureDetector(
              onTap: increment,
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.onPrimary,
              )),
        ],
      ),
    );
  }
}
