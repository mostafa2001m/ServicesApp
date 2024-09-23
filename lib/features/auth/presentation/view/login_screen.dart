import 'package:demo_app/features/auth/presentation/view%20model/auth_controller.dart';
import 'package:demo_app/features/auth/presentation/widgets/login_form.dart';
import 'package:demo_app/features/auth/presentation/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E5), // Light background color
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [loginHeader(context), LoginForm()],
            ),
          ),
        ),
      ),
    );
  }
}
