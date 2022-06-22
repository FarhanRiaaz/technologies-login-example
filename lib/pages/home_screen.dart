import 'package:flutter/material.dart';
import 'package:technologies_login_example/domain/viewmodel/user_view_model.dart';
import 'package:technologies_login_example/utils/commons/app_colors.dart';
import 'package:technologies_login_example/widgets/base_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<UserViewModel>(
      builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor, body: HomeScreenBody(model)),
    );
  }

  Widget HomeScreenBody(UserViewModel model) {
    model.isUserLoggedIn().then((value) {});
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          model.user?.name != null
              ? Text("${model.user!.name} is LoggedIn")
              : const Text("Guest is LoggedIn")
        ],
      ),
    );
  }
}
