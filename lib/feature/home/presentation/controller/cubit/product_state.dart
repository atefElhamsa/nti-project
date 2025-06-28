import '../../../data/model/product_model.dart';

sealed class ProductStates {}

final class ProductInitial extends ProductStates {}

final class ProductLoading extends ProductStates {}

final class ProductSuccess extends ProductStates {
  final List<ProductModel> products;

  ProductSuccess({required this.products});
}

final class ProductFailure extends ProductStates {
  final String error;

  ProductFailure({required this.error});
}
