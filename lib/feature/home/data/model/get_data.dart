import 'package:dio/dio.dart';
import 'package:nti_project/feature/home/data/model/product_model.dart';

class GetData {
  final Dio dio = Dio();
  List<ProductModel> products = [];
  Future<List<ProductModel>> getData() async {
    var response = await dio.get(
      'https://elwekala.onrender.com/product/Laptops',
    );
    List<dynamic> data = response.data["product"] as List;
    products = data.map((e) => ProductModel.fromJson(e)).toList();
    return products;
  }
}
