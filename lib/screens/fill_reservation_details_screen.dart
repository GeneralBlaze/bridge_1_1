import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/restaurant_provider.dart';
import '../screens/complete_order_screen.dart';

class FillReservationDetailsScreen extends StatelessWidget {
  static const String routeName = '/fill-reservation-details';

  const FillReservationDetailsScreen({super.key});

  Widget _buildTextField({
    required String labelText,
    required IconData icon,
    int maximumLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
      child: TextField(
        maxLines: maximumLines,
        decoration: InputDecoration(
          alignLabelWithHint: maximumLines > 1,
          fillColor: Colors.grey[200],
          filled: true,
          labelText: labelText,
          suffixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fill Reservation Details')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                color: Theme.of(context).scaffoldBackgroundColor,
                elevation: 5,
                child: Consumer<RestuarantProvider>(
                  builder: (context, restuarantData, child) {
                    final restuarants = restuarantData.restuarant;
                    final selectedId = restuarantData.selectedRestaurantId;
                    final selectedRestaurant = restuarants.firstWhere(
                      (r) => r.id == selectedId,
                    );
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.check, color: Colors.green[800]),
                                  const SizedBox(width: 10),
                                  Text(
                                    selectedRestaurant.restuarantName,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(Icons.arrow_outward_outlined),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 40,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [
                              Text(
                                selectedRestaurant.restuarantAddress,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            _buildTextField(
              labelText: 'Number of Guests',
              icon: Icons.people_outline,
            ),
            _buildTextField(labelText: 'Date', icon: Icons.calendar_today),
            _buildTextField(
              labelText: 'Check in',
              icon: Icons.check_circle_outlined,
            ),
            _buildTextField(
              labelText: 'Reservation Type',
              icon: Icons.wallet_giftcard_sharp,
            ),
            _buildTextField(
              labelText: 'Any Special Request ?',
              icon: Icons.message_outlined,
              maximumLines: 2,
            ),

            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, CompleteOrderScreen.routeName);
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Confirm',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(width: 20),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
