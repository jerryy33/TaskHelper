import 'package:flutter/material.dart';
import 'package:task_helper/login/sign_up.dart';
import 'package:task_helper/login/user.dart';
import 'package:task_helper/login/user_repository.dart';
import 'package:task_helper/validator_builder.dart';

import '../constants/strings.dart';
import '../home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final userRepo = UserRepository();
  String userName = "";
  String userPW = "";
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
              Row(children: [
                Expanded(
                  child: TextFormField(
                      validator: ValidationBuilder()
                          .isEmpty(validationText: "User name cannot be empty")
                          .build(),
                      onChanged: (value) => {userName = value},
                      autofocus: true,
                      maxLength: 100,
                      decoration:
                          const InputDecoration(labelText: Strings.userName)),
                )
              ]),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        validator: ValidationBuilder()
                            .isEmpty(validationText: "Password cannot be empty")
                            .build(),
                        onChanged: (value) => {userPW = value},
                        obscureText: true,
                        maxLength: 100,
                        decoration:
                            const InputDecoration(labelText: Strings.password)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        print("TODO");
                      },
                      child: const Text(Strings.forgotPasswort)),
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            // TODO error handling in the case of no result
                            final foundUser =
                                await userRepo.findUser(userName, userPW);
                            final user = User.fromJson(
                                foundUser as Map<String, dynamic>);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Home(user: user),
                              ),
                            );
                          }
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
