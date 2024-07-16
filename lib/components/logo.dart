import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft:
                  Radius.elliptical(screenWidth * 0.78, screenWidth * 0.39),
              bottomRight:
                  Radius.elliptical(screenWidth * 0.78, screenWidth * 0.39)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.shadow,
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.5),
              ])),
      height: screenHeight * 0.32,
      width: double.infinity,
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            'assets/images/logo.png',
            width: screenWidth * 0.4,
          ),
        ],
      ),
    );
  }
}
