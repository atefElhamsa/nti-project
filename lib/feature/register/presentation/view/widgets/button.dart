import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared_widgets/custom_loading.dart';
import '../../../../favourite/presentation/view/widgets/message_snake_bar.dart';
import '../../controller/auth_cubit.dart';
import '../../controller/auth_state.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
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
            Navigator.pop(context);
          }
        } else if (state is AddUserFailure) {
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
                  BlocProvider.of<AuthCubit>(context).addUserCubit();
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
              );
      },
    );
  }
}
