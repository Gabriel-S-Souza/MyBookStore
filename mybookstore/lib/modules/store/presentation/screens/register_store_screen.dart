import 'package:flutter/material.dart';

class RegisterStoreScreen extends StatefulWidget {
  const RegisterStoreScreen({super.key});

  @override
  State<RegisterStoreScreen> createState() => _RegisterStoreScreenState();
}

class _RegisterStoreScreenState extends State<RegisterStoreScreen> {
  @override
  Widget build(BuildContext context) => const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('Register Store'),
          ),
        ),
      );
}
