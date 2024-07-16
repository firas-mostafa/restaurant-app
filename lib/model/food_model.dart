// ignore_for_file: public_member_api_docs, sort_constructors_first

class Food {
  final String name;
  final String image;
  final double price;
  final String description;
  final FoodCategory category;
  final List<AddOn> addOn;
  bool favorite;
  Food(
      {required this.name,
      required this.image,
      required this.price,
      required this.description,
      required this.addOn,
      required this.favorite,
      required this.category});
}

//food categories
enum FoodCategory { burger, salads, sides, desserts, drinks }

// food addOns
class AddOn {
  String name;
  double price;
  AddOn({
    required this.name,
    required this.price,
  });
}
