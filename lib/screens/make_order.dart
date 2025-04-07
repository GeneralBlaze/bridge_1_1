import 'package:flutter/material.dart';

class MakeOrderScreen extends StatelessWidget {
  static const String routeName = '/make-order';
  
  const MakeOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double containerHeight = MediaQuery.of(context).size.height * 0.7;

    return Scaffold(
      appBar: AppBar(title: const Text('Make Order')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: containerHeight),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.search),
                const SizedBox(width: 10),
                const Text('Try Explore'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
