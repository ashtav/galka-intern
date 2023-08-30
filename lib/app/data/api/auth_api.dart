part of api;

class ProductApi extends Fetchly {
  Future<ResHandler> getProducts() async => await get('products');
}
