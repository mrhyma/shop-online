import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/product.dart';
import '../data/models/product_inventory.dart';
import '../services/repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final Repository repository;
  ProductsCubit({required this.repository}) : super(ProductsInitial());

  void getProducts(){
    repository.getProducts().then((products){
      emit(ProductsLoaded(products: products));
    });
  }
}
