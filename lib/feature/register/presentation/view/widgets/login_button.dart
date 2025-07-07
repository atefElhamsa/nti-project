import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/register/presentation/controller/auth_cubit.dart';
import 'package:nti_project/feature/register/presentation/controller/auth_state.dart';

import '../../../../../core/shared_widgets/custom_loading.dart';
import '../../../../favourite/presentation/view/widgets/message_snake_bar.dart';
import '../../../../home/presentation/view/home_screen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          const CustomLoading();
        } else if (state is LoginSuccess) {
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        } else if (state is LoginFailure) {
          messageSnakeBar(
            context: context,
            content: state.message,
            color: Colors.red,
          );
        }
      },
      builder: (context, state) {
        return state is AuthLoading
            ? const CustomLoading()
            : GestureDetector(
                onTap: () {
                  BlocProvider.of<AuthCubit>(context).loginCubit();
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
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
