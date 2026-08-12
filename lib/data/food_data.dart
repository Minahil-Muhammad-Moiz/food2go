import '../models/food_item.dart';

class FoodData {
  static final List<FoodItem> items = [
    // Fast Food Items
    FoodItem(
      id: '1',
      name: 'Classic Burger',
      category: 'Fast Food',
      image: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
      price: 120,
      description:
          'Juicy beef patty with fresh lettuce, tomatoes, and our secret sauce.',
    ),
    FoodItem(
      id: '2',
      name: 'Pepperoni Pizza',
      category: 'Fast Food',
      image: 'https://images.unsplash.com/photo-1513104890138-7c749659a591',
      price: 180,
      description: 'Classic pepperoni pizza with melted mozzarella cheese.',
    ),
    FoodItem(
      id: '3',
      name: 'Chicken Wrap',
      category: 'Fast Food',
      image: 'https://images.unsplash.com/photo-1626700051175-6818013e1d4f',
      price: 150,
      description:
          'Grilled chicken with fresh vegetables wrapped in a soft tortilla.',
    ),
    FoodItem(
      id: '4',
      name: 'French Fries',
      category: 'Fast Food',
      image: 'https://images.unsplash.com/photo-1630384060421-cb20d0e0649d',
      price: 80,
      description: 'Crispy golden fries served with ketchup.',
    ),
    FoodItem(
      id: '5',
      name: 'Chicken Nuggets',
      category: 'Fast Food',
      image: 'https://images.unsplash.com/photo-1562967914-608f82629710',
      price: 100,
      description: 'Crispy chicken nuggets with your choice of dipping sauce.',
    ),
    FoodItem(
      id: '6',
      name: 'Veggie Burger',
      category: 'Fast Food',
      image: 'https://images.unsplash.com/photo-1551782450-a2132b4ba21d',
      price: 130,
      description: 'Plant-based patty with fresh vegetables and vegan sauce.',
    ),
    FoodItem(
      id: '7',
      name: 'Chicken Burger',
      category: 'Fast Food',
      image: 'https://images.unsplash.com/photo-1550547660-d9450f859349',
      price: 140,
      description: 'Crispy fried chicken breast with lettuce and mayo.',
    ),
    FoodItem(
      id: '8',
      name: 'Hot Dog',
      category: 'Fast Food',
      image: 'https://images.unsplash.com/photo-1614729939124-032d3569c85c',
      price: 90,
      description: 'Grilled sausage in a soft bun with toppings.',
    ),

    // Dinner Items
    FoodItem(
      id: '9',
      name: 'Grilled Steak',
      category: 'Dinner',
      image: 'https://images.unsplash.com/photo-1544025162-d76694265947',
      price: 350,
      description: 'Perfectly grilled steak served with roasted vegetables.',
    ),
    FoodItem(
      id: '10',
      name: 'Chicken Alfredo Pasta',
      category: 'Dinner',
      image: 'https://images.unsplash.com/photo-1645112411341-6c4fd023714a',
      price: 280,
      description: 'Creamy Alfredo pasta with grilled chicken and parmesan.',
    ),
    FoodItem(
      id: '11',
      name: 'Grilled Salmon',
      category: 'Dinner',
      image: 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2',
      price: 400,
      description: 'Fresh Atlantic salmon with lemon butter sauce.',
    ),
    FoodItem(
      id: '12',
      name: 'Vegetable Stir Fry',
      category: 'Dinner',
      image: 'https://images.unsplash.com/photo-1512058564366-18510be2db19',
      price: 220,
      description: 'Fresh seasonal vegetables stir-fried in savory sauce.',
    ),
    FoodItem(
      id: '13',
      name: 'Chicken Biryani',
      category: 'Dinner',
      image: 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8',
      price: 300,
      description:
          'Fragrant basmati rice with tender chicken and aromatic spices.',
    ),
    FoodItem(
      id: '14',
      name: 'Beef Tacos',
      category: 'Dinner',
      image: 'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b',
      price: 250,
      description: 'Three soft tacos with seasoned beef and fresh toppings.',
    ),
    FoodItem(
      id: '15',
      name: 'Lasagna',
      category: 'Dinner',
      image: 'https://images.unsplash.com/photo-1574894709920-11b28a5e9483',
      price: 320,
      description:
          'Classic Italian lasagna with layers of pasta, meat sauce, and cheese.',
    ),
    FoodItem(
      id: '16',
      name: 'Chicken Parmesan',
      category: 'Dinner',
      image: 'https://images.unsplash.com/photo-1632778149955-e80f8ceca2b8',
      price: 290,
      description:
          'Breaded chicken breast topped with marinara and melted cheese.',
    ),

    // Add more items if you want (Optional) - Breakfast or Desserts
    FoodItem(
      id: '17',
      name: 'Pancakes',
      category: 'Breakfast',
      image: 'https://images.unsplash.com/photo-1528207776546-365bb710ee93',
      price: 150,
      description: 'Fluffy pancakes served with maple syrup and butter.',
    ),
    FoodItem(
      id: '18',
      name: 'Chocolate Cake',
      category: 'Dessert',
      image: 'https://images.unsplash.com/photo-1578985545062-69928b1d9586',
      price: 200,
      description: 'Rich chocolate cake with creamy frosting.',
    ),
  ];
}
