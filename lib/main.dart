import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire/controller.dart';
import 'package:flutterfire/dashboardview.dart';
import 'package:flutterfire/signup.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Get.put(Controller());
    return StreamBuilder<User?>(
      stream: auth.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home:
              snapshot.data != null ? const DashboardView() : const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<Controller>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: authC.emailc,
              decoration: const InputDecoration(labelText: "email"),
            ),
            TextField(
              controller: authC.passwordC,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => authC.login(
                authC.emailc.text,
                authC.passwordC.text,
              ),
              child: const Center(
                child: Text("Login"),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Belum punya akun?"),
                TextButton(
                  onPressed: () => Get.to(() => const SignPage()),
                  child: const Text("Daftar Sekarang"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
