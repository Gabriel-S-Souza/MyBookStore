import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../commom/domain/entities/dto/user_store_info_dto.dart';
import '../../../../commom/presentation/text_field_widget.dart';
import '../../../../commom/presentation/widgets/elevate_button_widget.dart';
import '../../../../commom/presentation/widgets/header_screen_widget.dart';

class RegisterBookScreen extends StatefulWidget {
  final UserStoreInfoDTO userStoreInfoDTO;
  const RegisterBookScreen({
    super.key,
    required this.userStoreInfoDTO,
  });

  @override
  State<RegisterBookScreen> createState() => _RegisterBookScreenState();
}

class _RegisterBookScreenState extends State<RegisterBookScreen> {
  final TextEditingController _bannerController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _sinopsisController = TextEditingController();
  final TextEditingController _publishYearController = TextEditingController();

  bool available = true;
  final double rating = 3.0;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: const HeaderScreenWidget(
            title: 'Cadastrar livro',
            fontSize: 20,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Imagem da capa',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 16),
                    child: TextFieldWidget(
                      controller: _bannerController..text = 'imageBase64',
                      readOnly: true,
                    ),
                  ),
                  const Text(
                    'Título',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 16),
                    child: TextFieldWidget(
                      controller: _titleController,
                    ),
                  ),
                  const Text(
                    'Autor',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 16),
                    child: TextFieldWidget(
                      controller: _authorController,
                    ),
                  ),
                  const Text(
                    'Sinopse',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 16),
                    child: TextFieldWidget(
                      controller: _sinopsisController,
                    ),
                  ),
                  const Text(
                    'Ano de publicação',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 16),
                    child: TextFieldWidget(
                      controller: _publishYearController,
                    ),
                  ),
                  const Text(
                    'Rating',
                  ),
                  RatingBar.builder(
                    initialRating: 3.0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Status',
                  ),
                  Row(
                    children: [
                      Switch(
                        value: available,
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (bool value) {
                          setState(() {
                            available = value;
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      Text(
                        available ? 'Em estoque' : 'Sem estoque',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButtonWidget(
                      onPressed: () {},
                      text: 'Salvar',
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      );
}
