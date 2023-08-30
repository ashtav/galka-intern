library api;

import 'package:fetchly/fetchly.dart';

part 'auth_api.dart';
part 'product_api.dart';

mixin UseApi {
  ProductApi productApi = ProductApi();
  AuthApi authApi = AuthApi();
}
