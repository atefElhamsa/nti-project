import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared_widgets/custom_loading.dart';
import '../../../../favourite/presentation/view/widgets/message_snake_bar.dart';
import '../../controller/auth_cubit.dart';
import '../../controller/auth_state.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.nationalIdController,
    required this.genderController,
    required this.passwordController,
  });
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController nationalIdController;
  final TextEditingController genderController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          const CustomLoading();
        } else if (state is AddUserSuccess) {
          if (state.responseModel.status == "error") {
            messageSnakeBar(
              context: context,
              content: state.responseModel.message,
              color: Colors.red,
            );
          } else if (state.responseModel.status == "success") {
            messageSnakeBar(
              context: context,
              content: state.responseModel.message,
              color: Colors.green,
            );
          }
        } else if (state is AddUserFailure) {
          messageSnakeBar(
            context: context,
            content: state.message,
            color: Colors.red,
          );
        }
      },
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<AuthCubit>(context).addUserCubit(
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            phone: phoneController.text.trim(),
            nationalId: nationalIdController.text.trim(),
            gender: genderController.text.trim(),
            password: passwordController.text.trim(),
          );
        },
        child: Container(
          width: double.infinity,
          height: 50,
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              "Register",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
