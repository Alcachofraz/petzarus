import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzarus/services/auth_service.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      resizeToAvoidBottomInset: true,
      body: const Center(
        child: Text('To be implemented.', style: TextStyle(color: Colors.grey)),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.logout_rounded,
          color: Color(0xff131621),
        ),
        onPressed: () {
          AuthService.auth = false;
        },
      ),
    );
  }
}
