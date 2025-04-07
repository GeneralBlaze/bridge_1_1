import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/restaurant_provider.dart';
import '../widgets/restaurant_widget.dart';

class MakeReservationScreen extends StatelessWidget {
  static const String routeName = '/make-reservation';
  const MakeReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Make a Reservation')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Handle search action
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text(
              'Choose your preferred restaurant',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Divider(color: Colors.grey[300], thickness: 3),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const SizedBox(width: 15),
              const Icon(Icons.location_on, color: Colors.grey),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Near Me',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text('Results are based on proximity'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Consumer<RestuarantProvider>(
              builder: (context, restuarantData, child) {
                final restuarants = restuarantData.restuarant;
                return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.8 / 3.3,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 220.0,
                      padding: const EdgeInsets.all(10),
                      child: Restaurant(
                        rating: restuarants[index].restuarantRating.toString(),
                        stars: restuarants[index].restuarantStars.toString(),
                        distance: restuarants[index].restuarantDistance,
                        image: restuarants[index].restuarantImageUrl,
                        name: restuarants[index].restuarantName,
                        id: restuarants[index].id,
                        leftPadding: 5.0,
                      ),
                    );
                  },
                  itemCount: restuarants.length,
                  scrollDirection: Axis.vertical,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
