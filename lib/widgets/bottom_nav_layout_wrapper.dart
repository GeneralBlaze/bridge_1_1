import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/make_order.dart';
import '../screens/make_reservation_screen.dart';

class BottomNavLayoutWrapper extends StatefulWidget {
  final Widget child;
  const BottomNavLayoutWrapper({super.key, required this.child});

  @override
  State<BottomNavLayoutWrapper> createState() => _BottomNavLayoutWrapperState();
}

class _BottomNavLayoutWrapperState extends State<BottomNavLayoutWrapper> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MakeOrderScreen(),
    const MakeReservationScreen(),
  ];

  void _onTap(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.bolt_rounded),
                label: 'orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
            ],
            onTap: (index) {
              _onTap(index);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => BottomNavLayoutWrapper(child: _pages[index]),
                ),
              );
            },
          ),
          Positioned(
            top: -20,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blue,
              child: const Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }
}
