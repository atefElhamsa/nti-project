import 'package:nti_project/feature/home/data/model/product_model.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class AddCartSuccess extends CartState {
  final String message;
  AddCartSuccess({required this.message});
}

final class AddCartFailure extends CartState {
  final String error;
  AddCartFailure({required this.error});
}

final class CartSuccess extends CartState {
  final List<ProductModel> carts;

  CartSuccess({required this.carts});
}

final class CartFailure extends CartState {
  final String error;
  CartFailure({required this.error});
}
