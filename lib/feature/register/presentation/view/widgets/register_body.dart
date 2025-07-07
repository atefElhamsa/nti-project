import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/favourite/presentation/view/widgets/message_snake_bar.dart';
import 'package:nti_project/feature/register/presentation/controller/auth_state.dart';
import 'package:nti_project/feature/register/presentation/view/widgets/button.dart';
import 'package:nti_project/feature/register/presentation/view/widgets/fields.dart';

import '../../controller/auth_cubit.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

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
            const Fields(),
            const Button(),
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
