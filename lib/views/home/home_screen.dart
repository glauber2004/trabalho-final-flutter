
import 'package:flutter/material.dart';
import '../../models/book.dart';
import '../../services/book_service.dart';
import '../../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  final BookService bookService = BookService();

  Color getColor(ReadingStatus status) {
    switch (status) {
      case ReadingStatus.lido:
        return Colors.green;
      case ReadingStatus.lendo:
        return Colors.yellow;
      case ReadingStatus.naoLido:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final books = bookService.getBooks();

    return Scaffold(
      appBar: AppBar(title: Text('Lista de Livros')),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (_, index) {
          final book = books[index];
          return Card(
            color: getColor(book.status).withOpacity(0.2),
            child: ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              trailing: Icon(Icons.book, color: getColor(book.status)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addBook);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
