import 'package:appfetch/app/data/models/product.dart';
import 'package:appfetch/app/routes/paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazyui/lazyui.dart' hide ContextExtension;

class ProductListItem extends StatelessWidget {
  final Product product;
  final int index;
  const ProductListItem({super.key, required this.product, this.index = 0});

  @override
  Widget build(BuildContext context) {
    String? thumbnail = product.thumbnail;
    String name = product.title.orIf();
    String price = product.price.currency();

    return InkTouch(
      onTap: () {
        context.push(Paths.productDetails, extra: product);
      },
      border: Br.only(['t'], except: index == 0),
      padding: Ei.all(20),
      child: Row(
        children: [
          LzImage(thumbnail, size: 70).margin(r: 15),
          Col(
            children: [
              Text(name, overflow: Tof.ellipsis),
              Text(price),
            ],
          ).flexible()
        ],
      ),
    );
  }
}
