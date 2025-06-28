import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_project/feature/home/data/model/product_model.dart';
import 'package:nti_project/feature/home/presentation/controller/cubit/product_state.dart';

import '../../../data/model/get_data.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitial());
  getDataCubit() async {
    emit(ProductLoading());
    try {
      final List<ProductModel> products = await GetData().getData();
      emit(ProductSuccess(products: products));
    } catch (e) {
      emit(ProductFailure(error: e.toString()));
    }
  }
}
