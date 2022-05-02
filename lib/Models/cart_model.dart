// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.items,
    this.subtotal,
  });

  Items items;
  String subtotal;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    items: Items.fromJson(json["items"]),
    subtotal: json["subtotal"],
  );

  Map<String, dynamic> toJson() => {
    "items": items.toJson(),
    "subtotal": subtotal,
  };
}

class Items {
  Items({
    this.itemNo,
  });

  ItemNo itemNo;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    itemNo: ItemNo.fromJson(json["c7ffff259e09fb05e7d6a3fa0f4d7554"]),
  );

  Map<String, dynamic> toJson() => {
    "c7ffff259e09fb05e7d6a3fa0f4d7554": itemNo.toJson(),
  };
}

class ItemNo {
  ItemNo({
    this.rowId,
    this.name,
    this.qty,
    this.product,
  });

  String rowId;
  String name;
  String qty;
  Product product;

  factory ItemNo.fromJson(Map<String, dynamic> json) => ItemNo(
    rowId: json["rowId"],
    name: json["name"],
    qty: json["qty"],
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "rowId": rowId,
    "name": name,
    "qty": qty,
    "product": product.toJson(),
  };
}

class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.description,
    this.thumbnail,
    this.status,
    this.createdAt,
  });

  int id;
  String name;
  String price;
  String description;
  String thumbnail;
  String status;
  DateTime createdAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    thumbnail: json["thumbnail"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "thumbnail": thumbnail,
    "status": status,
    "created_at": createdAt.toIso8601String(),
  };
}
