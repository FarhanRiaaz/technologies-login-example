import 'package:flutter/material.dart';
import 'package:technologies_login_example/domain/enums/view_state.dart';
import 'package:technologies_login_example/domain/viewmodels/login_view_model.dart';
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
            model.state == ViewState.BUSY
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () async {
                      var loginSuccess = await model.login(
                          _emailController.text, _passwordController.text);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, '/');
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
