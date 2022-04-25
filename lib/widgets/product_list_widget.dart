// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_nodejsonapi/models/product.dart';
import 'package:flutter_nodejsonapi/widgets/product_list_row.dart';

class ProductListWidget extends StatefulWidget {
  ProductListWidget(this.products, {Key? key}) : super(key: key);
  List<Product> products = <Product>[];

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 434,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.products.length, (index) {
              return ProductListRowWidget(widget.products[index]);
            }),
          ),
        ),
      ],
    );
  }
}
