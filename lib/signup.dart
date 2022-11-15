import 'package:flutter/material.dart';
import 'package:flutterfire/controller.dart';
import 'package:get/get.dart';

class SignPage extends StatelessWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailc = TextEditingController();
    final passwordC = TextEditingController();

    final authC = Get.find<Controller>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: emailc,
              decoration: const InputDecoration(labelText: "email"),
            ),
            TextField(
              controller: passwordC,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => authC.signUp(
                emailc.text,
                passwordC.text,
              ),
              child: const Center(
                child: Text("Sign Up"),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
