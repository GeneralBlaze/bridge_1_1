import 'package:flutter/material.dart';

class Restaurant extends StatelessWidget {
  final String rating;
  final String stars;
  final String distance;
  final String image;
  final String name;
  final String id;
  final double leftPadding;

  const Restaurant({
    super.key,
    required this.rating,
    required this.stars,
    required this.distance,
    required this.image,
    required this.name,
    required this.id,
    this.leftPadding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              image,
              height: 100,
              width: 150,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    height: 70,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    child: Icon(Icons.broken_image, color: Colors.grey),
                  ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: leftPadding),
                child: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: leftPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Text(stars, style: TextStyle(fontSize: 10)),
                    SizedBox(width: 5),
                    Text('($rating Ratings)', style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: leftPadding),
                child: Chip(
                  label: Text(
                    "$distance away",
                    style: TextStyle(color: Colors.white), // Text color
                  ),
                  backgroundColor: Colors.orange.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
