import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restoorder/model/food_model.dart';

import '../model/cart_item.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    //burger
    Food(
        name: "Classic Burger",
        image: "assets/images/burger/burger.jpg",
        price: 0.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [
          AddOn(name: "Extra Cheese", price: 0.32),
          AddOn(name: "Bacon", price: 0.77),
          AddOn(name: "Ketchup", price: 0.74),
        ],
        category: FoodCategory.burger,
        favorite: false),
    Food(
        name: "Aloha Burger",
        image: "assets/images/burger/aloha_burger.jpg",
        price: 1.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [
          AddOn(name: "Extra Chess", price: 0.32),
          AddOn(name: "Bacon", price: 0.77),
          AddOn(name: "Ketchup", price: 0.74),
        ],
        category: FoodCategory.burger,
        favorite: false),
    Food(
        favorite: false,
        name: "Extra Cheese Burger",
        image: "assets/images/burger/extracheese_burger.jpg",
        price: 2.54,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [
          AddOn(name: "Extra Chess", price: 0.32),
          AddOn(name: "Bacon", price: 0.77),
          AddOn(name: "Ketchup", price: 0.74),
        ],
        category: FoodCategory.burger),
    Food(
        favorite: false,
        name: "BBQ Burger",
        image: "assets/images/burger/bbq_burger.jpg",
        price: 2.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [
          AddOn(name: "Extra Chess", price: 0.32),
          AddOn(name: "Bacon", price: 0.77),
          AddOn(name: "Ketchup", price: 0.74),
        ],
        category: FoodCategory.burger),
    Food(
        favorite: false,
        name: "BlueMoon Burger",
        image: "assets/images/burger/bluemoon_burger.jpg",
        price: 2.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [
          AddOn(name: "Extra Chess", price: 0.32),
          AddOn(name: "Bacon", price: 0.77),
          AddOn(name: "Ketchup", price: 0.74),
        ],
        category: FoodCategory.burger),
    Food(
        favorite: false,
        name: "Vege Burger",
        image: "assets/images/burger/vege_burger.jpg",
        price: 2.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [
          AddOn(name: "Extra Chess", price: 0.32),
          AddOn(name: "Bacon", price: 0.77),
          AddOn(name: "Ketchup", price: 0.74),
        ],
        category: FoodCategory.burger),

    //salad
    Food(
        favorite: false,
        name: "Fattoush",
        image: "assets/images/salad/fattoush.jpg",
        price: 0.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.salads),
    Food(
        favorite: false,
        name: "Greek salad",
        image: "assets/images/salad/greek_salad.jpg",
        price: 0.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.salads),
    Food(
        favorite: false,
        name: "Tabouleh",
        image: "assets/images/salad/tabbouleh.jpg",
        price: 2.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.salads),
    Food(
        favorite: false,
        name: "Vietnamese Chicken salad",
        image: "assets/images/salad/vietnamese_chicken_salad.jpg",
        price: 2.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.salads),

    //drink
    Food(
        favorite: false,
        name: "Coca cola",
        image: "assets/images/drink/coco_cola.jpg",
        price: 0.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.drinks),
    Food(
        favorite: false,
        name: "Ice Coffee",
        image: "assets/images/drink/ice_coffee.jpg",
        price: 2.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.drinks),
    Food(
        favorite: false,
        name: "Caramel Macchiato",
        image: "assets/images/drink/caramel_macchiato.jpg",
        price: 0.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.drinks),
    Food(
        favorite: false,
        name: "Orange juice",
        image: "assets/images/drink/orange_juice.jpg",
        price: 0.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.drinks),
    Food(
        favorite: false,
        name: "Hot Chocolate",
        image: "assets/images/drink/hot_chocolate.jpg",
        price: 0.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.drinks),
    //dessert
    Food(
        favorite: false,
        name: "Cake",
        image: "assets/images/desserts/cake.jpg",
        price: 0.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [AddOn(name: "Extra creama", price: 0.4)],
        category: FoodCategory.desserts),
    Food(
        favorite: false,
        name: "Apple Pie",
        image: "assets/images/desserts/apple_pie.jpg",
        price: 2.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.desserts),
    Food(
        favorite: false,
        name: "Red Velvet Lava Cake",
        image: "assets/images/desserts/red_velvet_lava_cake.jpg",
        price: 1.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.desserts),
    Food(
        favorite: false,
        name: "Cheese Cake",
        image: "assets/images/desserts/cheese_cake.jpg",
        price: 2.54,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.desserts),
    //side
    Food(
        favorite: false,
        name: "Baba Ghanoush",
        image: "assets/images/side/baba_ghanoush.jpg",
        price: 0.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.sides),
    Food(
        favorite: false,
        name: "Chips",
        image: "assets/images/side/chips.jpg",
        price: 0.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.sides),
    Food(
        favorite: false,
        name: "Falafel",
        image: "assets/images/side/falafel.jpg",
        price: 0.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.sides),
    Food(
        favorite: false,
        name: "French Fries",
        image: "assets/images/side/french_fries.jpg",
        price: 0.99,
        description:
            " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.sides),
    Food(
        favorite: false,
        name: "Houmos",
        image: "assets/images/side/houmos.jpg",
        price: 0.99,
        description:
            " Lorem Ipsum has been the industry's standard , when an unknown printer took a galley",
        addOn: [],
        category: FoodCategory.sides),
  ];
  //user cart
  final List<CartItem> _cart = [];
  //user address
  String _userAddress = "123 xxxxx xxxx";

  //! GETTERS
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get userAddress => _userAddress;
  List<Food> get favorite {
    List<Food> fav = [];
    for (Food food in _menu) {
      if (food.favorite && !fav.contains(food)) {
        fav.add(food);
      }
    }
    return fav;
  }
  //! OPERATIONS

  //add to cart
  void addToCart(Food food, List<AddOn> selectAddOn) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddOn =
          const ListEquality().equals(item.selectAddOn, selectAddOn);
      return isSameAddOn && isSameFood;
    });
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(
        food: food,
        selectAddOn: selectAddOn,
      ));
    }
    notifyListeners();
  }

  //remove from cart
  void removeFormCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price
  double getTotalPrice() {
    double total = 0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (AddOn addOn in cartItem.selectAddOn) {
        itemTotal += addOn.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalItems() {
    int totalIntemCount = 0;
    for (CartItem cartItem in _cart) {
      totalIntemCount += cartItem.quantity;
    }
    return totalIntemCount;
  }

  // clear the cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //Update address
  void updateAddress(String address) {
    _userAddress = address;
    notifyListeners();
  }

  //! HELPERs
  //generate a receipt
  String cardReceipt() {
    final receipt = StringBuffer();
    String formattedDate =
        DateFormat("yy-mm-dd-hh:mm:ss").format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();

    for (var cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectAddOn.isNotEmpty) {
        receipt.writeln("AddOns : ${_formatAddOn(cartItem.selectAddOn)}");
      }
      receipt.writeln();
    }

    receipt.writeln();
    receipt.writeln(
        "Total Items : ${getTotalItems()},Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Address : $userAddress");
    return receipt.toString();
  }

  //format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)} ";
  }

  //format list of addons into a string summary
  String _formatAddOn(List<AddOn> addOn) {
    return addOn
        .map((addOn) => "${addOn.name} (${_formatPrice(addOn.price)})")
        .join(",");
  }
}
