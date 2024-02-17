/*import 'dart:convert';

import 'package:flutter_application_1/models/fav_hotel.dart';
import 'package:http/http.dart' as http;

Future<List<Hotel>> fetchHotels(String location, double budget) async {
  final response = await http.post(
    Uri.parse('https://worldwide-hotels.p.rapidapi.com/search'),
    body: {
      'location': location,
      'budget': budget.toString(),
    },
  );

  if (response.statusCode == 200) {
    // Parse response data and extract relevant hotel information
    // Assuming response is in JSON format
    final List<dynamic> data = json.decode(response.body);
    List<Hotel> hotels = data.map((item) {
      return Hotel(
        name: item['name'],
        location: item['location'],
        price: double.parse(item['price']),
        images: List<String>.from(item['images']),
        description: item['description'],
      );
    }).toList();

    return hotels;
  } else {
    throw Exception('Failed to load hotels');
  }
}*/
