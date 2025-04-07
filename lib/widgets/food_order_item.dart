import 'package:flutter/material.dart';

class FoodOrderItem extends StatelessWidget {
  final String id;
  final String dishName;
  final String dishImageUrl;
  final double price;

  const FoodOrderItem({
    super.key,
    required this.id,
    required this.dishName,
    required this.dishImageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Card(
        elevation: 3,
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dishName, style: TextStyle(fontSize: 15)),
                    const SizedBox(height: 5),
                    Text(
                      '₦$price',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            minimumSize: const Size(100, 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        dishName == 'Spicy Grilled Snail'
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(dishImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
