import 'package:booklistingapp/providers/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderTree {
  static List<SingleChildWidget> get(BuildContext context) {
    return [
      ChangeNotifierProvider.value(value: BookProvider()),
    ];
  }
}
