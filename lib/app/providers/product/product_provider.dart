import 'package:appfetch/app/data/api/api.dart';
import 'package:appfetch/app/data/models/product.dart';
import 'package:fetchly/fetchly.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lazyui/lazyui.dart';

class ProductNotifier extends StateNotifier<AsyncValue<List<Product>>>
    with UseApi {
  final AutoDisposeStateNotifierProviderRef?
      ref; // if you want to use ref inside this provider

  ProductNotifier({this.ref}) : super(const AsyncValue.loading()) {
    // get data produk saat pertama kali halaman produk dimuat
    getProducts();
  }

  Future getProducts() async {
    try {
      // set loading state
      state = const AsyncValue.loading();

      // call api
      ResHandler res = await productApi.getProducts();

      // prepare data
      List data = res.body?['products'] ?? [];

      // set data
      state = AsyncValue.data(data.map((e) => Product.fromMap(e)).toList());
    } catch (e, s) {
      Errors.check(e, s, useList: true);
    }
  }
}

final productProvider = StateNotifierProvider.autoDispose<ProductNotifier,
    AsyncValue<List<Product>>>((ref) {
  return ProductNotifier(ref: ref);
});
