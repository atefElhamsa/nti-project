import 'package:flutter/material.dart';
import 'package:nti_project/feature/register/presentation/view/widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Register")),
      body: RegisterBody(),
    );
  }
}
