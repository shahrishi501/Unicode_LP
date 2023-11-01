import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/nearby.dart';
import 'package:flutter_application_1/widgets/popular_destinations.dart';
import 'package:flutter_application_1/widgets/categories.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          
          backgroundColor: Colors.white,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          items: [
            
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.flight), label: "Explore"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite, ), label: "Liked"),
            BottomNavigationBarItem(icon: CircleAvatar(backgroundImage: AssetImage("assets/836.jpg"), radius: 15, ), label: "Profile")
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 50.0,horizontal: 10),
                    child: Text('Welcome Explorer',style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),),
                  ),
        
                    
                  
                  SizedBox(width: 30,),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/836.jpg'),
        
                    ),
                  ),
                      
                  ],),
        
                Padding(
                  padding: EdgeInsets.only(right: 20,left: 10),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(30),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search hotels...',
                        suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.filter_alt_sharp)),
                        suffixIconColor: Colors.teal,
                        prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search_sharp)),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                  SizedBox(height: 30,),
                  Categories(),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                    "Popular Destinations",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,letterSpacing: 1.5),
                      ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.teal,
                        letterSpacing: 1.0),
                  )
                ],
              ),
            ),
            
          ],
            ),
              const SizedBox(height: 10,),
              const PopularDestinations(),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                      "Nearby from you",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,letterSpacing: 1.5),
                        ),
                    Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.teal,
                          letterSpacing: 1.0),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              const NearbyPlaces(),
            ],
          ),
        ),
      ),
    );
  }
}
