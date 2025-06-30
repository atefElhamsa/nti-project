import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/details_product/presentation/view/details_product_screen.dart';

import '../../../../favourite/presentation/controller/cubit/favourite_cubit.dart';
import '../../../data/model/product_model.dart';

class CustomOneItem extends StatefulWidget {
  const CustomOneItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<CustomOneItem> createState() => _CustomOneItemState();
}

class _CustomOneItemState extends State<CustomOneItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailsProductScreen(productModel: widget.productModel),
              ),
            );
          },
          title: Text(widget.productModel.name),
          subtitle: Text(
            "${widget.productModel.price.toString()} \$",
            style: const TextStyle(color: Colors.green),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.productModel.image,
              errorWidget: (c, u, e) {
                return const Icon(Icons.error_outline_rounded);
              },
              placeholder: (c, e) {
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                widget.productModel.isFavourite =
                    !widget.productModel.isFavourite;
              });
              widget.productModel.isFavourite
                  ? context.read<FavouriteCubit>().addFavouriteCubit(
                      id: widget.productModel.id,
                    )
                  : context.read<FavouriteCubit>().deleteFavouriteCubit(
                      id: widget.productModel.id,
                    );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  showCloseIcon: true,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: widget.productModel.isFavourite
                      ? Colors.green
                      : Colors.red,
                  content: Text(
                    widget.productModel.isFavourite
                        ? "Success Added"
                        : "Success Deleted",
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            icon: Icon(
              widget.productModel.isFavourite
                  ? Icons.favorite
                  : Icons.favorite_outline,
            ),
          ),
        ),
      ),
    );
  }
}
