import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/route_names.dart';
import '../../data/models/product.dart';
import '../../state/products_cubit.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductsCubit>(context).getProducts();
    const title = 'Home Page';

    return Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is! ProductsLoaded) {
              return const Center(child: CircularProgressIndicator());
            }

            final products = (state).products;

            return GridView.count(
                crossAxisCount: 1,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: List.generate(products.length, (index) {
                    return Column(
                      children: products.map((e) => _product(e, context)).toList(),
                    );
                }
                )
            );
          },
        )
        );
  }

  Widget _product(ProductModel product, context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, PRODUCT_DETAILS_ROUTE, arguments: product),
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
      child: Text(product.name),
    );
  }
}
