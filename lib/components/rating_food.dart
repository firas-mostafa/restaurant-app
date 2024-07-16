import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RatingFood extends StatelessWidget {
  double rate;

  String reviewsNumber;

  Color background;

  Color dividerColor;

  RatingFood(
      {this.rate = 3.0,
      this.reviewsNumber = "123",
      this.background = Colors.black,
      this.dividerColor = Colors.white,
      super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.only(left: 4),
      width: screenWidth * 0.35,
      height: screenHeight * 0.03,
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.amber,
            size: screenWidth * 0.05,
          ),
          Text("$rate"),
          VerticalDivider(
            color: dividerColor,
            thickness: 2,
          ),
          Text(
            "$reviewsNumber reviews",
          )
        ],
      ),
    );
  }
}
