import 'package:flutter/material.dart';

import '../models/book.dart';
import 'buttons/button.dart';
import 'customTitle.dart';

class CustomCard extends StatefulWidget {
  final Book book;

  const CustomCard({
    super.key,
    required this.book,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.withOpacity(.2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://covers.openlibrary.org/b/id/${widget.book.coverId}-M.jpg",
            fit: BoxFit.cover,
            height: 150,
            width: 150,
          ),
          CustomTitle(
            title: 'Title : ',
            subtitle: widget.book.title,
          ),
          CustomTitle(
            title: 'Author : ',
            subtitle: widget.book.author.toString(),
          ),
          CustomTitle(
            title: 'Published : ',
            subtitle: widget.book.publishYear.toString(),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Button(
              onPressed: () {
                setState(() {
                  isRead = !isRead;
                });
              },
              title: isRead ? "Read" : "Unread",
              color: isRead ? Colors.green : Colors.transparent,
              titleColor: isRead ? Colors.white : Colors.black,
              borderColor: isRead ? Colors.transparent : Colors.black,
              radius: 15,
              loading: false,
              height: 50,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
