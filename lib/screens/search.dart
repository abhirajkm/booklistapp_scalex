import 'package:booklistingapp/providers/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/custom_card.dart';
import '../models/book.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/search";

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Book> searchResult = [];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
              color: Colors.white,
            ),
          ),
          title: const Text(
            "Search Your Book Here",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<BookProvider>(builder: (context, value, child) {
              return Column(
                children: [
                  _searchBar(),
                  value.searchQuery == ""
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return CustomCard(
                                book: value.searchBook[index],
                              );
                            },
                            itemCount: value.searchBook.length > 30
                                ? 30
                                : value.searchBook.length,
                          ),
                        ),
                ],
              );
            }),
          ),
        ));
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        autofocus: false,
        onChanged: (searchText) async {
          searchText = searchText.toLowerCase();

          setState(() {
            final provider = Provider.of<BookProvider>(context, listen: false);
            provider.fetchSearchResult(searchText);
            provider.setSearchQuery(searchText);
          });
        },
        // controller: _textController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search ',
        ),
      ),
    );
  }
}
