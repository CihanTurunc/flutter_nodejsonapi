import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_nodejsonapi/data/api/category_api.dart';
import 'package:flutter_nodejsonapi/data/api/product_api.dart';
import 'package:flutter_nodejsonapi/models/category.dart';
import 'package:flutter_nodejsonapi/models/product.dart';
import 'package:flutter_nodejsonapi/widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Category> categories = <Category>[];
  List<Widget> categoryWidgets = <Widget>[];
  List<Product> products = <Product>[];

  @override
  void initState() {
    getCategoriesFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alışveriş Sistemi",
          style:
              TextStyle(color: Colors.white, backgroundColor: Colors.blueGrey),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SingleChildScrollView(              
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            ),
            ProductListWidget(products),
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        categories =
            list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (var i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return OutlinedButton(
      onPressed: () {
        getProductsByCategoryId(category);
      },
      child: Text(
        category.categoryName,
        style: const TextStyle(
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        products = list.map((product) => Product.fromJson(product)).toList();
        getCategoryWidgets();
      });
    });
  }
}
