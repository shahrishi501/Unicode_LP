// hotel_model.dart
class Hotel {
  String name;
  String location;
  double price;
  List<String> images;
  String description;

  Hotel({
    required this.name,
    required this.location,
    required this.price,
    required this.images,
    required this.description,
  });
}
