import 'package:flutter/material.dart';

import '../../../../commom/domain/entities/dto/user_store_info_dto.dart';
import '../../../../commom/domain/entities/user_types/user_type.dart';
import '../../../../commom/presentation/nav_bar_notifier/bottom_nav_bar_notifier.dart';
import '../../../../commom/presentation/widgets/botton_nav_bar_widget.dart';
import '../../../../commom/presentation/widgets/header_screen_widget.dart';
import '../../../../core/routes/route_names.dart';

class ProfileScreen extends StatelessWidget {
  final UserStoreInfoDTO userStoreInfoDTO;
  const ProfileScreen({
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
              title: 'Perfil',
              centerTitle: false,
              fontSize: 20,
            ),
            body: const Center(
              child: Text('TODO: Impement ProfileScreen'),
            ),
            bottomNavigationBar: BottomNavBarWidget(
              icons: userStoreInfoDTO.userType == UserType.employee
                  ? const [
                      Icons.home_outlined,
                      Icons.person_outlined,
                    ]
                  : null,
              names: userStoreInfoDTO.userType == UserType.employee
                  ? const [
                      'Home',
                      'Meu perfil',
                    ]
                  : null,
              onTap: (index) => userStoreInfoDTO.userType == UserType.employee
                  ? _handleNavigationEmployee(index, context)
                  : _handleNavigationAdmin(index, context),
            ),
          ),
        ),
      );

  void _handleNavigationAdmin(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamedAndRemoveUntil(
          RouteNames.home,
          (route) => route.isFirst,
          arguments: userStoreInfoDTO,
        );
        break;
      case 1:
        Navigator.of(context)
            .pushReplacementNamed(RouteNames.employee, arguments: userStoreInfoDTO);
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed(RouteNames.book, arguments: userStoreInfoDTO);
        break;
      case 3:
        break;
    }
  }

  void _handleNavigationEmployee(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.of(context).pop();
        break;
      case 1:
        break;
    }
  }
}
