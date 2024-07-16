// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoorder/provider/restaurant.dart';
import 'package:restoorder/provider/services/auth/auth_services.dart';

import '../provider/services/database/firestore.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void openLocationSearchBar(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  "Your location",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.tertiary),
                ),
                content: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter Location  ..',
                  ),
                ),
                actions: [
                  MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                  Consumer<Restaurant>(
                    builder: (context, restaurant, child) => MaterialButton(
                        onPressed: () {
                          restaurant.updateAddress(controller.text);
                          Navigator.pop(context);
                        },
                        child: const Text("Save")),
                  ),
                ],
              ));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Deliver to : ",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBar(context),
            child: Row(
              children: [
                //address
                Text(
                  context.watch<Restaurant>().userAddress,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                //drop down menu

                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Theme.of(context).colorScheme.primary,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UserEmail extends StatelessWidget {
  UserEmail({
    super.key,
    this.onTap,
  });
  void onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Your email : ${context.watch<FirestoreService>().docId}",
            style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.w700,
                fontSize: 17),
          ),
          IconButton(
              onPressed: () {
                onTap;
              },
              icon: const Icon(Icons.edit_rounded))
        ],
      ),
    ));
  }
}

class UserPhone extends StatelessWidget {
  UserPhone({super.key, this.onTap});
  void onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Your Phone : ${context.watch<FirestoreService>().docId}",
            style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.w700,
                fontSize: 17),
          ),
          IconButton(
              onPressed: () {
                onTap;
              },
              icon: const Icon(Icons.edit_rounded))
        ],
      ),
    ));
  }
}

class UserLogout extends StatelessWidget {
  const UserLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<AuthServices>().signOut();
      },
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Logout :",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
            Icon(
              Icons.logout_outlined,
              color: Theme.of(context).colorScheme.error,
            )
          ],
        ),
      )),
    );
  }
}
