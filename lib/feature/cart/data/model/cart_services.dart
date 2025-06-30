import 'package:dio/dio.dart';

import '../../../home/data/model/product_model.dart';

class CartServices {
  final Dio dio = Dio();
  List<ProductModel> carts = [];

  addCart({required String productId, required int quantity}) async {
    var response = await dio.post(
      "https://elwekala.onrender.com/cart/add",
      data: {
        "nationalId": "01009876567876",
        "productId": productId,
        "quantity": quantity,
      },
    );
    final data = response.data;
    return data;
  }

  Future<List<ProductModel>> getCart() async {
    var response = await dio.get(
      "https://elwekala.onrender.com/cart/allProducts",
      data: {"nationalId": "01009876567876"},
    );
    List data = response.data["products"];
    carts = data.map((e) => ProductModel.fromJson(e)).toList();
    return carts;
  }
}
