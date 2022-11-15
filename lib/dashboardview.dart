import 'package:flutter/material.dart';
import 'package:flutterfire/controller.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<Controller>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          GestureDetector(
            onTap: () => auth.logOut(),
            child: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
