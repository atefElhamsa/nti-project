import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../../../core/shared_widgets_model/text_field_model.dart';
import '../../../../../core/utils/my_validators.dart';

class Fields extends StatelessWidget {
  const Fields({
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
    return Column(
      spacing: 20,
      children: [
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
            keyboardType: TextInputType.number,
            validator: (p0) => MyValidators.nationalIdValidator(p0),
          ),
        ),
        CustomTextFormField(
          textFieldModel: TextFieldModel(
            hintText: "Gender",
            controller: genderController,
            keyboardType: TextInputType.name,
            validator: (p0) => MyValidators.genderValidator(p0),
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
      ],
    );
  }
}
