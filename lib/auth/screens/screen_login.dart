import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/auth/screens/screen_create_account.dart';
import 'package:todo_app/widgets/spacing.dart';

class LoginScreen extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                    hintText: 'user name', border: OutlineInputBorder()),
              ),
              const Spacing(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: 'password', border: OutlineInputBorder()),
              ),
              const Spacing(height: 20),
              // button
              ElevatedButton(
                  onPressed: () {
                    checkFields(context, usernameController.text,
                        passwordController.text);
                  },
                  child: const Text('login')),
              const Spacing(height: 70),

              // create account
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/createAccountScreen');
                  },
                  child: const Text('create account'))
            ],
          ),
        ),
      ),
    );
  }

  void checkFields(
      BuildContext context, String username, String password) async {
    String usernameShared = await getString(stringKey: "username");
    String passwordShared = await getString(stringKey: "password");

    if (usernameShared == username && passwordShared == password) {
      // ignore: use_build_context_synchronously
      loggedin();
      Navigator.pushNamed(context, '/home');
    } else {
      print('please check username and password');
    }
  }
}
Future<void> loggedin() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    await saveString(stringKey: "loginStatus", value: "loggedin");

  }
