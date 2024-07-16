import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double padding;

  const Button(
      {super.key,
      required this.onTap,
      required this.text,
      required this.padding});
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.shadow,
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.5),
              ]),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )),
      ),
    );
  }
}

class BuyButton extends StatelessWidget {
  const BuyButton({
    super.key,
    this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
                child: Text(
              " Buy Now ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary),
            )),
          )),
    );
  }
}
// class GoogleButton extends StatelessWidget {
//   const GoogleButton({
//     super.key,
//     this.onTap,
//   });
//   final Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.026),
//       child: Column(
//         children: [
//           SizedBox(height: screenHeight * 0.05),
//           Divider(
//             color: Theme.of(context).colorScheme.tertiary,
//             indent: screenWidth * 0.02,
//             endIndent: screenWidth * 0.02,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           GestureDetector(
//               onTap: onTap,
//               child: Container(
//                 height: 60,
//                 width: double.infinity,
//                 padding: const EdgeInsets.only(left: 20),
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.secondary,
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 child: Center(
//                     child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Image.asset(
//                       "assets/images/google.png",
//                       width: screenWidth * 0.1,
//                     ),
//                     Text(
//                       " Or use google authentication ",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).colorScheme.inversePrimary),
//                     ),
//                     SizedBox(
//                       width: screenWidth * 0.02,
//                     ),
//                   ],
//                 )),
//               )),
//         ],
//       ),
//     );
//   }
// }
