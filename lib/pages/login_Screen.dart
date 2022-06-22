import 'package:flutter/material.dart';
import 'package:technologies_login_example/domain/enums/view_state.dart';
import 'package:technologies_login_example/domain/viewmodel/login_view_model.dart';
import 'package:technologies_login_example/pages/home_screen.dart';
import 'package:technologies_login_example/utils/commons/app_colors.dart';
import 'package:technologies_login_example/widgets/base_widget.dart';
import 'package:technologies_login_example/widgets/login_screen_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen<LoginViewModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginScreenBody(
              validationMessage: model.errorMessage,
              controller: _emailController,
              passWordController: _passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            model.state == ViewState.BUSY
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      var loginSuccess = await model.login(
                          _emailController.text, _passwordController.text);
                      if (loginSuccess) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      }
                    },
                  ),
            TextButton(
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              onPressed: () {
                model.errorMessage = "";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
