import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoorder/components/my_food_tile.dart';
import 'package:restoorder/components/my_sliver_app_bar.dart';
import 'package:restoorder/components/my_tab_bar.dart';
import 'package:restoorder/components/offer_banar.dart';
import 'package:restoorder/model/food_model.dart';
import 'package:restoorder/provider/offer_provider.dart';
import 'package:restoorder/provider/restaurant.dart';
import 'package:restoorder/pages/home/food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuCategory(category, fullMenu);
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categoryMenu.length,
          itemBuilder: (context, index) {
            Food food = categoryMenu[index];
            return FoodTile(
                food: food,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FoodPage(food: food)));
                });
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        MySliverApp(
          title: MyTabBar(tabController: _tabController),
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 85),
            color: Theme.of(context).colorScheme.background,
            child: ChangeNotifierProvider(
                create: (context) => OfferProvider(),
                child: const OfferBanar()),
          ),
        )
      ],
      body: Consumer<Restaurant>(builder: (context, restrant, child) {
        return TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restrant.menu));
      }),
    );
  }
}
