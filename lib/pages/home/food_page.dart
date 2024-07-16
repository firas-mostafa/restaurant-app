import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoorder/components/button.dart';
import 'package:restoorder/components/rating_food.dart';
import 'package:restoorder/model/food_model.dart';
import 'package:restoorder/pages/home/checkout.dart';
import 'package:restoorder/provider/restaurant.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<AddOn, bool> selectedAddOn = {};
  FoodPage({super.key, required this.food}) {
    for (AddOn addon in food.addOn) {
      selectedAddOn[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<AddOn, bool> selectedAddOn) {
    List<AddOn> currentlySelectedAddOn = [];
    for (AddOn addOn in widget.food.addOn) {
      if (widget.selectedAddOn[addOn] == true) {
        currentlySelectedAddOn.add(addOn);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddOn);
  }

  void addTofavorite(Food food) {
    food.favorite ? food.favorite = false : true;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //image
            Stack(
              children: [
                Image.asset(
                  widget.food.image,
                ),
                Positioned(
                  left: 30,
                  top: 30,
                  child: Opacity(
                    opacity: 0.7,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: CircleAvatar(
                        radius: 25,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Theme.of(context).colorScheme.surface,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Food name
                  Text(
                    widget.food.name,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  //Food rate
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingFood(
                        background: Theme.of(context).colorScheme.secondary,
                        dividerColor: Theme.of(context).colorScheme.background,
                      ),
                      //add your rate of this food
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                            width: screenWidth * 0.35,
                            height: screenHeight * 0.03,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Theme.of(context).colorScheme.tertiary),
                            child: Center(
                                child: Text(
                              "Rate this food",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.shadow,
                                  fontWeight: FontWeight.w600),
                            ))),
                      ),
                    ],
                  ),

                  //Food price
                  Text(
                    "${widget.food.price} \$",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  //Food description
                  Text(
                    widget.food.description,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //addOn
                  widget.selectedAddOn.isEmpty
                      ? const SizedBox()
                      : Text(
                          "Add On",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  widget.selectedAddOn.isEmpty
                      ? const SizedBox()
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.food.addOn.length,
                              padding: const EdgeInsets.all(0),
                              itemBuilder: (context, index) => CheckboxListTile(
                                    value: widget.selectedAddOn[
                                        widget.food.addOn[index]],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        widget.selectedAddOn[
                                            widget.food.addOn[index]] = value!;
                                      });
                                    },
                                    title: Text(widget.food.addOn[index].name),
                                    subtitle: Text("${widget.food.price} \$"),
                                  )),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button(
                    onTap: () {
                      addToCart(widget.food, widget.selectedAddOn);
                      Navigator.pop(context);
                    },
                    text: 'add to cart',
                    padding: 0,
                  ),
                  BuyButton(
                    onTap: () {
                      addToCart(widget.food, widget.selectedAddOn);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckOut(),
                          ));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
