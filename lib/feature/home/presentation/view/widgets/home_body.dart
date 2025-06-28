import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/core/shared_widgets/custom_failure.dart';
import 'package:nti_project/core/shared_widgets/custom_loading.dart';
import 'package:nti_project/feature/home/presentation/view/widgets/custom_success_widget.dart';

import '../../controller/cubit/product_cubit.dart';
import '../../controller/cubit/product_state.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const CustomLoading();
        } else if (state is ProductFailure) {
          return CustomFailure(error: state.error);
        } else if (state is ProductSuccess) {
          final products = state.products;
          return CustomSuccessWidget(products: products);
        }
        return const SizedBox();
      },
    );
  }
}
