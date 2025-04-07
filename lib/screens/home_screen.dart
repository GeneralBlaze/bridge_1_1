import 'package:bridge_1_1/screens/food_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/restaurant_provider.dart';
import '../widgets/restaurant_widget.dart';
import './make_reservation_screen.dart';
//import './make_order.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  Widget _buildRestaurantList(BuildContext context) {
    return Container(
      height: 220.0,
      padding: const EdgeInsets.all(10),
      child: Consumer<RestuarantProvider>(
        builder: (context, restuarantData, child) {
          final restuarants = restuarantData.restuarant;
          return ListView.builder(
            itemBuilder: (context, index) {
              return Restaurant(
                rating: restuarants[index].restuarantRating.toString(),
                stars: restuarants[index].restuarantStars.toString(),
                distance: restuarants[index].restuarantDistance,
                image: restuarants[index].restuarantImageUrl,
                name: restuarants[index].restuarantName,
                id: restuarants[index].id,
              );
            },
            itemCount: restuarants.length,
            scrollDirection: Axis.horizontal,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://img.freepik.com/premium-photo/usa-october-2019-wine-restaurant-interior-with-white-tablecloths_418500-1051.jpg?w=1800',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "What would you like today?",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              //MakeOrderScreen.routeName,
                              FoodOrderScreen.routeName,
                            );
                          },
                          child: const Text("Make Order"),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              MakeReservationScreen.routeName,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[200],
                          ),
                          child: const Text("Reserve Table"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: const Text(
                "Restaurants Near You",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            _buildRestaurantList(context),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: const Text(
                'Popular Restaurants',
                style: TextStyle(fontSize: 20),
              ),
            ),
            _buildRestaurantList(context),
          ],
        ),
      ),
    );
  }
}
