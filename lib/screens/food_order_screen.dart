import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/food_item_provider.dart';
import '../widgets/food_order_item.dart';

class FoodOrderScreen extends StatelessWidget {
  static const String routeName = '/food-order';

  final List<String> foodFilter = [
    'All',
    'Seafood',
    'Breakfast',
    'Drinks',
    'Chinese',
    'Dessert',
  ];
  FoodOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food Order')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'The Burger',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Text(
                      'Factory',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('./assets/images/burger_factory.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodFilter.length,
                itemBuilder: (context, index) {
                  final isAll = foodFilter[index] == 'All';
                  return SizedBox(
                    width: isAll ? 50 : null,
                    height: isAll ? 50 : null,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(isAll ? 50 : 20),
                      ),
                      color: Colors.white,
                      child: TextButton(
                        onPressed: () {},
                        style:
                            isAll
                                ? TextButton.styleFrom(
                                  backgroundColor: Colors.indigo[200],
                                  shape: const CircleBorder(),
                                )
                                : null,
                        child: Text(
                          foodFilter[index],
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Consumer<FoodItemProvider>(
              builder: (context, dishData, child) {
                final dish = dishData.foodItem;
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: dish.length,
                  itemBuilder: (context, index) {
                    return FoodOrderItem(
                      id: dish[index].id,
                      dishName: dish[index].dishName,
                      dishImageUrl: dish[index].dishImageUrl,
                      price: dish[index].price,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
