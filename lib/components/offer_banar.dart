import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/offer_provider.dart';
import 'dot_indicator.dart';

class OfferBanar extends StatelessWidget {
  const OfferBanar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: screenHeight * 0.226,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: PageView.builder(
                itemCount: context.read<OfferProvider>().listOfOffer.length,
                onPageChanged: (value) {
                  int index = value;
                  context.read<OfferProvider>().changeCurrentIndex(index);
                },
                itemBuilder: (context, index) => Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                      child: Image.asset(
                          context.read<OfferProvider>().listOfOffer[index]),
                    ))),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: screenHeight * 0.05),
          margin: EdgeInsets.only(top: screenHeight * 0.1365, bottom: 0),
          width: double.infinity,
          height: screenHeight * 0.09,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.5),
                    Colors.transparent
                  ])),
          child: DotIndicator(
            currentValue: context.watch<OfferProvider>().currentIndex,
          ),
        )
      ],
    );
  }
}
