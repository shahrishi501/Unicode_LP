class NearbyPlaceModel {
  final String image;
  final String name;
  final String company;
  NearbyPlaceModel({
    required this.image,
    required this.name,
    required this.company
  });
}

List<NearbyPlaceModel> nearbyPlaces = [
  NearbyPlaceModel(
    image: "assets/York Hotel.png",
     name: "York Hotel",
    company: "Air BnB"
     ),
  NearbyPlaceModel(
      image: "assets/The grand hyaat.png",
       name: "The Grand Hyatt",
       company: "Trivago"
       ),
  NearbyPlaceModel(
    image: "assets/The fort.png", 
    name: "The Fort",
    company: "Trip Advisor"
    ),
  NearbyPlaceModel(
    image: "assets/st annes.jpg", 
   name: "St Annes",
   company: "MakeMyTrip"
   ),
  NearbyPlaceModel(
    image: "assets/Park_Hotel.png",
     name: "Park Hotel",
     company: "Oyo"
     ),
];
