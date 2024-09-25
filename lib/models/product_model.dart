
class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final RatingModel? rating;
  final String category;
  ProductModel(
      {required this.id,
      required this.description,
      required this.image,
      required this.price,
      required this.category,
      required this.title,
      required this.rating});

  factory ProductModel.fromjson(jsonData) {
    return ProductModel(
        id:jsonData['id'],
        title: jsonData['title'],
        category: jsonData['category'],
        price: jsonData['price'],
        description: jsonData['description'],
        image: jsonData['image'],
        rating: jsonData['rating'] == null
            ? null
            : RatingModel.fromjson(jsonData['rating']));
  }
}

class RatingModel {
  final dynamic rate;
  final int count;
  RatingModel({required this.count, required this.rate});
  factory RatingModel.fromjson(jsonData) {
    return RatingModel(count: jsonData['count'], rate: jsonData['rate']);
  }
}
