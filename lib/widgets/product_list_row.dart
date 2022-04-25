// ignore_for_file: sized_box_for_whitespace

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_nodejsonapi/models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  ProductListRowWidget(this.product, {Key? key}) : super(key: key);
  Product product;

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            Container(
              child: Image.network(
                  "https://thumbs.dreamstime.com/z/fresh-fruit-basket-6498848.jpg"),
              height: 110,
              width: MediaQuery.of(context).size.width / 2,
            ),
            Text(product.productName),
            Text(
              product.unitPrice.toString() + " ₺",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
