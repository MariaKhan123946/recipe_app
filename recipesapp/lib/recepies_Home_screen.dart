import 'package:flutter/material.dart';
import 'package:recipesapp/receipes/resepiesModel.dart';
import 'package:recipesapp/receipes/services.dart';

import 'receipes/detail_screen.dart';

class RecipesHomeScreen extends StatefulWidget {
  const RecipesHomeScreen({Key? key}) : super(key: key);

  @override
  State<RecipesHomeScreen> createState() => _RecipesHomeScreenState();
}

class _RecipesHomeScreenState extends State<RecipesHomeScreen> {
  List<Recipe> recipesList = [];

  @override
  void initState() {
    super.initState();
    // Call the function to fetch recipes when the widget initializes
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    try {
      // Fetch recipes from the API
      List<Recipe> recipes = await recipesItems();

      setState(() {
        // Update the state with fetched recipes
        recipesList = recipes;
      });
    } catch (e) {
      // Handle any errors that occur during the API call
      print('Error fetching recipes: $e');
      // Optionally display an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes App from API'),
      ),
      body: ListView.builder(
        itemCount: recipesList.length,
        itemBuilder: (context, index) {
          final Recipe recipe = recipesList[index];

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailScreen(recipe: recipe,),));
                // Handle recipe item tap (e.g., navigate to recipe details screen)
              },
              child: Stack(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(recipe.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              recipe.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  recipe.rating.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text(recipe.cookTimeMinutes.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 10,
                                    color: Colors.white,



                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text('min',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 10,
                                    color: Colors.white,



                                  ),
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
