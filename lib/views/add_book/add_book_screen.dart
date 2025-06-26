
import 'package:flutter/material.dart';
import '../../models/book.dart';
import '../../services/book_service.dart';

class AddBookScreen extends StatelessWidget {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final descriptionController = TextEditingController();
  final BookService bookService = BookService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adição de Livro')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: InputDecoration(labelText: 'Título')),
            TextField(controller: authorController, decoration: InputDecoration(labelText: 'Autor')),
            TextField(controller: descriptionController, decoration: InputDecoration(labelText: 'Descrição')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newBook = Book(
                  title: titleController.text,
                  author: authorController.text,
                  description: descriptionController.text,
                );
                bookService.addBook(newBook);
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
