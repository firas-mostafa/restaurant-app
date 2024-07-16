import 'food_model.dart';

class CartItem {
  Food food;
  List<AddOn> selectAddOn;
  int quantity;
  CartItem({
    required this.food,
    required this.selectAddOn,
    this.quantity = 1,
  });
  double get totalPrice {
    double addonPrice = selectAddOn.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonPrice) * quantity;
  }
}
