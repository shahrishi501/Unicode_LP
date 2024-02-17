import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/fav_hotel.dart';
import 'package:flutter_application_1/widgets/details.dart';

class HotelList extends StatelessWidget {
  final List<Hotel> hotels;

  HotelList({required this.hotels});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hotels.length,
      itemBuilder: (context, index) {
        final hotel = hotels[index];
        return ListTile(
          title: Text(hotel.name),
          subtitle: Text(hotel.location),
          trailing: Text('\$${hotel.price}'),
          // Implement onTap to navigate to hotel details page
          // and handle adding favorites
          onTap: () {
            // Navigate to details page
            DetailsPage();
          },
        );
      },
    );
  }
}
