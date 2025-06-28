import 'package:flutter/material.dart';
import 'package:nti_project/feature/home/presentation/view/widgets/custom_one_item.dart';

import '../../../data/model/product_model.dart';

class CustomSuccessWidget extends StatelessWidget {
  const CustomSuccessWidget({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return CustomOneItem(productModel: product);
      },
    );
  }
}
