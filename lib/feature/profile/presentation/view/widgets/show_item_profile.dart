import 'package:flutter/material.dart';

import '../../controller/profile_cubit.dart';

class ShowItemProfile extends StatelessWidget {
  const ShowItemProfile({
    super.key,
    required this.cubit,
    required this.text,
    required this.isEditKey,
  });
  final ProfileCubit cubit;
  final String text;
  final String isEditKey;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            cubit.changeEdit(key: isEditKey);
          },
          icon: const Icon(Icons.edit),
        ),
        Text(text),
      ],
    );
  }
}
