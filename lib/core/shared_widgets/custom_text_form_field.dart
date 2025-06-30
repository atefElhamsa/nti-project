import 'package:flutter/material.dart';

import '../shared_widgets_model/text_field_model.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: textFieldModel.onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: textFieldModel.keyboardType,
      controller: textFieldModel.controller,
      validator: textFieldModel.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: GestureDetector(
          onTap: () => textFieldModel.controller.clear(),
          child: const Icon(Icons.clear, color: Colors.grey),
        ),
        hintText: textFieldModel.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
        focusedErrorBorder: outlineInputBorder(),
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(color: Colors.white),
  );
}
