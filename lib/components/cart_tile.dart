import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoorder/components/quantity_selector.dart';
import 'package:restoorder/model/cart_item.dart';
import 'package:restoorder/provider/restaurant.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;
  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          cartItem.food.image,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.food.name,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          Text(
                            "${cartItem.food.price} \$",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.tertiary),
                          )
                        ],
                      ),
                      const Spacer(),
                      QuantitySelector(
                          quantity: cartItem.quantity,
                          food: cartItem.food,
                          increment: () {
                            restaurant.addToCart(
                                cartItem.food, cartItem.selectAddOn);
                          },
                          decrement: () {
                            restaurant.removeFormCart(cartItem);
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: cartItem.selectAddOn.isEmpty ? 0 : 5,
                ),
                SizedBox(
                  height: cartItem.selectAddOn.isEmpty ? 0 : 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cartItem.selectAddOn.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: FilterChip(
                        shape: StadiumBorder(
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.primary)),
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.4),
                        labelStyle: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                        label: Text(
                            "${cartItem.selectAddOn[index].name},${cartItem.selectAddOn[index].price}"),
                        onSelected: ((value) {}),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: cartItem.selectAddOn.isEmpty ? 10 : 5,
                ),
              ],
            ));
      },
    );
  }
}
