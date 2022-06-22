import 'package:flutter/material.dart';
import 'package:technologies_login_example/di/components/service_locator.dart';
import 'package:technologies_login_example/domain/viewmodel/user_view_model.dart';
import 'package:technologies_login_example/pages/home_screen.dart';
import 'package:technologies_login_example/pages/login_Screen.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final userViewModel = getIt<UserViewModel>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    userViewModel.isUserLoggedIn().then((value) {});
    return MaterialApp(
      title: 'Technologies Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: userViewModel.user?.id != null
          ? const HomeScreen()
          : const LoginScreen(),
    );
  }
}
