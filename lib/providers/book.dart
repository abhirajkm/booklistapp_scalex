import 'package:booklistingapp/interface/book.dart';
import 'package:booklistingapp/models/book.dart';
import 'package:flutter/cupertino.dart';

class BookProvider with ChangeNotifier {
  final List<Book> _books = [];
  List<Book> searchBook = <Book>[];

  List<Book> get books => _books;
  String? searchQuery;

  setSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }

  Future<List<Book>> fetchSearchResult(String query) async {
    searchBook.clear();
    searchQuery = "";
    if (searchBook.isEmpty) {
      final data = await BookInterface.fetchSearch(query: query);
      searchBook.addAll(data);
      notifyListeners();
    }
    return searchBook;
  }

  Future<List<Book>> fetchBook() async {
    _books.clear();
    if (searchBook.isEmpty) {
      final data = await BookInterface.fetchBook();
      _books.addAll(data);
      notifyListeners();
    }
    return _books;
  }
}
