
import '../models/book.dart';

class BookService {
  final List<Book> _books = [];

  List<Book> getBooks() => _books;

  void addBook(Book book) {
    _books.add(book);
  }
}
