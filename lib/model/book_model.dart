class BookModel {
  final String title;
  final String subTitle;
  final String price;
  final String image;
  final String url;

  BookModel({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.url,
    required this.price,
  });

  factory BookModel.fromJson(Map<String, dynamic> jsonData) {
    return BookModel(
      title: jsonData['title'],
      subTitle: jsonData['subtitle'],
      image: jsonData['image'],
      url: jsonData['url'],
      price: jsonData['price'],
    );
  }
}
