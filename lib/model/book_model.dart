import 'package:hive_flutter/adapters.dart';

part 'book_model.g.dart';

@HiveType(typeId: 0)
class BookModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;
  @HiveField(2)
  final String price;
  @HiveField(3)
  final String image;
  @HiveField(4)
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
