import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/widgets/spacing.dart';

class CreateAccountScreen extends StatelessWidget {
  final userNameController = TextEditingController();
  final passWordController = TextEditingController();
  final confirmController = TextEditingController();

  CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: userNameController,
                decoration: const InputDecoration(
                    hintText: 'user name', border: OutlineInputBorder()),
              ),
              const Spacing(height: 20),
              TextFormField(
                controller: passWordController,
                decoration: const InputDecoration(
                    hintText: 'password', border: OutlineInputBorder()),
              ),
              const Spacing(height: 20),
              TextFormField(
                controller: confirmController,
                decoration: const InputDecoration(
                    hintText: 'confirm password', border: OutlineInputBorder()),
              ),
              const Spacing(height: 20),
              ElevatedButton(
                  onPressed: () {
                    setValuess(
                        context: context,
                        uName: userNameController.text,
                        pWord: passWordController.text,
                        conPass: confirmController.text);

                    Navigator.pop(context);
                  },
                  child: const Text('Create acccount'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> setValuess(
      {required BuildContext context,
      required String uName,
      required String pWord,
      required String conPass}) async {
    await saveString(stringKey: "username", value: uName);
    await saveString(stringKey: "password", value: pWord);
    await saveString(stringKey: "confirmPass", value: conPass);
    await saveString(stringKey: "loginStatus", value: "accCreated");
    print("saved");
  }
}

Future<bool> saveString(
    {required String value, required String stringKey}) async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  return await sharedPref.setString(stringKey, value);
}

Future<String> getString({required String stringKey}) async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  final val = sharedPref.getString(stringKey);
  if (val != null) {
    return val;
  } else {
    return "noValue";
  }
}

Future<String> getNode() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  final val = sharedPref.getString("subcollectionNode");
  if (val != null) {
    return val;
  } else {
    return "noValue";
  }
}

Future<String> checkLoginPref({required String stringKey}) async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  final value = sharedPref.getString(stringKey);
  if (value != null) {
    return value;
  } else {
    return "noalue";
  }
}
