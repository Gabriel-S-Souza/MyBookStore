import '../../domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  BookModel({
    super.id,
    super.idStore,
    required super.title,
    required super.author,
    required super.synopsis,
    required super.imgage,
    required super.year,
    required super.rating,
    required super.available,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json['id'],
        idStore: json['idStore'],
        title: json['title'],
        author: json['author'],
        synopsis: json['synopsis'],
        imgage: json['cover'],
        year: json['year'],
        rating: json['rating'],
        available: json['available'],
      );
  factory BookModel.fromEntity(BookEntity entity) => BookModel(
        id: entity.id,
        idStore: entity.idStore,
        title: entity.title,
        author: entity.author,
        synopsis: entity.synopsis,
        imgage: entity.imgage,
        year: entity.year,
        rating: entity.rating,
        available: entity.available,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'author': author,
        'synopsis': synopsis,
        'cover': imgage,
        'year': year,
        'rating': rating,
        'available': available,
      };
}
