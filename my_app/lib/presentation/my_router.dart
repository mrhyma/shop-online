import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/constants/route_names.dart';
import 'package:my_app/data/models/product_inventory.dart';
import 'package:my_app/presentation/screens/cart.dart';
import 'package:my_app/presentation/screens/home.dart';
import 'package:my_app/presentation/screens/login.dart';
import 'package:my_app/presentation/screens/product_details.dart';
import 'package:my_app/state/product_details_cubit.dart';
import 'package:my_app/state/products_cubit.dart';

import '../data/models/product.dart';
import '../services/network_services.dart';
import '../services/repository.dart';
import '../state/cart_cubit.dart';
import '../state/login_cubit.dart';

class AppRouter {
  late Repository repository;
  late LoginCubit loginCubit;
  late ProductsCubit productsCubit;
  late CartCubit cartCubit;


  AppRouter()
  {
    repository = Repository(api: API());
    loginCubit = LoginCubit(repository: repository);
    productsCubit = ProductsCubit(repository: repository);
    cartCubit = CartCubit(repository: repository, productsCubit: productsCubit);

  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: productsCubit,
            child: const HomePage(),
          ),
        );
      case PRODUCT_DETAILS_ROUTE:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => CartCubit(
              repository: repository,
              productsCubit: productsCubit,
            ),
            child: ProductDetailsScreen(product: product,),
          ),
        );
      case CART_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: cartCubit,
            child: const CartPage(),
          ),
        );
      // case LOGIN_ROUTE:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider.value(
      //       value: loginCubit,
      //       child: const LoginScreen(),
      //       ),
      //   );
      default:
        return null;
    }
  }
}