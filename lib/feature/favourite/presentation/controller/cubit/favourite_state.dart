import '../../../../home/data/model/product_model.dart';

sealed class FavouriteStates {}

final class FavouriteInitial extends FavouriteStates {}

final class FavouriteLoading extends FavouriteStates {}

final class AddFavouriteSuccess extends FavouriteStates {
  final String message;
  AddFavouriteSuccess({required this.message});
}

final class AddFavouriteFailure extends FavouriteStates {
  final String error;
  AddFavouriteFailure({required this.error});
}

final class DeleteFavouriteSuccess extends FavouriteStates {
  final String message;

  DeleteFavouriteSuccess({required this.message});
}

final class DeleteFavouriteFailure extends FavouriteStates {
  final String error;
  DeleteFavouriteFailure({required this.error});
}

final class FavouriteSuccess extends FavouriteStates {
  final List<ProductModel> products;
  FavouriteSuccess({required this.products});
}

final class FavouriteFailure extends FavouriteStates {
  final String error;
  FavouriteFailure({required this.error});
}
