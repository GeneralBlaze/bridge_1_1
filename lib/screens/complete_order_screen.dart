import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/restaurant_provider.dart';

class CompleteOrderScreen extends StatelessWidget {
  static const String routeName = '/complete-order';

  const CompleteOrderScreen({super.key});

  Widget _buildOrderDetailCard({required Icon icon, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 10),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complete Order')),
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
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Summary',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            _buildOrderDetailCard(
                              icon: Icon(Icons.people_outline),
                              value: '2 Guests',
                            ),
                            const SizedBox(height: 10),
                            _buildOrderDetailCard(
                              icon: Icon(Icons.calendar_today),
                              value: '12th October 2023',
                            ),
                            const SizedBox(height: 10),
                            _buildOrderDetailCard(
                              icon: Icon(Icons.access_time),
                              value: '4:00 PM - 7:00 PM',
                            ),

                            const SizedBox(height: 10),
                            _buildOrderDetailCard(
                              icon: Icon(Icons.wallet_giftcard_outlined),
                              value: 'Private',
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 90,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow[200],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          'Table reservations come with a non-refundable deposit, Checkout to continue',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Fee',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                      Consumer<RestuarantProvider>(
                        builder: (context, restuarantData, child) {
                          final nonRefundableFee =
                              restuarantData.nonRefundableFee;
                          return Text(
                            '₦ $nonRefundableFee',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Next',
                      style: TextStyle(fontSize: 16, color: Colors.white),
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
