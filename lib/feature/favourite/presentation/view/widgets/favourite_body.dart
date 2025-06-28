import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/favourite/presentation/view/widgets/message_snake_bar.dart';

import '../../../../../core/shared_widgets/custom_failure.dart';
import '../../../../../core/shared_widgets/custom_loading.dart';
import '../../../../home/presentation/view/widgets/custom_success_widget.dart';
import '../../controller/cubit/favourite_cubit.dart';
import '../../controller/cubit/favourite_state.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteStates>(
      builder: (context, state) {
        if (state is FavouriteLoading) {
          return const CustomLoading();
        } else if (state is FavouriteFailure) {
          return CustomFailure(error: state.error);
        } else if (state is FavouriteSuccess) {
          final products = state.products;
          return products.isEmpty
              ? const Center(
                  child: Text(
                    "No Favourite Products",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : CustomSuccessWidget(products: products);
        }
        return const SizedBox();
      },
      listener: (context, state) {
        if (state is FavouriteLoading) {
          const CustomLoading();
        } else if (state is AddFavouriteFailure) {
          messageSnakeBar(
            context: context,
            content: state.error,
            color: Colors.red,
          );
        } else if (state is AddFavouriteSuccess) {
          messageSnakeBar(
            context: context,
            content: state.message,
            color: Colors.green,
          );
        } else if (state is DeleteFavouriteFailure) {
          messageSnakeBar(
            context: context,
            content: state.error,
            color: Colors.red,
          );
        } else if (state is DeleteFavouriteSuccess) {
          messageSnakeBar(
            context: context,
            content: state.message,
            color: Colors.green,
          );
        }
      },
    );
  }
}
