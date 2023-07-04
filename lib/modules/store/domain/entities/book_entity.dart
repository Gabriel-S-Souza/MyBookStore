class BookEntity {
  final int id;
  final int idStore;
  final String title;
  final String author;
  final String synopsis;
  final String imgage;
  final int year;
  final int rating;
  final bool available;

  BookEntity({
    this.id = 0,
    this.idStore = 0,
    required this.title,
    required this.author,
    required this.synopsis,
    required this.imgage,
    required this.year,
    required this.rating,
    required this.available,
  });
}
