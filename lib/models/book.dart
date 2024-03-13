class Book {
  late int coverId;
  late String title;
  late List<String>? author;
  late List<int>? publishYear;

  Book.fromJson(Map<String, dynamic> json)
      : coverId = json["cover_i"] ?? 0,
        title = json["title"] ?? "",
        author = json['author_name'].cast<String>() ?? [],
        publishYear = json['publish_year'].cast<int>() ?? [];

  static List<Book> convertToList(List<dynamic> list) {
    return list.map((e) => Book.fromJson(e)).toList();
  }
}
