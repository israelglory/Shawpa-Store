// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:shawpa/model/service.dart';
import 'package:shawpa/screen/product_detail.dart';
import 'package:shawpa/widget/grid_item.dart';
import 'package:shawpa/widget/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade50,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('Shawpa'),
        actions: [
          Icon(
            Icons.inbox_outlined,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 5.0,
            ),
            child: Icon(
              Icons.notifications,
              color: Colors.blue,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          margin: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                child: Text(
                  'Discover',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15.0),
                child: Text(
                  'Find anything what you want',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 5.0),
                        color: Colors.white,
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      margin: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10.0,
                          ),
                        ),
                      ),
                      child: Icon(
                        Icons.filter_alt_sharp,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 4,
                children: [
                  GridItem(Icons.grid_view_sharp, 'See all'),
                  GridItem(Icons.chair, 'Funiture'),
                  GridItem(Icons.electrical_services, 'Electricity'),
                  GridItem(Icons.card_giftcard, 'Promo'),
                  GridItem(Icons.car_repair, 'Automotive'),
                  GridItem(Icons.account_balance_wallet, 'My Wallet'),
                  GridItem(Icons.phone_android, 'Gadget'),
                  GridItem(Icons.travel_explore, 'Travel'),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 20.0, 0, 15.0),
                child: Text(
                  'Super Hot Promo',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FutureBuilder<List<Product>>(
                future: futureProduct,
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
      ),
    );
  }
}
