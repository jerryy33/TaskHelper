import 'package:flutter/material.dart';

import 'login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const signUpTitle = 'Sign Up';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App',
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: const Text(signUpTitle)),
            body: const SignUp()));
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  static const signUpTitle = 'Sign Up';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(bottom: 5, left: 20, right: 20, top: 5),
      child: Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Text(signUpTitle,
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Row(children: const [
            Expanded(
              child: TextField(
                  autofocus: true,
                  maxLength: 100,
                  decoration: InputDecoration(labelText: 'User Name')),
            )
          ]),
          Row(
            children: const [
              Expanded(
                child: TextField(
                    maxLength: 100,
                    decoration: InputDecoration(labelText: 'Email address')),
              )
            ],
          ),
          Row(
            children: const [
              Expanded(
                child: TextField(
                    maxLength: 100,
                    decoration: InputDecoration(labelText: 'Password')),
              )
            ],
          ),
          Row(
            children: const [
              Expanded(
                child: TextField(
                    maxLength: 100,
                    decoration: InputDecoration(labelText: 'Repeat password')),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: const Text(signUpTitle)),
              )
            ],
          )
        ],
      ),
    );
  }
}
