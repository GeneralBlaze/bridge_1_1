import 'package:flutter/foundation.dart';

class RestuarantNearYou {
  final String id;
  final String restuarantName;
  final String restuarantImageUrl;
  final int restuarantRating;
  final double restuarantStars;
  final String restuarantDistance;
  final String restuarantAddress;
  final String nonRefundableFee;

  RestuarantNearYou({
    required this.id,
    required this.restuarantName,
    required this.restuarantImageUrl,
    required this.restuarantRating,
    required this.restuarantStars,
    required this.restuarantDistance,
    this.restuarantAddress = '',
    this.nonRefundableFee = '',
  });
}

class RestuarantProvider with ChangeNotifier {
  final List<RestuarantNearYou> _restuarant = [
    RestuarantNearYou(
      id: '1',
      restuarantName: 'The Place',
      restuarantImageUrl:
          'https://img.freepik.com/free-photo/restaurant-hall-with-red-brick-walls-wooden-tables-pipes-ceiling_140725-8504.jpg?t=st=1743458335~exp=1743461935~hmac=6a9c57a5c4ec8f3fd5ace41e9dd567b50b2a450e2d0ef5691bc97abcd7ea251b&w=1800',
      restuarantRating: 500,
      restuarantStars: 4.5,
      restuarantDistance: '2.5 km',
      restuarantAddress: '10 Abraham Adesanya St, Eti-Osa.',
      nonRefundableFee: '₦4,500',
    ),
    RestuarantNearYou(
      id: '2',
      restuarantName: 'Rendevouz Deli',
      restuarantImageUrl:
          'https://img.freepik.com/free-photo/restaurant-interior_1127-3394.jpg?t=st=1743458295~exp=1743461895~hmac=a0250f32193c94913e14a3e76452da36e80e805ca58acb7f60b5fbc974311b09&w=2000',
      restuarantRating: 23,
      restuarantStars: 5.0,
      restuarantDistance: '3.0 km',
      restuarantAddress: '456 Elm St, Cityville',
      nonRefundableFee: '₦4,500',
    ),
    RestuarantNearYou(
      id: '3',
      restuarantName: 'Kilimanjaro',
      restuarantImageUrl:
          'https://img.freepik.com/premium-photo/modern-shabu-sukiyaki-restaurant-decorated-with-wood-concrete_43263-1838.jpg?w=2000',
      restuarantRating: 350,
      restuarantStars: 3.5,
      restuarantDistance: '1.5 km',
      restuarantAddress: '789 Oak St, Cityville',
      nonRefundableFee: '₦4,500',
    ),
    RestuarantNearYou(
      id: '4',
      restuarantName: 'Bommers',
      restuarantImageUrl:
          'https://img.freepik.com/premium-photo/shabu-dining-table-set-including-one-wooden-table-seats-ground-with-bamboo-ceiling_43263-1101.jpg?w=1800',
      restuarantRating: 126,
      restuarantStars: 4.0,
      restuarantDistance: '4.0 km',
      restuarantAddress: '101 Pine St, Cityville',
      nonRefundableFee: '₦4,500',
    ),
    RestuarantNearYou(
      id: '5',
      restuarantName: 'The Place',
      restuarantImageUrl:
          'https://img.freepik.com/free-photo/restaurant-hall-with-red-brick-walls-wooden-tables-pipes-ceiling_140725-8504.jpg?t=st=1743458335~exp=1743461935~hmac=6a9c57a5c4ec8f3fd5ace41e9dd567b50b2a450e2d0ef5691bc97abcd7ea251b&w=1800',
      restuarantRating: 500,
      restuarantStars: 4.5,
      restuarantDistance: '2.5 km',
      restuarantAddress: '123 Main St, Cityville',
      nonRefundableFee: '₦4,500',
    ),
    RestuarantNearYou(
      id: '6',
      restuarantName: 'The Place',
      restuarantImageUrl:
          'https://img.freepik.com/free-photo/restaurant-hall-with-red-brick-walls-wooden-tables-pipes-ceiling_140725-8504.jpg?t=st=1743458335~exp=1743461935~hmac=6a9c57a5c4ec8f3fd5ace41e9dd567b50b2a450e2d0ef5691bc97abcd7ea251b&w=1800',
      restuarantRating: 500,
      restuarantStars: 4.5,
      restuarantDistance: '2.5 km',
      restuarantAddress: '123 Main St, Cityville',
      nonRefundableFee: '₦4,500',
    ),
    // Add more restaurants as needed
  ];

  List<RestuarantNearYou> get restuarant {
    return [..._restuarant];
  }

  String? _selectedRestaurantId;
  String? get selectedRestaurantId => _selectedRestaurantId;
  double get nonRefundableFee => 4500.0;

  void selectRestaurant(String id) {
    _selectedRestaurantId = id;
  }
}
