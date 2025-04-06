part of 'books_cubit.dart';

@immutable
sealed class BooksState {}

final class BooksInitialState extends BooksState {}

final class BooksLoadingState extends BooksState {}

final class BooksFailureState extends BooksState {}

final class BooksNoSearchState extends BooksState {}

final class BooksSearchedState extends BooksState {}

final class BooksAddOrMinusItemState extends BooksState {}

final class BooksDeleteAllCartState extends BooksState {}

final class BooksDeleteBookState extends BooksState {}

//Hive
final class BooksAddBeforeMsgState extends BooksState {
  String errMsg;
  BooksAddBeforeMsgState({required this.errMsg});
}

final class BooksAddToDbSuccessfully extends BooksState {}
//locale
final class ChangeLanguageState extends BooksState {}
