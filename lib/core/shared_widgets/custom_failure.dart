import 'package:flutter/material.dart';

class CustomFailure extends StatelessWidget {
  const CustomFailure({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Text(error);
  }
}
