import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../../../core/shared_widgets_model/text_field_model.dart';
import '../../../../../core/utils/my_validators.dart';
import '../../controller/auth_cubit.dart';

class Fields extends StatelessWidget {
  const Fields({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    return Column(
      spacing: 20,
      children: [
        CustomTextFormField(
          textFieldModel: TextFieldModel(
            hintText: "Name",
            controller: cubit.nameController,
            keyboardType: TextInputType.name,
            validator: (p0) => MyValidators.displayNameValidator(p0),
          ),
        ),
        CustomTextFormField(
          textFieldModel: TextFieldModel(
            hintText: "Email",
            controller: cubit.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (p0) => MyValidators.emailValidator(p0),
          ),
        ),
        CustomTextFormField(
          textFieldModel: TextFieldModel(
            hintText: "Phone",
            controller: cubit.phoneController,
            keyboardType: TextInputType.phone,
            validator: (p0) => MyValidators.phoneValidator(p0),
          ),
        ),
        CustomTextFormField(
          textFieldModel: TextFieldModel(
            hintText: "National Id",
            controller: cubit.nationalIdController,
            keyboardType: TextInputType.number,
            validator: (p0) => MyValidators.nationalIdValidator(p0),
          ),
        ),
        CustomTextFormField(
          textFieldModel: TextFieldModel(
            hintText: "Gender",
            controller: cubit.genderController,
            keyboardType: TextInputType.name,
            validator: (p0) => MyValidators.genderValidator(p0),
          ),
        ),
        CustomTextFormField(
          textFieldModel: TextFieldModel(
            hintText: "Password",
            controller: cubit.passwordController,
            keyboardType: TextInputType.visiblePassword,
            validator: (p0) => MyValidators.passwordValidator(p0),
          ),
        ),
      ],
    );
  }
}
