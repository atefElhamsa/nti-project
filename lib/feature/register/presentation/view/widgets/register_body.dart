import 'package:flutter/material.dart';
import 'package:nti_project/feature/register/presentation/view/widgets/button.dart';
import 'package:nti_project/feature/register/presentation/view/widgets/fields.dart';

class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 20,
          children: [
            Fields(
              nameController: nameController,
              emailController: emailController,
              phoneController: phoneController,
              nationalIdController: nationalIdController,
              genderController: genderController,
              passwordController: passwordController,
            ),
            Button(
              nameController: nameController,
              emailController: emailController,
              phoneController: phoneController,
              nationalIdController: nationalIdController,
              genderController: genderController,
              passwordController: passwordController,
            ),
          ],
        ),
      ),
    );
  }
}
