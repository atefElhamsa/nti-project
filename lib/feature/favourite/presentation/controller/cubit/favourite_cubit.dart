import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/favourite/presentation/controller/cubit/favourite_state.dart';
import 'package:nti_project/feature/home/data/model/product_model.dart';

import '../../../data/model/favourite_services.dart';

class FavouriteCubit extends Cubit<FavouriteStates> {
  FavouriteCubit() : super(FavouriteInitial());
  FavouriteServices favouriteServices = FavouriteServices();
  addFavouriteCubit({required String id}) async {
    emit(FavouriteLoading());
    try {
      var data = await favouriteServices.addFavourite(id: id);
      emit(AddFavouriteSuccess(message: data["message"]));
    } catch (e) {
      emit(AddFavouriteFailure(error: e.toString()));
      getFavouriteCubit();
    }
  }

  deleteFavouriteCubit({required String id}) async {
    emit(FavouriteLoading());
    try {
      var data = await favouriteServices.deleteFavourite(id: id);
      emit(DeleteFavouriteSuccess(message: data["message"]));
      getFavouriteCubit();
    } catch (e) {
      emit(DeleteFavouriteFailure(error: e.toString()));
    }
  }

  getFavouriteCubit() async {
    emit(FavouriteLoading());
    try {
      List<ProductModel> data = await favouriteServices.getFavourite();
      emit(FavouriteSuccess(products: data));
    } catch (e) {
      emit(FavouriteFailure(error: e.toString()));
    }
  }
}
