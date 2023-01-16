import 'package:flutter/material.dart';
import 'package:task_helper/constants/strings.dart';

import 'login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App',
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: const Text(Strings.signUp)),
            body: const SignUp()));
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                child: Text(Strings.signUp,
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
                  decoration: InputDecoration(labelText: Strings.userName)),
            )
          ]),
          Row(
            children: const [
              Expanded(
                child: TextField(
                    maxLength: 100,
                    decoration:
                        InputDecoration(labelText: Strings.emailAddress)),
              )
            ],
          ),
          Row(
            children: const [
              Expanded(
                child: TextField(
                    maxLength: 100,
                    decoration: InputDecoration(labelText: Strings.password)),
              )
            ],
          ),
          Row(
            children: const [
              Expanded(
                child: TextField(
                    maxLength: 100,
                    decoration:
                        InputDecoration(labelText: Strings.repeatPassword)),
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
                    child: const Text(Strings.signUp)),
              )
            ],
          )
        ],
      ),
    );
  }
}
