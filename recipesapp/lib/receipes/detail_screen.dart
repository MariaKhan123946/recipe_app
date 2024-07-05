import 'package:flutter/material.dart';
import 'package:recipesapp/receipes/resepiesModel.dart';

 class DetailScreen extends StatelessWidget {
  final Recipe recipe;

  const DetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Stack(
          clipBehavior: Clip.none,
        children: [
        Image.network(recipe.image,
          fit: BoxFit.cover,
          height: 450,
          width: size.width,
        ),
        Padding(
          padding: MediaQuery.of(context).padding,
          child: Positioned(
        
              child:GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios),
              ) ),
        ),
        Positioned(
          bottom: -50,
          right: 30,
          left: 30,
          child: Container(
            height: 140,
            width: size.width,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 2,
              )],
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
        
        
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(recipe.name,style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(recipe.mealType[0],style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        ),
                        Text("&",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        ),
                        Text(recipe.cuisine,style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        ),
                      ],
                    ),
        
                  ],
                ),
                Container(
                  height: 55,
                  width: size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
        
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      Text(
                        recipe.rating.toString(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.timer,
                        color: Colors.blueAccent,
                      ),
                      Text(
                        '${recipe.cookTimeMinutes} mins',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.accessibility_sharp,
                        color: Colors.black,
                      ),
                      Text(
                        '${recipe.caloriesPerServing} cal',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
            // Recipe Details Container
                      ],
                    ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60,),
                Text('ingradients',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,

                ),),
                SizedBox(height: 10),
                // List of Ingredients
                Padding(
                  padding: const EdgeInsets.only(left: 15,top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(recipe.ingredients.length, (index) {
                      return Text(
                        '-${recipe.ingredients[index]}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60,),
                    Text('instructions',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,

                    ),),
                    SizedBox(height: 10),
                    // List of Ingredients
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(recipe.instructions.length, (index) {
                          return Text(
                            '-${recipe.instructions[index]}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 40,),
                  ],
                ),
              ],
            ),

              ],
            ),
      ),

    );
  }
}
