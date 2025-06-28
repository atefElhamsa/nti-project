import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/favourite/presentation/controller/cubit/favourite_cubit.dart';

import 'bloc_observer.dart';
import 'my_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => FavouriteCubit()..getFavouriteCubit(),
      child: const MyApp(),
    ),
  );
}
