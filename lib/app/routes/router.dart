import 'package:appfetch/app/data/local/shared_preferences.dart';
import 'package:appfetch/app/data/models/product.dart';
import 'package:appfetch/app/modules/login/login_view.dart';
import 'package:appfetch/app/modules/product/product_details_view.dart';
import 'package:appfetch/app/modules/product/product_view.dart';
import 'package:appfetch/app/modules/training/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazyui/lazyui.dart';

import '../modules/login/custom_login_view.dart';
import 'paths.dart';

final GoRouter router = GoRouter(
  initialLocation: Paths.dashboard,
  routes: <RouteBase>[
    GoRoute(
        path: Paths.login,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginView(), redirect: (context, _) async => _getRouteName(context)),
            
    GoRoute(
        path: Paths.product,
        builder: (BuildContext context, GoRouterState state) =>
            const ProductView()),

    GoRoute(
        path: Paths.productDetails,
        builder: (BuildContext context, GoRouterState state) =>
            ProductDetailsView(product: state.extra as Product)),

    GoRoute(
        path: Paths.customLogin,
        builder: (BuildContext context, GoRouterState state) =>
            const CustomLoginView()),

    GoRoute(
        path: Paths.dashboard,
        builder: (BuildContext context, GoRouterState state) =>
            const DashboardView()),
  ],
);

String _getRouteName(BuildContext context) {
  String? token = prefs.getString('token');
  return token.hasNullOrEmpty ? Paths.login : Paths.product;
}