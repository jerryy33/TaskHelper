import 'package:flutter/material.dart';
import 'package:task_helper/login/sign_up.dart';

import '../constants.dart';
import '../home/home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: Scaffold(
        appBar: AppBar(title: const Text(Strings.loginTitle)),
        body: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.only(top: 36),
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                    child: Text(Strings.signIn,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold)),
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
                            InputDecoration(labelText: Strings.password)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(Strings.forgotPasswort)),
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        },
                        child: const Text(Strings.login)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
