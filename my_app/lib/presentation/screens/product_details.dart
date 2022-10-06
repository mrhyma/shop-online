import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/route_names.dart';
import '../../data/models/product.dart';
import '../../state/cart_cubit.dart';


class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(product.name),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, CART_ROUTE, arguments: product);
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.shopping_cart),
              ),
            )
          ],
        ),
        body: _body(context),
      );
  }


  Widget _body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 0.0, bottom: 8.0, right: 16.0),
      decoration: const BoxDecoration(color: Colors.blue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [

          Card(
              child: Column(
                children: <Widget>[
                  SizedBox(
                      width: MediaQuery.of(context).size.height / 2,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Image.network(product.image.imgUrl)
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height / 2,
                    height: MediaQuery.of(context).size.height / 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.description,
                        style: const TextStyle(color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
          ),
            Padding(
                padding: const EdgeInsets.all(7.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      ElevatedButton.icon(
                        onPressed: () {
                          BlocProvider.of<CartCubit>(context).addCartItem(product);
                        },
                        icon: const Icon( // <-- Icon
                          Icons.add_shopping_cart,
                          size: 24.0,
                        ),
                        label: const Text('add to cart'), // <-- Text
                      ),
                      const SizedBox(width: 30),
                      ElevatedButton.icon(
                        onPressed: () {
                          BlocProvider.of<CartCubit>(context).deleteItem(product);
                        },
                        icon: const Icon( // <-- Icon
                          Icons.remove_shopping_cart,
                          size: 24.0,
                        ),
                        label: const Text('remove from cart'), // <-- Text
                      )
                    ],
                  ),
                )
            ),
        ],
      ),
    );
  }
}