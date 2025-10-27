import 'package:flutter/material.dart';
import 'meal_detail_screen.dart';

class MealSelectionScreen extends StatelessWidget {
  final String cuisine;
  MealSelectionScreen({required this.cuisine});

  final Map<String, List<Map<String, String>>> mealsByCuisine = {
    'Indian': [
      {'name': 'Chole Bhature', 'image': 'https://bluenilekitchen.com/wp-content/uploads/2024/08/IMG_0208-scaled.jpg'},
      {'name': 'Palak Paneer', 'image': 'https://www.indianhealthyrecipes.com/wp-content/uploads/2020/06/palak-paneer-recipe.jpg'},
      {'name': 'Chicken Biryani', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAWdsTP6pgjHcesz7CQa7qOgeEHduBqLbxkA&s'},
      {'name': 'Aloo Gobi', 'image': 'https://pipingpotcurry.com/wp-content/uploads/2024/08/Aloo-Gobi-Piping-Pot-Curry.jpg'},
    ],
    'Italian': [
      {'name': 'Spaghetti Carbonara', 'image': 'assets/italian_spaghetti.jpg'},
      {'name': 'Margherita Pizza', 'image': 'assets/italian_pizza.jpg'},
      {'name': 'Pasta Primavera', 'image': 'assets/italian_pasta.jpg'},
      {'name': 'Minestrone Soup', 'image': 'assets/italian_soup.jpg'},
    ],
    'Mexican': [
      {'name': 'Tacos al Pastor', 'image': 'https://thestayathomechef.com/wp-content/uploads/2024/04/Classic-Tacos-Al-Pastor_Square-1.jpg'},
      {'name': 'Chicken Enchiladas', 'image': 'https://www.jessicagavin.com/wp-content/uploads/2018/04/chicken-enchiladas-5-1200.jpg'},
      {'name': 'Guacamole', 'image': 'https://www.allrecipes.com/thmb/6RyFPH5N4KKmZhNY0Giob_Jj3wc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/AR-14231-guacamole-4x3-f7a3b5752c7f4f3fb934d03a8b548826.jpg'},
      {'name': 'Chilaquiles', 'image': 'https://www.lemontreedwelling.com/wp-content/uploads/2021/01/chilaquiles-featured.jpg'},
    ],
    'American': [
      {'name': 'Classic Burger', 'image': 'assets/american_burger.jpg'},
      {'name': 'Mac and Cheese', 'image': 'assets/american_mac.jpg'},
      {'name': 'BBQ Ribs', 'image': 'assets/american_ribs.jpg'},
      {'name': 'Pancakes', 'image': 'assets/american_pancakes.jpg'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final meals = mealsByCuisine[cuisine] ?? [];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('$cuisine Meals'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD1C4E9), Color(0xFFEDE7F6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a meal to explore delicious recipes! 🍴',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple.shade800,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: meals.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.95,
                ),
                itemBuilder: (context, index) {
                  final meal = meals[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MealDetailScreen(mealName: meal['name']!),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade100,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.shade200.withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Meal image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              meal['image']!,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 80,
                                  width: 80,
                                  color: Colors.grey.shade300,
                                  child: Icon(Icons.image_not_supported),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            meal['name']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
