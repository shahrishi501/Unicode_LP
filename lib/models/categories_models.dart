class CategoriesModel {
  final String name;
  final String image;
  CategoriesModel({
    required this.name,
    required this.image,
  });
}

List<CategoriesModel> touristPlaces = [
  CategoriesModel(name: "Mountain", image: "assets/mountain.png"),
  CategoriesModel(name: "Beach", image: "assets/beach.png"),
  CategoriesModel(name: "Forest", image: "assets/forest.png"),
  CategoriesModel(name: "City", image: "assets/city.png"),
  CategoriesModel(name: "Desert", image: "assets/desert.png"),
];