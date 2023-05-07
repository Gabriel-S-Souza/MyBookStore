import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../commom/domain/entities/dto/user_store_info_dto.dart';
import '../../../../commom/presentation/nav_bar_notifier/botton_nav_bar_notifier.dart';
import '../../../../commom/presentation/widgets/botton_nav_bar_widget.dart';
import '../../../../commom/presentation/widgets/header_screen_widget.dart';

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
        Navigator.of(context).pop();
        break;
      case 1:
        break;
      case 2:
        log('navigate to add book screen');
        break;
      case 3:
        log('navigate to profile screen');
        break;
    }
  }
}
