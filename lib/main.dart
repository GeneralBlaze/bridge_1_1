import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/food_item_provider.dart';
import './providers/restaurant_provider.dart';

import './screens/login_screen.dart';
import './screens/home_screen.dart';
import './screens/make_order.dart';
import './screens/make_reservation_screen.dart';
import './widgets/bottom_nav_layout_wrapper.dart';
import './screens/food_order_screen.dart';
import './screens/fill_reservation_details_screen.dart';
import './screens/complete_order_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => RestuarantProvider()),
        ChangeNotifierProvider(create: (ctx) => FoodItemProvider()),
      ],
      child: MaterialApp(
        title: 'Bridge app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[900]!),
          primaryColor: Colors.blueAccent[700],
          scaffoldBackgroundColor: Colors.white,
        ),
        home: LoginScreen(),
        routes: {
          '/home':
              (context) => BottomNavLayoutWrapper(child: const HomeScreen()),
          LoginScreen.routeName: (context) => const LoginScreen(),
          MakeReservationScreen.routeName:
              (context) => const MakeReservationScreen(),
          MakeOrderScreen.routeName: (context) => MakeOrderScreen(),
          FoodOrderScreen.routeName: (context) => FoodOrderScreen(),
          FillReservationDetailsScreen.routeName:
              (context) => const FillReservationDetailsScreen(),
          CompleteOrderScreen.routeName:
              (context) => const CompleteOrderScreen(),
        },
      ),
    );
  }
}
