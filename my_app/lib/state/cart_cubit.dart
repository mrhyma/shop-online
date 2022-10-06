import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_app/services/repository.dart';
import 'package:my_app/state/products_cubit.dart';

import '../data/models/product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final Repository repository;
  final ProductsCubit productsCubit;

  CartCubit({required this.repository, required this.productsCubit}) : super(CartInitial());

  void getCartItems(){
    repository.getCartItems().then((items){
      emit(CartItemsLoaded(cartItems: items));
    });
  }

  void updateCartItems(ProductModel product, int id) {
    final currentState = state;
    repository.updateCartItem(product, id).then((isUpdated){
      if (currentState is CartItemsLoaded) {
        emit(CartItemsLoaded(cartItems: currentState.cartItems));
      }
    });

  }

  void addCartItem(ProductModel product) {
    final currentState = state;
    repository.addItemToCart(product).then((value){
      if (currentState is CartItemsLoaded) {
        final cartList = currentState.cartItems;
        cartList.add(product);
        emit(CartItemsLoaded(cartItems: cartList));
      }
    });

  }

  void deleteItem(ProductModel product) {
    final currentState = state;
    repository.deleteCartItem(product.webId).then((isDeleted){
      if (currentState is CartItemsLoaded) {
        emit(CartItemsLoaded(cartItems: currentState.cartItems));
      }
    });
  }
}
