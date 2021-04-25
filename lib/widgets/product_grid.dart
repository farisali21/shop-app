import 'package:flutter/material.dart';
import 'package:market/models/product_data.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';


class ProductsGrid extends StatelessWidget {
  final bool favsProduct;
  ProductsGrid(this.favsProduct);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductData>(context);
    final products = favsProduct ? productData.favouriteItems : productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4 / 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        // create: (context) => products[index],
        value: products[index],
        child: ProductItem(
          // id: products[index].id,
          // title: products[index].title,
          // imageUrl: products[index].imageUrl,
        ),
      ),
      itemCount: products.length,
    );
  }
}
