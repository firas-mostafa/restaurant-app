import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:restoorder/components/button.dart';
import 'package:restoorder/components/cart_tile.dart';
import 'package:restoorder/model/cart_item.dart';

import 'package:restoorder/provider/restaurant.dart';
import 'package:restoorder/pages/home/checkout.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final List<CartItem> userCart = restaurant.cart;
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            backgroundColor: Colors.transparent,
            title: Text(
              "Cart",
              style: TextStyle(
                  fontSize: 30, color: Theme.of(context).colorScheme.tertiary),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                  "Are you sure you want to clear the cart? "),
                              actions: [
                                MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel")),
                                MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      restaurant.clearCart();
                                    },
                                    child: const Text("Yes"))
                              ],
                            ));
                  },
                  icon: Icon(Icons.delete_sharp,
                      color: Theme.of(context).colorScheme.tertiary)),
            ],
          ),
          body: Stack(children: [
            Column(
              children: [
                userCart.isEmpty
                    ? Expanded(
                        child: Center(
                            child: Text(
                        "Cart is clear",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )))
                    : Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.892,
                            child: ListView.builder(
                                itemCount: userCart.length,
                                itemBuilder: (context, index) {
                                  return CartTile(cartItem: userCart[index]);
                                }),
                          ),
                        ],
                      ),
              ],
            ),
            userCart.isEmpty
                ? const SizedBox()
                : Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: screenHeight * 0.8),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(50)),
                    child: Button(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CheckOut(),
                            ));
                      },
                      text: "Go to Checkout",
                      padding: 0,
                    )),
          ]),
        );
      },
    );
  }
}
