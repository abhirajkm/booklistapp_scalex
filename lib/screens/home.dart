import 'package:booklistingapp/providers/book.dart';
import 'package:booklistingapp/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_card.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  const HomeScreen({
    super.key,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          "Book Listing App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.routeName);
              },
              icon: const Icon(
                Icons.search_sharp,
                size: 35,
                color: Colors.white,
              )),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future:
                Provider.of<BookProvider>(context, listen: false).fetchBook(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 300),
                    child: const CircularProgressIndicator());
              }

              return Consumer<BookProvider>(builder: (context, value, child) {
                final book = value.books;
                return Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: book.map((e) => CustomCard(book: e)).toList(),
                  ),
                );
              });
            }),
      ),
    );
  }
}
