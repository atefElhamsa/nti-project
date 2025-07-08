import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../../../core/shared_widgets_model/text_field_model.dart';
import '../../controller/profile_cubit.dart';

class ShowItemEditProfile extends StatelessWidget {
  const ShowItemEditProfile({
    super.key,
    required this.cubit,
    required this.hintText,
    this.validator,
    required this.keyboardType,
    required this.keyOfValue,
    required this.controller,
  });
  final ProfileCubit cubit;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String keyOfValue;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          child: CustomTextFormField(
            textFieldModel: TextFieldModel(
              hintText: hintText,
              controller: controller,
              keyboardType: keyboardType,
              validator: validator,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            cubit.updateProfileCubit(
              key: keyOfValue,
              value: controller.text.trim(),
            );
          },
          icon: const Icon(Icons.save),
        ),
      ],
    );
  }
}
