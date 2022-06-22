import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:technologies_login_example/di/components/service_locator.dart';
import 'package:technologies_login_example/domain/viewmodel/base_view_model.dart';
import 'package:technologies_login_example/pages/login_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    ChangeNotifierProvider<BaseViewModel>.value(
      value: getIt<BaseViewModel>(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technologies Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:const LoginScreen(),
    );
  }
}
