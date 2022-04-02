// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  const Article({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Articles'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        
      ),
    );
  }
}