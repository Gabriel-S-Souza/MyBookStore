import 'package:flutter/material.dart';

import '../../../../commom/domain/entities/dto/user_store_info_dto.dart';
import '../../../../commom/presentation/nav_bar_notifier/bottom_nav_bar_notifier.dart';
import '../../../../commom/presentation/widgets/botton_nav_bar_widget.dart';
import '../../../../commom/presentation/widgets/header_screen_widget.dart';
import '../../../../core/routes/route_names.dart';

class EmployeeScreen extends StatelessWidget {
  final UserStoreInfoDTO userStoreInfoDTO;
  const EmployeeScreen({
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
              title: 'Funcionários',
              centerTitle: false,
              fontSize: 20,
            ),
            body: const Center(
              child: Text('Employee Screen'),
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
        Navigator.of(context).pushNamedAndRemoveUntil(
          RouteNames.home,
          (route) => route.isFirst,
          arguments: userStoreInfoDTO,
        );
        break;
      case 1:
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed(RouteNames.book, arguments: userStoreInfoDTO);
        break;
      case 3:
        Navigator.of(context).pushReplacementNamed(RouteNames.profile, arguments: userStoreInfoDTO);
        break;
    }
  }
}
