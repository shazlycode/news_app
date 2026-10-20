class Category {
  final String? name;
  final String? image;

  Category({this.name, this.image});
  static const String imagePath = "assets/images/";

  static List<Category> categories = [
    Category(name: "Technology", image: "${imagePath}technology.png"),
    Category(name: "Business", image: "${imagePath}business.png"),
    Category(name: "Entertainment", image: "${imagePath}entertainment.png"),
    Category(name: "Finance", image: "${imagePath}finance.png"),
    Category(name: "Health", image: "${imagePath}health.png"),
    Category(name: "Politics", image: "${imagePath}politics.png"),
    Category(name: "Sports", image: "${imagePath}sport.png"),
    Category(name: "General", image: "${imagePath}world.png"),
  ];
}
