// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  IconData itemIcon;
  String text;
  GridItem(this.itemIcon, this.text, {Key? key}) : super(key: key) ;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                itemIcon,
                color: Colors.orange,
                size: 50,
              ),
            ),
            Container(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
