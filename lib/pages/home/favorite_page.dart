import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoorder/components/favorite_tile.dart';
import 'package:restoorder/pages/home/food_page.dart';
import 'package:restoorder/provider/restaurant.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
        height: screenHeight * 0.19 * context.watch<Restaurant>().menu.length,
        child: ListView.builder(
          itemCount: context.watch<Restaurant>().favorite.length,
          itemBuilder: (context, index) => FavoriteTile(
            food: context.watch<Restaurant>().favorite[index],
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodPage(
                          food: context.watch<Restaurant>().favorite[index])));
            },
          ),
        ));
  }
}
