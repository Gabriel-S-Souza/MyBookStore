import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../commom/domain/entities/user_types/user_type.dart';
import '../../../../commom/presentation/widgets/elevate_button_widget.dart';
import '../../../../commom/presentation/widgets/header_screen_widget.dart';
import '../../../../commom/presentation/widgets/text_field_widget.dart';
import '../../../../core/di/service_locator_imp.dart';
import '../../../../core/routes/route_names.dart';
import '../../domain/entities/store_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../cubits/register_store/register_store_cubit.dart';
import '../cubits/register_store/register_store_state.dart';

class RegisterStoreScreen extends StatefulWidget {
  const RegisterStoreScreen({
    super.key,
  });

  @override
  State<RegisterStoreScreen> createState() => _RegisterStoreScreenState();
}

class _RegisterStoreScreenState extends State<RegisterStoreScreen> {
  final TextEditingController _bannerController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sloganController = TextEditingController();
  final TextEditingController _nameOwnerController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _ownerPhotoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final _registerStoreCubit = ServiceLocatorImp.I.get<RegisterStoreCubit>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _bannerController.dispose();
    _nameController.dispose();
    _sloganController.dispose();
    _nameOwnerController.dispose();
    _ownerPhotoController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: const HeaderScreenWidget(
            title: 'Minha loja',
            centerTitle: false,
            fontSize: 20,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: BlocProvider<RegisterStoreCubit>(
                create: (context) => _registerStoreCubit,
                child: BlocBuilder<RegisterStoreCubit, RegisterStoreState>(
                    builder: (context, state) => Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              const Text(
                                'Nome da loja',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 16),
                                child: TextFieldWidget(
                                  controller: _nameController,
                                  validator: validateName,
                                ),
                              ),
                              const Text(
                                'Slogan',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 16),
                                child: TextFieldWidget(
                                  controller: _sloganController,
                                  validator: validateSlogan,
                                ),
                              ),
                              const Text(
                                'Banner',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 16),
                                child: TextFieldWidget(
                                  controller: _bannerController..text = 'imageBase64',
                                  readOnly: true,
                                ),
                              ),
                              const Text(
                                'Nome do administrador',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 16),
                                child: TextFieldWidget(
                                  controller: _nameOwnerController,
                                  validator: validateName,
                                ),
                              ),
                              const Text(
                                'Username',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 16),
                                child: TextFieldWidget(
                                  controller: _userNameController,
                                  validator: validateUsername,
                                ),
                              ),
                              const Text(
                                'Foto do administrador',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 16),
                                child: TextFieldWidget(
                                  controller: _ownerPhotoController..text = 'imageBase64',
                                  readOnly: true,
                                ),
                              ),
                              const Text(
                                'Senha',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 16),
                                child: TextFieldWidget(
                                  controller: _passwordController,
                                  validator: validatePassword,
                                ),
                              ),
                              const Text(
                                'Repetir senha',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 16),
                                child: TextFieldWidget(
                                  controller: _confirmPasswordController,
                                  validator: validateConfirmePassword,
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButtonWidget(
                                  onPressed: () async {
                                    if (!_formKey.currentState!.validate()) {
                                      return;
                                    }

                                    final StoreEntity store = StoreEntity(
                                      banner: _bannerController.text,
                                      name: _nameController.text,
                                      slogan: _sloganController.text,
                                      user: UserEntity(
                                        name: _nameOwnerController.text,
                                        photo: _ownerPhotoController.text,
                                        password: _passwordController.text,
                                        username: _userNameController.text,
                                        type: UserType.admin,
                                      ),
                                    );

                                    await _registerStoreCubit.registerStore(store);

                                    if (_registerStoreCubit.state is RegisterStoreStateSuccess &&
                                        mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Loja cadastrada com sucesso!',
                                          ),
                                        ),
                                      );

                                      Navigator.of(context).pushReplacementNamed(RouteNames.home,
                                          arguments: (_registerStoreCubit.state
                                                  as RegisterStoreStateSuccess)
                                              .userStoreInfoDTO);
                                    } else if (_registerStoreCubit.state
                                            is RegisterStoreStateError &&
                                        mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            (state as RegisterStoreStateError).message,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  text: 'Salvar',
                                  child: state is RegisterStoreStateLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                              ),
                              const SizedBox(height: 32),
                            ],
                          ),
                        )),
              ),
            ),
          ),
        ),
      );

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'A senha é obrigatória';
    } else if (value.length <= 6) {
      return 'A senha deve ter mais de 6 caracteres';
    } else if (value.length > 10) {
      return 'A senha deve ter menos de 10 caracteres';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'A senha deve conter pelo menos uma letra maiúscula';
    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'A senha deve conter pelo menos um caractere especial';
    }

    return null;
  }

  String? validateConfirmePassword(String? value) {
    if (_passwordController.text != _confirmPasswordController.text) {
      return 'As senhas não são iguais';
    }

    return validatePassword(value);
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'O username é obrigatório';
    }

    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'O nome é obrigatório';
    }

    return null;
  }

  String? validateSlogan(String? value) {
    if (value == null || value.isEmpty) {
      return 'O slogan é obrigatório';
    }

    return null;
  }
}
