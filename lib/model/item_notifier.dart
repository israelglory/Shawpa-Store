import 'package:flutter/cupertino.dart';
import 'package:shawpa/model/service.dart';

class ItemNotifier with ChangeNotifier {
  List<Product> productList = [];
  List<double> pric = [];

  addItem(Product item) {
    productList.add(item);
    notifyListeners();
  }

  addprice(double pprice){
    pric.add(pprice);
    notifyListeners();
  }

  removeItem(Product item, double pprice) {
    productList.remove(item);
    pric.remove(pprice);
    notifyListeners();
  }
  
}
