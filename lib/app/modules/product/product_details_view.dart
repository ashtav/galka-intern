import 'package:appfetch/app/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ProductDetailsView extends StatelessWidget {
  final Product product;
  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    String? thumbnail = product.thumbnail;
    String name = product.title.orIf();
    String description = product.description.orIf();
    String price = product.price.currency();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: LzListView(
        children: [
          LzImage(thumbnail, width: context.width).margin(b: 20),

          Text(name, style: Gfont.fs18),
          Textr(price, style: Gfont.fs20.bold, margin: Ei.only(b: 15)),
          Textr(description, style: Gfont.muted, margin: Ei.only(b: 25)),

          Col(
            children: ['Brand','Category'].generate((item, i) {
              List<String> values = [product.brand.orIf(), product.category.orIf().ucwords];

              return Container(
                padding: Ei.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Br.only(['t'], except: i == 0)
                ),
                child: Row(
                  mainAxisAlignment: Maa.spaceBetween,
                  children: [
                    Col(
                      children: [
                        Text(item, style: Gfont.muted),
                        Text(values[i]),
                      ],
                    ),
                    Icon([Ti.tag, Ti.category][i], color: Colors.black45)
                  ],
                ),
              );
            }),
          ).clip(all: 5).border(Br.all(), radius: Br.radius(5))
        ],
      ),
    );
  }
}
