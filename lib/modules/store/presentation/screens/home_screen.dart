import 'package:flutter/material.dart';

import '../../../../core/commom/domain/entities/dto/user_store_info_dto.dart';

class HomeScreen extends StatefulWidget {
  final UserStoreInfoDTO userStoreInfoDTO;
  const HomeScreen({super.key, required this.userStoreInfoDTO});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('Home'),
          ),
        ),
      );
}
