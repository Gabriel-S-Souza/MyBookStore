import 'package:flutter/material.dart';

import '../../../../commom/domain/entities/dto/user_store_info_dto.dart';
import '../../../../commom/presentation/nav_bar_notifier/bottom_nav_bar_notifier.dart';
import '../../../../commom/presentation/widgets/botton_nav_bar_widget.dart';
import '../../../../commom/presentation/widgets/header_screen_widget.dart';
import '../../../../core/routes/route_names.dart';
import '../../../../core/utils/repeater.dart';

class BooksScreen extends StatelessWidget {
  final UserStoreInfoDTO userStoreInfoDTO;
  const BooksScreen({
    super.key,
    required this.userStoreInfoDTO,
  });

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          NavBarNotifier.I.changeIndex(0);
          return true;
        },
        child: SafeArea(
          child: Scaffold(
            appBar: const HeaderScreenWidget(
              title: 'Livros',
              centerTitle: false,
              fontSize: 20,
            ),
            body: const Center(
              child: Text('TODO: implement book list'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(RouteNames.registerBook, arguments: userStoreInfoDTO);
              },
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.add),
            ),
            bottomNavigationBar: BottomNavBarWidget(
              onTap: (index) => _handleNavigation(index, context),
            ),
          ),
        ),
      );

  void _handleNavigation(int index, BuildContext context) {
    switch (index) {
      case 0:
        repeater(Navigator.of(context).pop, 2);
        break;
      case 1:
        Navigator.of(context).pop();
        break;
      case 2:
        break;
      case 3:
        Navigator.of(context).pushNamed(RouteNames.profile, arguments: userStoreInfoDTO);
        break;
    }
  }
}
