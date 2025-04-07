import 'package:flutter/foundation.dart';

class FoodItem {
  final String id;
  final String dishName;
  final String dishImageUrl;
  final double price;

  FoodItem({
    required this.id,
    required this.dishName,
    required this.dishImageUrl,
    required this.price,
  });
}

class FoodItemProvider with ChangeNotifier {
  final List<FoodItem> _foodItem = [
    FoodItem(
      id: '1',
      dishName: 'Vulcan Chicken Pizza',
      dishImageUrl:
          'https://img.freepik.com/free-photo/pizza-pizza-filled-with-tomatoes-salami-olives_140725-1200.jpg?t=st=1744039642~exp=1744043242~hmac=78e2348d095a90fa0ae07318c17178023678fc9ed45ca23c074445b655637133&w=1380',
      price: 2500.00,
    ),
    FoodItem(
      id: '2',
      dishName: 'Spicy Grilled Snail',
      dishImageUrl:
          'https://img.freepik.com/free-photo/close-up-view-delicious-food-arrangement_23-2148510948.jpg?t=st=1744039848~exp=1744043448~hmac=e61f4f6ba06e171f66b3da23cee69daa22b889a0bedd8c398340f961a8c5227f&w=2000',
      price: 1800.00,
    ),
    FoodItem(
      id: '3',
      dishName: 'Beef Burger',
      dishImageUrl:
          'https://img.freepik.com/free-photo/delicious-burger-with-many-ingredients-isolated-white-background-tasty-cheeseburger-splash-sauce_90220-1266.jpg?t=st=1744039987~exp=1744043587~hmac=9f123abdddf543722be7e2b1b15d63bca10afa9e67868685fe77ceea9f901e2d&w=1380',
      price: 700.00,
    ),
    FoodItem(
      id: '4',
      dishName: 'Fried Rice',
      dishImageUrl:
          'https://img.freepik.com/free-photo/fried-rice-served-with-hot-syrup_157027-4061.jpg?t=st=1744040083~exp=1744043683~hmac=bace6be0da05e9ed358100bb564dab5240cbfbc52b71a284b5482f2035572ad0&w=1380',
      price: 3100.00,
    ),
    FoodItem(
      id: '5',
      dishName: 'Cocktail',
      dishImageUrl:
          'https://img.freepik.com/free-photo/bar-tender-sprays-cocktail-glass-garnished-with-flower_141793-2003.jpg?t=st=1744040148~exp=1744043748~hmac=5455ce21328fcc0486593cf27d1ead0d771035ef801f052e148f5308e4a6336e&w=996',
      price: 2000.00,
    ),
    FoodItem(
      id: '6',
      dishName: 'Berry Cake',
      dishImageUrl:
          'https://img.freepik.com/free-photo/dessert-table_181624-10310.jpg?t=st=1744040262~exp=1744043862~hmac=b58da5d1a42c05ebbc1f2a11e36e969d76ff0fca89524b15c1fe50311d6d1244&w=900',
      price: 1500.00,
    ),
  ];

  List<FoodItem> get foodItem {
    return [..._foodItem];
  }
}
