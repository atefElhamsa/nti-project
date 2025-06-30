import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/details_product/presentation/view/widgets/show_image_list.dart';

import '../../../../cart/presentation/controller/cart_cubit.dart';
import '../../../../home/data/model/product_model.dart';

class DetailsProductBody extends StatefulWidget {
  const DetailsProductBody({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<DetailsProductBody> createState() => _DetailsProductBodyState();
}

class _DetailsProductBodyState extends State<DetailsProductBody> {
  int selectedImageIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            ShowImageList(
              productModel: widget.productModel,
              pageController: pageController,
              selectedImageIndex: selectedImageIndex,
            ),
            Text(
              "Name: ${widget.productModel.name}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Description: ${widget.productModel.description}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Category: ${widget.productModel.category}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Brand: ${widget.productModel.company}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Sales: ${widget.productModel.sales}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Available: ${widget.productModel.countInStock >= 1 ? "Yes" : "No"}",
              style: TextStyle(
                fontSize: 20,
                color: widget.productModel.countInStock >= 1
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            Text(
              "Status: ${widget.productModel.status}",
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            Text(
              "Price: ${widget.productModel.price} \$",
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            Text(
              "Quantity: ${widget.productModel.quantity}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Total Price: ${widget.productModel.totalPrice} \$",
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            GestureDetector(
              onTap: () {
                context.read<CartCubit>().addCartCubit(
                  productId: widget.productModel.id,
                  quantity: widget.productModel.quantity,
                );
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
