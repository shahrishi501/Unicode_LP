import 'dart:convert';



import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/hotel_model.dart';
import 'package:flutter_application_1/widgets/details.dart';
import 'package:flutter_application_1/widgets/categories.dart';
import 'package:http/http.dart' as http;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Data>? hotels = [];

  

  gethoteldata() async {
    try {
      var hoteldata = await http.post(
          Uri.parse('https://worldwide-hotels.p.rapidapi.com/search'),
          headers: {
            'content-type': 'application/x-www-form-urlencoded',
            'X-RapidAPI-Key':
                'd278b51b16msh5a666f1ae64cb62p1cd2dfjsnfbd3eb3861f3',
            'X-RapidAPI-Host': 'worldwide-hotels.p.rapidapi.com'
          },
          body: {
            'location_id': '45963',
            'language': 'en_US',
            'currency': 'USD',
            'offset': '0',
          });
      if (hoteldata.statusCode == 200) {
        var response = jsonDecode(hoteldata.body);
        print("Response: $response");

        Results? hotelResults = Results.fromJson(response['results']);
        // hotels = response.results.data;
        setState(() {
          hotels = hotelResults.data;
          // hotels = hotelResults.data
          //     ?.map((data) => HotelModel.fromJson(data.toJson()))
          //     .toList();
          print(hotels);
        });
      } else {
        print("Request failed with status: ${hoteldata.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    gethoteldata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Color.fromARGB(255, 78, 136, 143),
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Explore"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmark_sharp,
                  ),
                  label: "Liked"),
              BottomNavigationBarItem(
                  icon: CircleAvatar(
                    backgroundImage: AssetImage("assets/836.jpg"),
                    radius: 15,
                  ),
                  label: "Profile")
            ]),
        body: hotels!.isEmpty
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                              vertical: 50.0, horizontal: 10),
                          child: Text(
                            'Welcome Explorer',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4E888F),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/836.jpg'),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 10),
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(30),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search hotels...',
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.filter_alt_sharp)),
                              suffixIconColor: Color(0xFF4E888F),
                              prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.search_sharp)),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Categories(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Popular Destinations",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5),
                              ),
                              Text(
                                "See All",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF4E888F),
                                    letterSpacing: 1.0),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Popular Destinations
                    SizedBox(
                      height: 235,
                      child: Expanded(
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 220,
                                child: Card(
                                  elevation: 0.4,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsPage(
                                                  title: hotels![index].name,
                                                  location: hotels![index]
                                                      .locationString,
                                                  image: hotels![index]
                                                      .photo!
                                                      .images!
                                                      .original!
                                                      .url,
                                                  rate: hotels![index].rating,
                                                  prices: hotels![index].price,
                                                  addres:
                                                      hotels![index].address,
                                                )),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.network(
                                              "${hotels![index].photo!.images!.original!.url}",
                                              width: double.maxFinite,
                                              fit: BoxFit.cover,
                                              height: 150,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Container(
                                                width: 180,
                                                child: Text(
                                                  "${hotels![index].name}",
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),

                                              /*Icon(
                                          Icons.star,
                                          color: Colors.yellow.shade700,
                                          size: 14,
                                        ),
                                        const Text(
                                          "4.4",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )*/
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on_sharp,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  size: 16,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  "${hotels![index].locationString}",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                const Spacer(),
                                                IconButton(
                                                  color: Colors.red,
                                                  onPressed: () {
                                                  
                            
                                                    
                                                  },
                                                  icon: Icon(Icons
                                                      .favorite_border_sharp),
                                                  iconSize: 25,
                                                  padding:
                                                      EdgeInsets.only(left: 25),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                ),
                            itemCount: hotels!.length),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nearby from you",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5),
                          ),
                          Text(
                            "See All",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF4E888F),
                                letterSpacing: 1.0),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: List.generate(
                        hotels!.length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SizedBox(
                              height: 135,
                              width: double.maxFinite,
                              child: Card(
                                elevation: 0.4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                                title: hotels![index].name,
                                                location: hotels![index]
                                                    .locationString,
                                                image: hotels![index]
                                                    .photo!
                                                    .images!
                                                    .original!
                                                    .url,
                                                rate: hotels![index].rating,
                                                prices: hotels![index].price,
                                                addres: hotels![index].address,
                                              )),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.network(
                                            "${hotels![index].photo!.images!.original!.url}",
                                            height: double.maxFinite,
                                            width: 130,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${hotels![index].name}",
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "${hotels![index].ranking}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w200),
                                              ),
                                              const SizedBox(height: 10),
                                              const Spacer(),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        Colors.yellow.shade700,
                                                    size: 14,
                                                  ),
                                                  Text(
                                                    "${hotels![index].rating}",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    "${hotels![index].price}",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF4E888F),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
