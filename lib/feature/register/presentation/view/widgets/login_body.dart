import 'package:flutter/material.dart';
import 'package:nti_project/feature/register/presentation/view/register_screen.dart';
import 'package:nti_project/feature/register/presentation/view/widgets/login_button.dart';

import '../../../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../../../core/shared_widgets_model/text_field_model.dart';
import '../../../../../core/utils/my_validators.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          CustomTextFormField(
            textFieldModel: TextFieldModel(
              hintText: "Email",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (p0) => MyValidators.emailValidator(p0),
            ),
          ),
          CustomTextFormField(
            textFieldModel: TextFieldModel(
              hintText: "Password",
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              validator: (p0) => MyValidators.passwordValidator(p0),
            ),
          ),
          LoginButton(
            emailController: emailController,
            passwordController: passwordController,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterScreen()),
              );
            },
            child: const Text("Create Account"),
          ),
        ],
      ),
    );
  }
}
