import 'package:flutter/material.dart';
import 'package:nti_project/feature/details_product/presentation/view/widgets/details_product_body.dart';
import 'package:nti_project/feature/home/data/model/product_model.dart';

class DetailsProductScreen extends StatelessWidget {
  const DetailsProductScreen({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details Product"), centerTitle: true),
      body: DetailsProductBody(productModel: productModel),
    );
  }
}
