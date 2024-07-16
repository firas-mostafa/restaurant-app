import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/home/main_page.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  List<IconData> listofIcons = [
    Icons.home,
    Icons.history,
    Icons.settings,
    Icons.account_circle_rounded,
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        padding: EdgeInsets.only(
          left: screenWidth * 0.02,
          right: screenWidth * 0.02,
        ),
        height: screenHeight * 0.06,
        width: screenWidth,
        color: Colors.transparent,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listofIcons.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.read<IndexProvider>().changeCurrentIndex(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  curve: Curves.linear,
                  decoration: BoxDecoration(
                    borderRadius:
                        index == context.read<IndexProvider>().currentIndex
                            ? const BorderRadius.only(
                                topRight: Radius.circular(50),
                                topLeft: Radius.circular(50))
                            : BorderRadius.circular(0),
                    color: index == context.read<IndexProvider>().currentIndex
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                  ),
                  width: index == context.read<IndexProvider>().currentIndex
                      ? screenWidth * 0.3
                      : screenWidth * 0.22,
                  height: screenHeight * 0.04,
                  child: Icon(
                    listofIcons[index],
                    color: context.read<IndexProvider>().currentIndex == index
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
              );
            }));
  }
}
