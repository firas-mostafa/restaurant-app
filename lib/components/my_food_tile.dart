import 'package:flutter/material.dart';
import 'package:restoorder/components/rating_food.dart';

import '../model/food_model.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          top: screenWidth * 0.01,
          bottom: screenWidth * 0.01,
          left: screenWidth * 0.03,
          right: screenWidth * 0.03),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(
            left: screenWidth * 0.03,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.secondary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: screenWidth * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      food.name,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    RatingFood(
                      background: Theme.of(context).colorScheme.background,
                      dividerColor: Theme.of(context).colorScheme.secondary,
                    ),
                    Text(
                      "\$${food.price.toString()}",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  food.image,
                  width: screenWidth * 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
