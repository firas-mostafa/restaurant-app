import 'package:flutter/material.dart';

import 'package:restoorder/components/driver_navbar.dart';
import 'package:restoorder/components/my_receipt.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          "Delivery in progress ...",
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: MyReceipt())],
        ),
      ),
      bottomNavigationBar: const DriverNavbar(),
    );
  }
}
