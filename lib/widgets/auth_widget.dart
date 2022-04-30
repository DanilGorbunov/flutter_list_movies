// import 'dart:js';
// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:catalogs/Theme/app_button_style.dart';
import 'package:catalogs/widgets/main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: ListView(
          children: [
            _HeaderWidget(),
          ],
        ));
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.black,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          _FormWidget(),
          SizedBox(height: 25),
          Text(
            'In order to use the editing and rating capabilities, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple. Click here to get started.',
            style: textStyle,
          ),
          SizedBox(height: 5),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: Text('Register'),
          ),
          SizedBox(height: 25),
          Text(
            'If you signed up but didnt get your verification email, click here to have it resent.',
            style: textStyle,
          ),
          SizedBox(height: 5),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: Text('Verify Email'),
          ),

          //InputBorder(borderSide: none),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText = null;
  // ? this the sigh means that 'string' is optional

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;

      //Variant 0
      Navigator.of(context).pushReplacementNamed('/main_screen');
      //Navigator.of(context).pushNamed('/main_screen');

      // pushReplacementNamed - allows me create a screen wothout arrows - stack

      //Variant 1
      //Navigator.of(context).pushNamed('/main_screen');

      //Variant 2
      // final navigator = Navigator.of(context);

      // navigator.push(
      //   MaterialPageRoute<void>(builder: (context) => MainScreenWidget()),
      // );

    } else {
      errorText = 'Enter text';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );
    final color = const Color(0xFF01B4E4);
    final textFieldDecoration = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
    );

    final errorText = this.errorText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          //spread opeator - return 2 massoves and cancels the action
          Text(errorText,
              style: TextStyle(
                fontSize: 17,
                color: Colors.red,
              )),
          SizedBox(height: 20),
        ],
        Text(
          'Username',
          style: textStyle,
        ),
        SizedBox(height: 5),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecoration,
        ),
        SizedBox(height: 20),
        Text('Password'),
        SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecoration,
          obscureText: true,
        ),
        SizedBox(height: 25),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
              ),
              onPressed: _auth,
              child: Text('Login'),
            ),
            SizedBox(width: 30),
            TextButton(
              style: AppButtonStyle.linkButton,
              onPressed: _resetPassword,
              child: Text('Reset password'),
            ),
          ],
        )
      ],
    );
  }
}
