import 'package:flutter/material.dart';

import '../../../../commom/presentation/widgets/elevate_button_widget.dart';
import '../../../../commom/presentation/widgets/text_field_widget.dart';
import '../../domain/entities/search_params_entity.dart';

class FilterDialogComponent extends StatelessWidget {
  final TextEditingController? titleController;
  final TextEditingController? authorController;
  final int idStore;
  final void Function(SearchParamsEntity params) onFilter;
  const FilterDialogComponent({
    super.key,
    this.titleController,
    this.authorController,
    required this.onFilter,
    required this.idStore,
  });

  @override
  Widget build(BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 32),
                  const Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Filtrar',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Título',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: TextFieldWidget(
                        controller: titleController,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Autor',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: TextFieldWidget(
                        controller: authorController,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButtonWidget(
                text: 'Filtrar',
                onPressed: () {
                  final params = SearchParamsEntity(
                    idStore: idStore,
                    title: titleController?.text,
                    author: authorController?.text,
                  );
                  onFilter(params);
                  titleController?.clear();
                  authorController?.clear();
                },
              )
            ],
          ),
        ),
      );
}
