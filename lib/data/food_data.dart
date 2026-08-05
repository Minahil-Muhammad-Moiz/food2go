import '../models/food_item.dart';

class FoodData {
  static final items = [
    FoodItem(
      id: '1',
      name: 'Burger',
      category: 'Fast Food',
      image: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
      price: 120,
      description: 'Classic burger with crispy fries.',
    ),
    FoodItem(
      id: '2',
      name: 'Pizza',
      category: 'Fast Food',
      image: 'https://images.unsplash.com/photo-1513104890138-7c749659a591',
      price: 180,
      description: 'Cheesy and fresh pizza slice.',
    ),
  ];
}
