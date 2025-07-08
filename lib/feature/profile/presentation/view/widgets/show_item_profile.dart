import 'package:flutter/material.dart';

import '../../controller/profile_cubit.dart';

class ShowItemProfile extends StatelessWidget {
  const ShowItemProfile({super.key, required this.cubit, required this.text});
  final ProfileCubit cubit;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            cubit.changeEdit();
          },
          icon: const Icon(Icons.edit),
        ),
        Text(text),
      ],
    );
  }
}
