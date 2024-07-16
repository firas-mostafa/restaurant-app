import 'package:flutter/material.dart';

class DriverNavbar extends StatelessWidget {
  const DriverNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return PreferredSize(
        preferredSize: Size(screenWidth, screenHeight * 0.10),
        child: Container(
          height: screenHeight * 0.09,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.shadow,
                Theme.of(context).colorScheme.primary,
              ])),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  radius: 20,
                  child: Icon(
                    Icons.person_3_rounded,
                    size: 20,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Firas Mostafa",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 16),
                    ),
                    Text(
                      "Driver",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                          fontSize: 13),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 8,
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    radius: 20,
                    child: Icon(
                      Icons.message_rounded,
                      color: Theme.of(context).colorScheme.tertiary,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.04,
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    radius: 20,
                    child: Icon(
                      Icons.call_rounded,
                      size: 20,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
