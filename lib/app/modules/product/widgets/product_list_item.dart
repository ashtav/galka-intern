import 'package:appfetch/app/data/models/product.dart';
import 'package:appfetch/app/providers/product/product_provider.dart';
import 'package:appfetch/app/routes/paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazyui/lazyui.dart' hide ContextExtension;

class ProductListItem extends StatelessWidget {
  final ProductNotifier notifier;
  final Product product;
  final int index;
  const ProductListItem(
      {super.key,
      required this.notifier,
      required this.product,
      this.index = 0});

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
          Row(
            children: [
              LzImage(thumbnail, size: 70).margin(r: 15),
              Col(
                children: [
                  Text(name, overflow: Tof.ellipsis),
                  Text(price),
                ],
              ).flexible()
            ],
          ).flexible(),
          Iconr(
            Ti.trash,
            color: Colors.redAccent,
            padding: Ei.sym(v: 10),
          ).onTap(() {
            LzConfirm(
                title: 'Delete Product',
                message: 'Are you sure want to delete this product?',
                onConfirm: () {
                  notifier.deleteProduct(product.id!);
                }).show(context);
          })
        ],
      ),
    );
  }
}
