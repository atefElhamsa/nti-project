import 'package:dio/dio.dart';

import '../../../home/data/model/product_model.dart';

class FavouriteServices {
  final Dio dio = Dio();
  List<ProductModel> favouriteProducts = [];

  addFavourite({required String id}) async {
    var response = await dio.post(
      "https://elwekala.onrender.com/favorite",
      data: {"nationalId": "01009876567876", "productId": id},
    );
    final data = response.data;
    return data;
  }

  deleteFavourite({required String id}) async {
    var response = await dio.delete(
      "https://elwekala.onrender.com/favorite",
      data: {"nationalId": "01009876567876", "productId": id},
    );
    final data = response.data;
    return data;
  }

  Future<List<ProductModel>> getFavourite() async {
    var response = await dio.get(
      "https://elwekala.onrender.com/favorite",
      data: {"nationalId": "01009876567876"},
    );
    List data = response.data["favoriteProducts"];
    favouriteProducts = data.map((e) => ProductModel.fromJson(e)).toList();
    return favouriteProducts;
  }
}
