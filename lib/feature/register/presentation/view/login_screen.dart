import 'package:flutter/material.dart';
import 'package:nti_project/feature/register/presentation/view/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"), centerTitle: true),
      body: const LoginBody(),
    );
  }
}
