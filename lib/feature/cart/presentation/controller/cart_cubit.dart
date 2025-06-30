import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/cart/data/model/cart_services.dart';
import 'package:nti_project/feature/home/data/model/product_model.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartServices cartServices = CartServices();
  addCartCubit({required String productId, required int quantity}) async {
    emit(CartLoading());
    try {
      final data = await cartServices.addCart(
        productId: productId,
        quantity: quantity,
      );
      emit(AddCartSuccess(message: data["message"]));
    } catch (e) {
      emit(AddCartFailure(error: e.toString()));
    }
  }

  getCartCubit() async {
    emit(CartLoading());
    try {
      List<ProductModel> carts = await cartServices.getCart();
      emit(CartSuccess(carts: carts));
    } catch (e) {
      emit(CartFailure(error: e.toString()));
    }
  }
}
