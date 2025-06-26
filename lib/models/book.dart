
class Book {
  final String title;
  final String author;
  final String description;
  final String? imagePath;
  final ReadingStatus status;

  Book({
    required this.title,
    required this.author,
    required this.description,
    this.imagePath,
    this.status = ReadingStatus.naoLido,
  });
}

enum ReadingStatus {
  lido,
  lendo,
  naoLido,
}
