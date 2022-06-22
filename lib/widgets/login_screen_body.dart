import 'package:flutter/material.dart';
import 'package:technologies_login_example/utils/commons/text_styles.dart';

class LoginScreenBody extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController passWordController;
  final String? validationMessage;

  const LoginScreenBody({
    Key? key,
    required this.controller,
    required this.passWordController,
    this.validationMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text('Login', style: headerStyle),
        const SizedBox(
          height: 20,
        ),
        const Text('Enter your email and password to login',
            style: subHeaderStyle),
        LoginTextField(
          controller: controller,
          type: TextInputType.emailAddress,
        ),
        validationMessage != null
            ? Text(validationMessage!,
                style: const TextStyle(color: Colors.red))
            : Container(),
        LoginTextField(
          controller: passWordController,
          type: TextInputType.visiblePassword,
        ),
        validationMessage != null
            ? Text(validationMessage!,
                style: const TextStyle(color: Colors.red))
            : Container()
      ],
    );
  }
}

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;

  const LoginTextField({Key? key, required this.controller, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      height: 50.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        decoration: const InputDecoration.collapsed(hintText: 'User id'),
        keyboardType: type,
        controller: controller,
      ),
    );
  }
}
