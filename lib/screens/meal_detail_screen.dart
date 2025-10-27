import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealName;
  MealDetailScreen({required this.mealName});

  final Map<String, Map<String, List<String>>> mealDetails = {
    // Indian
    'Chole Bhature': {
      'ingredients': [
        '2 cups chickpeas',
        '2 onions (finely chopped)',
        '2 tomatoes (pureed)',
        '1 tsp cumin seeds',
        '1 tbsp chole masala',
        '1/2 tsp turmeric',
        '1 tsp red chili powder',
        'Salt to taste',
        '2 cups all-purpose flour',
        '½ cup yogurt',
        'Oil for frying',
      ],
      'instructions': [
        'Soak chickpeas overnight and boil until soft.',
        'Heat oil, add cumin seeds & onions; sauté until golden.',
        'Add tomato puree and spices; cook until oil separates.',
        'Add boiled chickpeas & simmer 20 min.',
        'Mix flour + yogurt to make dough; rest 1 hr.',
        'Roll into puris and deep-fry until golden.',
        'Serve hot with chole and sliced onions.'
      ]
    },
    'Palak Paneer': {
      'ingredients': [
        '2 cups spinach (blanched & pureed)',
        '200g paneer (cubed)',
        '1 onion (finely chopped)',
        '2 garlic cloves (minced)',
        '1" ginger (grated)',
        '1 green chili (optional)',
        '1/2 tsp cumin seeds',
        '1/2 tsp garam masala',
        'Salt to taste',
        '2 tbsp cream'
      ],
      'instructions': [
        'Heat oil, add cumin, garlic, ginger & onions. Sauté until golden.',
        'Add spinach puree; cook 5 minutes.',
        'Add paneer, salt & garam masala.',
        'Simmer 5 minutes, stir in cream, serve.'
      ]
    },
    'Chicken Biryani': {
      'ingredients': [
        '500g chicken (marinated in yogurt & spices)',
        '2 cups basmati rice',
        '2 onions (fried)',
        '1 tbsp biryani masala',
        '½ tsp saffron (soaked in milk)',
        'Whole spices (bay leaf, cardamom, cloves)',
        'Salt to taste',
        'Fresh coriander & mint leaves'
      ],
      'instructions': [
        'Parboil rice with whole spices.',
        'Layer chicken in pot, top with rice, onions, herbs & saffron milk.',
        'Seal and cook on low heat for 30 mins.',
        'Serve hot with raita.'
      ]
    },
    'Aloo Gobi': {
      'ingredients': [
        '2 potatoes (cubed)',
        '1 cauliflower (florets)',
        '1 onion (chopped)',
        '1 tomato (chopped)',
        '½ tsp turmeric',
        '1 tsp cumin seeds',
        '1 tsp coriander powder',
        'Salt to taste',
        'Fresh cilantro'
      ],
      'instructions': [
        'Heat oil, add cumin seeds.',
        'Add onions & sauté, then tomatoes & spices.',
        'Add potatoes and cauliflower; cook covered until tender.',
        'Garnish with cilantro & serve.'
      ]
    },

    // Italian
    'Spaghetti Carbonara': {
      'ingredients': [
        '200g spaghetti',
        '2 eggs',
        '½ cup Parmesan cheese',
        '100g pancetta',
        'Salt & black pepper'
      ],
      'instructions': [
        'Boil spaghetti until al dente.',
        'Cook pancetta until crispy.',
        'Beat eggs with Parmesan.',
        'Combine hot pasta with egg mix & pancetta quickly.',
        'Season & serve immediately.'
      ]
    },
    'Margherita Pizza': {
      'ingredients': [
        'Pizza dough',
        '½ cup tomato sauce',
        'Fresh mozzarella',
        'Basil leaves',
        'Drizzle of olive oil'
      ],
      'instructions': [
        'Preheat oven to 475°F.',
        'Spread sauce on rolled dough.',
        'Top with mozzarella & basil.',
        'Bake 10–12 mins until crust golden.',
        'Drizzle olive oil before slicing.'
      ]
    },
    'Pasta Primavera': {
      'ingredients': [
        '200g penne',
        '1 zucchini (sliced)',
        '1 bell pepper (sliced)',
        '1 carrot (julienned)',
        '½ cup cream',
        'Parmesan cheese',
        'Salt & pepper'
      ],
      'instructions': [
        'Boil pasta.',
        'Sauté vegetables until tender.',
        'Add cream, toss in pasta.',
        'Season & top with Parmesan.'
      ]
    },
    'Minestrone Soup': {
      'ingredients': [
        '1 onion (chopped)',
        '2 carrots (chopped)',
        '1 zucchini (chopped)',
        '1 can beans',
        '1 can diced tomatoes',
        '1 cup small pasta',
        'Vegetable broth',
        'Mixed herbs',
        'Salt & pepper'
      ],
      'instructions': [
        'Sauté veggies.',
        'Add broth, beans & tomatoes.',
        'Simmer & add pasta at the end.',
        'Cook until pasta is tender. Serve warm.'
      ]
    },

    // Mexican
    'Tacos al Pastor': {
      'ingredients': [
        '500g pork shoulder (sliced)',
        'Pineapple chunks',
        'Chili paste',
        'Garlic, cumin, oregano spices',
        'Corn tortillas',
        'Chopped onion & cilantro'
      ],
      'instructions': [
        'Marinate pork in spices & chili paste overnight.',
        'Grill with pineapple until caramelized.',
        'Serve on tortillas with onion & cilantro.'
      ]
    },
    'Chicken Enchiladas': {
      'ingredients': [
        'Shredded cooked chicken',
        'Tortillas',
        'Enchilada sauce',
        'Cheese',
        'Chopped onion'
      ],
      'instructions': [
        'Fill tortillas with chicken; roll up.',
        'Place in baking dish; top with sauce & cheese.',
        'Bake at 375°F for 20 minutes.'
      ]
    },
    'Guacamole': {
      'ingredients': [
        '2 ripe avocados',
        '1 tomato (chopped)',
        '½ onion (chopped)',
        'Juice of 1 lime',
        'Handful cilantro',
        'Salt to taste'
      ],
      'instructions': [
        'Mash avocados.',
        'Mix in tomato, onion, lime juice & cilantro.',
        'Season and serve fresh.'
      ]
    },
    'Chilaquiles': {
      'ingredients': [
        'Tortilla chips',
        'Salsa verde',
        'Fried eggs (optional)',
        'Chopped onion',
        'Cheese & sour cream'
      ],
      'instructions': [
        'Warm salsa and toss with chips until softened.',
        'Top with eggs, cheese, onion & sour cream.'
      ]
    },

    // American
    'Classic Burger': {
      'ingredients': [
        'Beef patties',
        'Burger buns',
        'Lettuce, tomato, cheese slices',
        'Ketchup, mustard'
      ],
      'instructions': [
        'Grill patties to desired doneness.',
        'Assemble with buns, lettuce, tomato & condiments.'
      ]
    },
    'Mac and Cheese': {
      'ingredients': [
        '200g macaroni',
        '2 cups cheddar cheese',
        '2 tbsp butter',
        '2 tbsp flour',
        '1 cup milk',
        'Salt & pepper'
      ],
      'instructions': [
        'Cook macaroni.',
        'Make roux with butter & flour; add milk.',
        'Stir in cheese until smooth; mix with pasta.',
        'Bake until bubbly, if desired.'
      ]
    },
    'BBQ Ribs': {
      'ingredients': [
        'Pork ribs',
        'BBQ sauce',
        'Salt & pepper'
      ],
      'instructions': [
        'Season ribs; bake at 300°F covered for 2.5 hours.',
        'Brush with BBQ sauce; broil 10 minutes to caramelize.'
      ]
    },
    'Pancakes': {
      'ingredients': [
        '1½ cups flour',
        '1 cup milk',
        '1 egg',
        '2 tsp baking powder',
        '2 tbsp sugar',
        'Butter for cooking'
      ],
      'instructions': [
        'Mix ingredients into batter.',
        'Cook on skillet until golden each side.',
        'Serve warm with syrup or fruit.'
      ]
    }
  };

  @override
  Widget build(BuildContext context) {
    final data = mealDetails[mealName];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(mealName),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        child: data == null
            ? Center(
          child: Text(
            'Details not available.',
            style: TextStyle(fontSize: 18, color: Colors.deepPurple.shade800),
          ),
        )
            : ListView(
          children: [
            Text(
              '🧂 Ingredients',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple.shade900,
              ),
            ),
            const SizedBox(height: 12),
            ...data['ingredients']!.map(
                  (ing) => Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_outline, color: Colors.deepPurple),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          ing,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '👨‍🍳 Instructions',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple.shade900,
              ),
            ),
            const SizedBox(height: 12),
            ...data['instructions']!.asMap().entries.map(
                  (entry) {
                final index = entry.key + 1;
                final step = entry.value;
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.deepPurple.shade200,
                          child: Text(
                            '$index',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            step,
                            style: const TextStyle(fontSize: 16, height: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}