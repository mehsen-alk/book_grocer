import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';
import 'book_card.dart';

class BookCardList extends StatelessWidget {
  final List<Book> books;

  const BookCardList({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (_, index){
      return BookCard(book: books[index]);
    });
  }
}
