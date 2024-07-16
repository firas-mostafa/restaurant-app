import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoorder/provider/offer_provider.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.currentValue = 0,
  });
  final int currentValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          context.read<OfferProvider>().listOfOffer.length,
          (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: AnimatedContainer(
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 500),
                  width: index == currentValue ? 20 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20)),
                ),
              )),
    );
  }
}
