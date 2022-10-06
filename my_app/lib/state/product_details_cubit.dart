import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_app/data/models/product_inventory.dart';
import 'package:my_app/state/products_cubit.dart';

import '../services/repository.dart';
import 'cart_cubit.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final Repository repository;
  final ProductsCubit productsCubit;

  ProductDetailsCubit({
    required this.productsCubit,
    required this.repository
}) :super(ProductDetailsInitial());


}
