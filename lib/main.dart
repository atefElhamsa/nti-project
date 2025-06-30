import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/favourite/presentation/controller/cubit/favourite_cubit.dart';

import 'bloc_observer.dart';
import 'feature/cart/presentation/controller/cart_cubit.dart';
import 'feature/register/presentation/controller/auth_cubit.dart';
import 'my_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavouriteCubit()..getFavouriteCubit(),
        ),
        BlocProvider(create: (context) => CartCubit()..getCartCubit()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: const MyApp(),
    ),
  );
}
