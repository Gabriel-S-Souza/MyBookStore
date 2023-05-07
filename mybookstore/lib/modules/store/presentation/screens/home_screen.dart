import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../commom/domain/entities/dto/user_store_info_dto.dart';
import '../../../../commom/presentation/text_field_widget.dart';
import '../../../../commom/presentation/widgets/botton_nav_bar_widget.dart';
import '../../../../commom/presentation/widgets/header_screen_widget.dart';
import '../../../../commom/presentation/widgets/loading_widget.dart';
import '../../../../core/di/service_locator_imp.dart';
import '../../../../core/routes/route_names.dart';
import '../cubits/home/home_cubit.dart';
import '../cubits/home/home_state.dart';
import '../widgets/card_book_widget.dart';

class HomeScreen extends StatefulWidget {
  final UserStoreInfoDTO userStoreInfoDTO;
  const HomeScreen({super.key, required this.userStoreInfoDTO});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final _homeCubit = ServiceLocatorImp.I.get<HomeCubit>();

  @override
  void initState() {
    super.initState();
    _homeCubit.getBooks(widget.userStoreInfoDTO.idStore);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: const HeaderScreenWidget(title: 'MyBookStore'),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFieldWidget(
                  label: 'Buscar',
                  controller: _searchController,
                  prefixIcon: const Icon(Icons.search),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: BlocProvider<HomeCubit>(
                    create: (context) => _homeCubit,
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state is HomeStateLoading) {
                          return const LoadingWidget();
                        }

                        if (state is HomeStateSuccess) {
                          return ListView.builder(
                            itemCount: state.books.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            itemBuilder: (context, index) {
                              final book = state.books[index];
                              return CardBookWidget(
                                book: book,
                                onTap: () => log('navigate to book detail'),
                              );
                            },
                          );
                        }

                        if (state is HomeStateError) {
                          return Center(
                            child: Text('Houve um erro: ${state.message}'),
                          );
                        }

                        return Center(
                          child: Text('Estado sem regra definida para a view: $state'),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavBarWidget(
            onTap: _handleNavigation,
          ),
        ),
      );

  void _handleNavigation(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.of(context).pushNamed(
          RouteNames.employee,
          arguments: widget.userStoreInfoDTO,
        );
        break;
      case 2:
        Navigator.of(context).pushNamed(
          RouteNames.book,
          arguments: widget.userStoreInfoDTO,
        );
        break;
      case 3:
        Navigator.of(context).pushNamed(
          RouteNames.profile,
          arguments: widget.userStoreInfoDTO,
        );
        break;
    }
  }
}
