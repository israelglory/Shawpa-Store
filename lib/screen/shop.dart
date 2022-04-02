// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:shawpa/model/service.dart';
import 'package:shawpa/screen/product_detail.dart';
import 'package:shawpa/widget/product_item.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  late Future<List<Product>> futureShopProduct;

  @override
  void initState() {
    super.initState();
    futureShopProduct = fetchShopProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Store'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container( 
              child: Text(
                'All Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FutureBuilder<List<Product>>(
              future: futureShopProduct,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: List.generate(snapshot.data!.length, (index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      return ProductDetails(
                                          products: snapshot.data![index],
                                          );
                                    }),
                                  );
                          },
                          child: ProductItem(
                            pImage: snapshot.data![index].image,
                            pCategory: snapshot.data![index].category,
                            pName: snapshot.data![index].title,
                            pPrice: snapshot.data![index].price.toString(),
                          ),
                        );
                      }),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
