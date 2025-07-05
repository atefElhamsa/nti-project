import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/favourite/presentation/view/widgets/message_snake_bar.dart';
import 'package:nti_project/feature/register/presentation/controller/auth_state.dart';
import 'package:nti_project/feature/register/presentation/view/widgets/button.dart';
import 'package:nti_project/feature/register/presentation/view/widgets/fields.dart';

import '../../controller/auth_cubit.dart';

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
    var cubit = AuthCubit.get(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 20,
          children: [
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is SaveImageSuccess) {
                  messageSnakeBar(
                    context: context,
                    content: "Updated Image Successfully",
                    color: Colors.green,
                  );
                }
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    cubit.saveImage();
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: cubit.myPhoto == null
                        ? null
                        : FileImage(File(cubit.myPhoto!.path)),
                  ),
                );
              },
            ),
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
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
