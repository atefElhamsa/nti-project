import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/favourite/presentation/view/favourite_screen.dart';
import 'package:nti_project/feature/home/presentation/controller/cubit/product_cubit.dart';
import 'package:nti_project/feature/home/presentation/view/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getDataCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
          centerTitle: true,
          toolbarHeight: 100,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavouriteScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.favorite_outlined, color: Colors.red),
            ),
          ],
        ),
        body: const HomeBody(),
      ),
    );
  }
}
