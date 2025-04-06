// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `welcome back ,`
  String get welcome_back_ {
    return Intl.message(
      'welcome back ,',
      name: 'welcome_back_',
      desc: '',
      args: [],
    );
  }

  /// `what do you want to read today?`
  String get what_do_you_want {
    return Intl.message(
      'what do you want to read today?',
      name: 'what_do_you_want',
      desc: '',
      args: [],
    );
  }

  /// `For you`
  String get For_you {
    return Intl.message(
      'For you',
      name: 'For_you',
      desc: '',
      args: [],
    );
  }

  /// `New arrivals`
  String get New_arrivals {
    return Intl.message(
      'New arrivals',
      name: 'New_arrivals',
      desc: '',
      args: [],
    );
  }

  /// `view all`
  String get view_all {
    return Intl.message(
      'view all',
      name: 'view_all',
      desc: '',
      args: [],
    );
  }

  /// `Discover books`
  String get Discover_books {
    return Intl.message(
      'Discover books',
      name: 'Discover_books',
      desc: '',
      args: [],
    );
  }

  /// `search by book or author`
  String get search_by_book_or_author {
    return Intl.message(
      'search by book or author',
      name: 'search_by_book_or_author',
      desc: '',
      args: [],
    );
  }

  /// `Bookmarks`
  String get Bookmarks {
    return Intl.message(
      'Bookmarks',
      name: 'Bookmarks',
      desc: '',
      args: [],
    );
  }

  /// `Cart is empty`
  String get Cart_is_empty {
    return Intl.message(
      'Cart is empty',
      name: 'Cart_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get Cart {
    return Intl.message(
      'Cart',
      name: 'Cart',
      desc: '',
      args: [],
    );
  }

  /// `Amount price`
  String get Amount_price {
    return Intl.message(
      'Amount price',
      name: 'Amount_price',
      desc: '',
      args: [],
    );
  }

  /// `Check out`
  String get Check_out {
    return Intl.message(
      'Check out',
      name: 'Check_out',
      desc: '',
      args: [],
    );
  }

  /// `contact details`
  String get contact_details {
    return Intl.message(
      'contact details',
      name: 'contact_details',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `mobile No`
  String get mobile_No {
    return Intl.message(
      'mobile No',
      name: 'mobile_No',
      desc: '',
      args: [],
    );
  }

  /// `Address details`
  String get Address_details {
    return Intl.message(
      'Address details',
      name: 'Address_details',
      desc: '',
      args: [],
    );
  }

  /// `city`
  String get city {
    return Intl.message(
      'city',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `No of item`
  String get No_of_item {
    return Intl.message(
      'No of item',
      name: 'No_of_item',
      desc: '',
      args: [],
    );
  }

  /// `Order now`
  String get Order_now {
    return Intl.message(
      'Order now',
      name: 'Order_now',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get Change_language {
    return Intl.message(
      'Change language',
      name: 'Change_language',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get Log_out {
    return Intl.message(
      'Log out',
      name: 'Log_out',
      desc: '',
      args: [],
    );
  }

  /// `About the book`
  String get About_the_book {
    return Intl.message(
      'About the book',
      name: 'About_the_book',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get Add_to_cart {
    return Intl.message(
      'Add to cart',
      name: 'Add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Read details`
  String get Read_details {
    return Intl.message(
      'Read details',
      name: 'Read_details',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get Overviw {
    return Intl.message(
      'Overview',
      name: 'Overviw',
      desc: '',
      args: [],
    );
  }

  /// `share`
  String get share {
    return Intl.message(
      'share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `delete`
  String get delete {
    return Intl.message(
      'delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `no`
  String get no {
    return Intl.message(
      'no',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `suer want to delete all bookmarks`
  String get sure_want_to_delet_bookmark {
    return Intl.message(
      'suer want to delete all bookmarks',
      name: 'sure_want_to_delet_bookmark',
      desc: '',
      args: [],
    );
  }

  /// `address(house no,building no, street)`
  String get address_house_building {
    return Intl.message(
      'address(house no,building no, street)',
      name: 'address_house_building',
      desc: '',
      args: [],
    );
  }

  /// `sure want to delte all cart`
  String get sure_want_to_delete_allcart {
    return Intl.message(
      'sure want to delte all cart',
      name: 'sure_want_to_delete_allcart',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
