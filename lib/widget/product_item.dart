// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String pName;
  final String pImage;
  final String pCategory;
  final String pPrice;

  const ProductItem({
    Key? key,
    required this.pImage,
    required this.pCategory,
    required this.pName,
    required this.pPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Image.network(
                pImage,
                height: 100,
                width: 100,
              ),
            ),
          ),
          Container(
            child: Text(
              pName,
              maxLines: 1,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Container(
            child: Text(
              pCategory,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      '\$$pPrice',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10.0,
                      ),
                    ),
                  ),
                  child: Text(
                    'Promo',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
