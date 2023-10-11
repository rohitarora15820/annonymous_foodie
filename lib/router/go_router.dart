import 'package:anonymous_foodie/view/dashboard/home/products_list.dart';
import 'package:anonymous_foodie/view/get_started.dart';
import 'package:anonymous_foodie/view/dashboard/landing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../model/product_model.dart';
import '../view/detail/product_detail.dart';
import '../view/splash.dart';

var routerProvider = Provider((ref) => GoRouter(initialLocation: '/', routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/started',
        builder: (context, state) => const GetStarted(),
      ),
      GoRoute(
        path: '/landing',
        builder: (context, state) => const LandingPage(),
      ),
      GoRoute(
        path: '/product',
        name: 'product',
        builder: (context, state) => ProductList(
          categoryName: state.queryParameters['categoryName']!,
        ),
      ),
      GoRoute(
          path: '/productDetail',
          name: 'productDetail',
          builder: (context, state) {
            final ProductModel model = state.extra as ProductModel;
            return ProductDetail(
              productModel: model,
            );
          }),
    ]));
