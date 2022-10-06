part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}


class CartItemsLoaded extends CartState {
  final List<ProductModel> cartItems;
  CartItemsLoaded({required this.cartItems});
}

class CartIsCreated extends CartState {}
