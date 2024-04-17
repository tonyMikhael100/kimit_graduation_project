import 'dart:developer';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:graduation_project/apis/api_service.dart';
import 'package:graduation_project/model/book_cart_model.dart';
import 'package:graduation_project/model/book_model.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';
part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitialState());
  List<BookModel> newsBooks = [];
  List<BookModel> allBooks = [];
  List<BookModel> searchedBook = [];
  List<BookCartModel> cartList = [];
  BookModel? viewBookPage;

  void getNewAndAllBooks() async {
    emit(BooksLoadingState());
    newsBooks = await ApiService().getNewBooks();
    allBooks = await ApiService().getBookByAuthorOrName(searchKey: 'ai');
    emit(BooksInitialState());
    if (newsBooks.isEmpty) {
      emit(BooksFailureState());
    }
  }

  void getBookByNameOrAuthor({required String key}) async {
    emit(BooksLoadingState());
    searchedBook = await ApiService().getBookByAuthorOrName(searchKey: key);
    emit(BooksSearchedState());
    if (searchedBook.isEmpty) {
      emit(BooksInitialState());
    }
  }

  Future<void> launchUrlInWebView({required String url}) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableDomStorage: false),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void addToCart(BookModel bookmodel) {
    cartList.add(
      BookCartModel(book: bookmodel, count: 1),
    );
  }

  void addItem(int index) {
    cartList[index].count++;
    emit(BooksAddOrMinusItemState());
  }

  void minusItem(int index) {
    if (cartList[index].count > 1) {
      cartList[index].count--;
    }
    emit(BooksAddOrMinusItemState());
  }

  void deleteAllCart() {
    cartList.clear();
    emit(BooksDeleteAllCartState());
  }

  void deleteItemFromCart(int index) {
    cartList.removeAt(index);
    emit(BooksDeleteBookState());
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (BookCartModel item in cartList) {
      // Remove any characters that are not digits or a decimal point.
      // log(item.price);
      String cleanPrice = item.book.price.replaceAll(RegExp(r'[^0-9.]'), '');

      double price = double.parse(cleanPrice);
      total += price * item.count;
    }
    return total.floorToDouble();
  }

  int getTotalCountOfItem() {
    int totalCount = 0;

    for (int i = 0; i < cartList.length; i++) {
      totalCount += cartList[i].count;
    }
    return totalCount;
  }
}
