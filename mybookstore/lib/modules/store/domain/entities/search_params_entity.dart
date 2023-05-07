import 'dart:developer';

class SearchParamsEntity {
  final int idStore;
  final String? title;
  final String? author;
  final int? limit;
  final int? offset;
  final int? yearStart;
  final int? yearFinish;
  final int? rating;
  final bool? available;

  SearchParamsEntity({
    required this.idStore,
    required this.title,
    required this.author,
    this.limit,
    this.offset,
    this.yearStart,
    this.yearFinish,
    this.rating,
    this.available,
  });

  factory SearchParamsEntity.empty(int idStore) => SearchParamsEntity(
        idStore: idStore,
        title: '',
        author: '',
        limit: 0,
        offset: 0,
        yearStart: 0,
        yearFinish: 0,
        rating: 0,
        available: false,
      );

  bool get isEmpty => this == SearchParamsEntity.empty(idStore);

  String get queryParams {
    final queryParams = <String>[];

    if (title != null && title!.isNotEmpty) {
      queryParams.add('title=$title');
    }
    if (author != null && author!.isNotEmpty) {
      queryParams.add('author=$author');
    }
    if (limit != null && limit! > 0) {
      queryParams.add('limit=$limit');
    }
    if (offset != null && offset! > 0) {
      queryParams.add('offset=$offset');
    }
    if (yearStart != null && yearStart! > 0) {
      queryParams.add('yearStart=$yearStart');
    }
    if (yearFinish != null && yearFinish! > 0) {
      queryParams.add('yearFinish=$yearFinish');
    }
    if (rating != null && rating! > 0) {
      queryParams.add('rating=$rating');
    }
    if (available != null) {
      queryParams.add('available=$available');
    }

    final String paramsResult = queryParams.join('&');
    log('queryParams: $paramsResult');
    return paramsResult;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchParamsEntity &&
        other.idStore == idStore &&
        other.title == title &&
        other.author == author &&
        other.limit == limit &&
        other.offset == offset &&
        other.yearStart == yearStart &&
        other.yearFinish == yearFinish &&
        other.rating == rating &&
        other.available == available;
  }

  @override
  int get hashCode =>
      idStore.hashCode ^
      title.hashCode ^
      author.hashCode ^
      limit.hashCode ^
      offset.hashCode ^
      yearStart.hashCode ^
      yearFinish.hashCode ^
      rating.hashCode ^
      available.hashCode;
}
