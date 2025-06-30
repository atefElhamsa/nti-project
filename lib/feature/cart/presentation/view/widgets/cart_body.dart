import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/cart/presentation/controller/cart_cubit.dart';
import 'package:nti_project/feature/cart/presentation/controller/cart_state.dart';
import 'package:nti_project/feature/home/presentation/view/widgets/custom_success_widget.dart';

import '../../../../../core/shared_widgets/custom_failure.dart';
import '../../../../../core/shared_widgets/custom_loading.dart';
import '../../../../favourite/presentation/view/widgets/message_snake_bar.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CustomLoading();
        } else if (state is CartFailure) {
          return CustomFailure(error: state.error);
        } else if (state is CartSuccess) {
          final products = state.carts;
          return products.isEmpty
              ? const Center(child: Text("No Cart Products"))
              : CustomSuccessWidget(products: products);
        }
        return const SizedBox();
      },
      listener: (context, state) {
        if (state is CartLoading) {
          const CustomLoading();
        } else if (state is AddCartFailure) {
          messageSnakeBar(
            context: context,
            content: state.error,
            color: Colors.red,
          );
        } else if (state is AddCartSuccess) {
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
