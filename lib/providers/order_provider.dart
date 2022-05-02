import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier{
List<Map<String,dynamic>> _bagList = [];

List<Map<String,dynamic>> getList() => _bagList;

void setBagList({List<Map<String,dynamic>> bagList}){
   _bagList = bagList;
   notifyListeners();
}

List getBagList() {
   return _bagList;
}
}