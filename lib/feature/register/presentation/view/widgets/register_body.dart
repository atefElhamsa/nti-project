import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/core/shared_widgets/custom_loading.dart';
import 'package:nti_project/core/shared_widgets/custom_text_form_field.dart';
import 'package:nti_project/core/shared_widgets_model/text_field_model.dart';
import 'package:nti_project/feature/favourite/presentation/view/widgets/message_snake_bar.dart';
import 'package:nti_project/feature/register/presentation/controller/auth_cubit.dart';
import 'package:nti_project/feature/register/presentation/controller/auth_state.dart';

import '../../../../../core/utils/my_validators.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
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
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
                  "data:image/jpeg;base64,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",
              errorWidget: (c, u, e) {
                return const Icon(Icons.error_outline_rounded);
              },
              placeholder: (c, e) {
                return const Center(child: CircularProgressIndicator());
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              textFieldModel: TextFieldModel(
                hintText: "Name",
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: (p0) => MyValidators.displayNameValidator(p0),
              ),
            ),
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
                hintText: "Phone",
                controller: phoneController,
                keyboardType: TextInputType.phone,
                validator: (p0) => MyValidators.phoneValidator(p0),
              ),
            ),
            CustomTextFormField(
              textFieldModel: TextFieldModel(
                hintText: "National Id",
                controller: nationalIdController,
                keyboardType: TextInputType.name,
                validator: (p0) => MyValidators.nationalIdValidator(p0),
              ),
            ),
            CustomTextFormField(
              textFieldModel: TextFieldModel(
                hintText: "Gender",
                controller: genderController,
                keyboardType: TextInputType.name,
                validator: (p0) => MyValidators.genderValidator(value: p0),
              ),
            ),
            CustomTextFormField(
              textFieldModel: TextFieldModel(
                hintText: "Password",
                controller: passwordController,
                keyboardType: TextInputType.name,
                validator: (p0) => MyValidators.passwordValidator(p0),
              ),
            ),
            BlocListener<AuthCubit, AuthState>(
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
                  }
                  if (state.responseModel.status == "success") {
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
                  context.read<AuthCubit>().addUserCubit(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    nationalId: nationalIdController.text,
                    gender: genderController.text,
                    password: passwordController.text,
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
            ),
          ],
        ),
      ),
    );
  }
}
