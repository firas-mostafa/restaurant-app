import 'package:flutter/material.dart';
import 'package:restoorder/pages/home/cart_page.dart';

class MySliverApp extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverApp({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;
    return SliverAppBar(
      expandedHeight: screenHight * 0.37,
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.tertiary,
      collapsedHeight: screenHight * 0.12,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartPage()));
          },
          icon: const Icon(Icons.shopping_cart_rounded),
          iconSize: 25,
        )
      ],
      title: const Text("Restorder"),
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        title: SizedBox(height: screenHight * 0.03, child: title),
        centerTitle: true,
        titlePadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      ),
    );
  }
}
