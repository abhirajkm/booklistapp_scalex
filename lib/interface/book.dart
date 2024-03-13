import 'package:booklistingapp/models/book.dart';

import '../api/api_methods.dart';
import '../api/api_request.dart';

class BookInterface {
  static Future<List<Book>> fetchSearch({String? query}) async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        route: 'search.json?title=$query',
      );
      return Book.convertToList(response["docs"]);
    } catch (err) {
      print("fetching book error: $err");
      return [];
    }
  }

  static Future<List<Book>> fetchBook() async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        route: 'search.json?title=zara',
      );
      return Book.convertToList(response["docs"]);
    } catch (err) {
      print("fetching book error: $err");
      return [];
    }
  }
}
