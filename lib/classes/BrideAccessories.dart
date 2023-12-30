import 'package:flutter/foundation.dart';

class BrideAccessories {
  int ShopId;
  //add in back end classes
  String CategoryName;
  int CategoryId;
  String Itemid;
  String ItemName;
  int Price;
  String ItemInfo;
  String ItemImage;

  BrideAccessories(
      {required this.ShopId,
      required this.CategoryName,
      required this.Itemid,
      required this.ItemName,
      required this.Price,
      required this.ItemInfo,
      required this.ItemImage,
      required this.CategoryId});
  factory BrideAccessories.fromJson(Map<String, dynamic> json) {
    return BrideAccessories(
      CategoryName: json['categoryName'] as String,
      ShopId: json['ShopId'] as int,
      CategoryId: json['categoryId'] as int,
      Itemid: json['Itemid'] as String,
      ItemName: json['ItemName'] as String,
      Price: json['Price'] as int,
      ItemInfo: json['ItemInfo'] as String,
      ItemImage: json['ItemImage'] as String,
    );
  }
}
