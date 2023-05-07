import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../commom/presentation/text_field_widget.dart';
import '../../../../commom/presentation/widgets/elevate_button_widget.dart';
import '../../../../commom/presentation/widgets/outlined_button_widget.dart';
import '../../../../core/di/service_locator_imp.dart';
import '../../../../core/routes/route_names.dart';
import '../../domain/entities/credentials_entity.dart';
import '../cubits/email/login_cubit.dart';
import '../cubits/email/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, this.addPostFrameCallback}) : super(key: key);
  final VoidCallback? addPostFrameCallback;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _loginCubit = ServiceLocatorImp.I.get<LoginCubit>();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: BlocProvider<LoginCubit>(
            create: (context) => _loginCubit,
            child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
              if (state.isLoading == true) {
                return const Center(child: CircularProgressIndicator());
              }

              return Center(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16),
                    children: [
                      const Text(
                        'MyBookStore',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Nome',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFieldWidget(
                        controller: _userController,
                        validator: validateUsername,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Senha',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFieldWidget(
                        controller: _passwordController,
                        obscureText: false,
                        validator: validatePassword,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButtonWidget(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await _loginCubit.login(
                              CredentialsEntity(
                                username: _userController.text,
                                password: _passwordController.text,
                              ),
                            );

                            if (_loginCubit.state.isLogged == true && mounted) {
                              Navigator.of(context).pushReplacementNamed(
                                RouteNames.home,
                                arguments: _loginCubit.state.userStoreInfoDTO,
                              );
                            } else if (_loginCubit.state.isLogged == false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(_loginCubit.state.errorMessage ?? 'Erro ao logar'),
                                ),
                              );
                            }
                          }
                        },
                        text: 'Entrar',
                      ),
                      OutlinedButtonWidget(
                        onPressed: () => Navigator.of(context).pushNamed(RouteNames.registerStore),
                        text: 'Cadastrar minha loja',
                      ),
                    ],
                  ),
                ),
              );
            }),
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

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'O username é obrigatório';
    }

    return null;
  }
}
