import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../home/data/model/product_model.dart';

class ShowImageList extends StatefulWidget {
  ShowImageList({
    super.key,
    required this.productModel,
    required this.pageController,
    required this.selectedImageIndex,
  });
  final ProductModel productModel;
  final PageController pageController;
  late int selectedImageIndex;

  @override
  State<ShowImageList> createState() => _ShowImageListState();
}

class _ShowImageListState extends State<ShowImageList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Center(
          child: Container(
            height: 200,
            width: 300,
            decoration: const BoxDecoration(),
            child: PageView.builder(
              controller: widget.pageController,
              onPageChanged: (value) {
                setState(() {
                  widget.selectedImageIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: widget.productModel.images[index],
                  errorWidget: (c, u, e) {
                    return const Icon(Icons.error_outline_rounded);
                  },
                  placeholder: (c, e) {
                    return const Center(child: CircularProgressIndicator());
                  },
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.productModel.images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.selectedImageIndex = index;
                    widget.pageController.jumpToPage(index);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 80,
                    width: 90,
                    clipBehavior: Clip.antiAlias,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: widget.selectedImageIndex == index
                            ? Colors.blue
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.productModel.images[index],
                      fit: BoxFit.fitHeight,
                      placeholder: (c, e) {
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorWidget: (c, u, e) {
                        return const Icon(Icons.error_outline_rounded);
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
