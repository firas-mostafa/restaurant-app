import 'package:flutter/material.dart';
import 'package:restoorder/model/food_model.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key, required this.tabController});
  final TabController tabController;
  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values
        .map((category) => Tab(
              text: category.toString().split(".").last,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
      unselectedLabelColor: Theme.of(context).colorScheme.tertiary,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Theme.of(context).colorScheme.primary,
      dividerColor: Colors.transparent,
      controller: tabController,
      tabs: _buildCategoryTabs(),
    );
  }
}
