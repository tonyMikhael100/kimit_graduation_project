import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:graduation_project/model/book_model.dart';

class ApiService {
  final dio = Dio();
  Future<List<BookModel>> getNewBooks() async {
    List<BookModel> newsBooks = [];
    try {
      Response response = await dio.get('https://api.itbook.store/1.0/new');
      if (response.statusCode == 200) {
        for (int i = 0; i < response.data['books'].length; i++) {
          newsBooks.add(BookModel.fromJson(response.data['books'][i]));
        }
      
      }
    } on Exception catch (e) {
      Exception("there is an error on connection $e");
    }
    return newsBooks;
  }

  Future<List<BookModel>> getBookByAuthorOrName(
      {required String searchKey}) async {
    List<BookModel> searchedBooks = [];
    try {
      Response response =
          await dio.get('https://api.itbook.store/1.0/search/$searchKey');
      // print(response.data['books'].length);
      if (response.statusCode == 200) {
        for (int i = 0; i < response.data['books'].length; i++) {
          searchedBooks.add(BookModel.fromJson(response.data['books'][i]));
        }
        // print(searchedBooks);
      }
    } on Exception catch (e) {
      Exception("there is an error $e");
    }
    return searchedBooks;
  }
}
