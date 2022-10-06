


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/state/cart_cubit.dart';

import '../../data/models/product.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartCubit>(context).getCartItems();
    const title = 'Cart Page';

    return Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is! CartItemsLoaded) {
              return const Center(child: CircularProgressIndicator());
            }

            final cartItems = (state).cartItems;

            return GridView.count(
                crossAxisCount: 1,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: List.generate(cartItems.length, (index) {
                  return Column(
                    children: cartItems.map((e) => _item(e, context)).toList(),
                  );
                }
                )
            );
          },
        )
    );
  }

  Widget _item(ProductModel product, context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '', arguments: product),
      child: _productTile(product, context),
    );
  }

  Widget _productTile(ProductModel product, context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(""),
        ],
      ),
    );
  }
}
