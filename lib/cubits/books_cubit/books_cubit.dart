import 'dart:developer';
import 'dart:ffi';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/apis/api_service.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/model/book_cart_model.dart';
import 'package:graduation_project/model/book_model.dart';
import 'package:graduation_project/view/bookmarks_view.dart';
import 'package:graduation_project/view/cart_view.dart';
import 'package:graduation_project/view/discover_bookd_view.dart';
import 'package:graduation_project/view/home.dart';
import 'package:graduation_project/view/settings_view.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';
part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitialState());
//home navbar
  int currentIndex = 0;
  List screens = [
    Home(),
    DiscoverBookView(),
    BookmarkView(),
    CartView(),
    const SettingsView(),
  ];
  List<BookModel> newsBooks = [];
  List<BookModel> allBooks = [];
  List<BookModel> searchedBook = [];
  List<BookCartModel> cartList = [];
  BookModel? viewBookPage;
//bottom nav bar controller
  void changeScreen(int i) {
    currentIndex = i;
    emit(BooksInitialState());
  }

// button of view all books navigator to page 2
  void viewAllButton() {
    currentIndex = 1;
    emit(BooksInitialState());
  }

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

//Hive flutter
  void addToFavBook(BookModel book) async {
    Box<BookModel> box = await Hive.box<BookModel>('books');

    if (box.containsKey(book.title)) {
      emit(BooksAddBeforeMsgState(errMsg: 'This book has been added before.'));
      emit(BooksInitialState());
    } else {
      box.put(book.title, book);
    }
  }

  void deleteAllbookmarks() async {
    Box<BookModel> box = await Hive.box<BookModel>('books');
    box.clear();
  }

  void deleteSpecificBookFromBookmark(int index) async {
    Box<BookModel> box = await Hive.box<BookModel>('books');
    box.deleteAt(index);
  }

  void changeLanguage() {
    if (sharedPreferences == null) {
      sharedPreferences!.setString('locale', 'en');
    } else if (sharedPreferences!.getString('locale') == 'en') {
      sharedPreferences!.setString('locale', 'ar');
    } else {
      sharedPreferences!.setString('locale', 'en');
    }
    log('changed lang');
    emit(ChangeLanguageState());
  }
}
