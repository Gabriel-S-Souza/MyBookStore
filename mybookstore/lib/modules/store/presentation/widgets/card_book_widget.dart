import 'package:flutter/material.dart';

import '../../domain/entities/book_entity.dart';

class CardBookWidget extends StatelessWidget {
  final BookEntity book;
  final VoidCallback? onTap;

  const CardBookWidget({
    super.key,
    required this.book,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onTap: onTap,
          // TODO: integrate with BookEntity.image
          leading: const Icon(Icons.book),
          title: Text(book.title),
          subtitle: Text(book.author),
          trailing: Column(
            children: [
              Text(book.year.toString()),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 4),
                  Text(book.rating.toString()),
                ],
              ),
            ],
          ),
        ),
      );
}
