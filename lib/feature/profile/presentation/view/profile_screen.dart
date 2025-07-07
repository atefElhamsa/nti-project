import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/profile/presentation/controller/profile_cubit.dart';
import 'package:nti_project/feature/profile/presentation/view/widgets/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileCubit(),
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Profile")),
        body: const ProfileBody(),
      ),
    );
  }
}
