import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restoorder/components/account_widgets.dart';
import 'package:restoorder/provider/services/database/firestore.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: context.watch<FirestoreService>().showUsers(),
        builder: (context, snapshot) {
          return ListView(
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/profile.png"),
                  Positioned(
                      left: 10,
                      bottom: 10,
                      child: Text(
                        "Firas Mostafa",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: screenHeight * 0.07 * listOfaccount.length,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20)),
                child: ListView.builder(
                    itemCount: listOfaccount.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          listOfaccount[index],
                          index != listOfaccount.length - 1
                              ? Divider(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  thickness: 1.2,
                                  indent: 5,
                                  endIndent: 5,
                                )
                              : const SizedBox()
                        ],
                      );
                    }),
              ),
            ],
          );
        });
  }
}

List<Widget> listOfaccount = [
  MyCurrentLocation(),
  UserEmail(),
  UserPhone(),
  const UserLogout(),
];
