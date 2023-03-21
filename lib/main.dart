import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:solution_challenge_mciet/screens/myref.dart';
import 'package:solution_challenge_mciet/services/auth_service.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Mciet());
}

class Mciet extends StatelessWidget {
  const Mciet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // debug 표시 제거
      title: 'Mceit',
      home: AuthService().handleAuthState(),
      getPages: [
        GetPage(
          name: '/myref',
          page: () => myrefPage()
        ),
      ],
    );
  }
}