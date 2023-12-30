import 'package:flutter/material.dart';

class WeddingInfo {
  int WeddingNum;
  int UserId;
  String BrideName;
  String GroomName;
  DateTime WeddingDate;
  TimeOfDay WeddingTime;

  WeddingInfo(
      {required this.WeddingNum,
      required this.UserId,
      required this.BrideName,
      required this.GroomName,
      required this.WeddingDate,
      required this.WeddingTime});
  factory WeddingInfo.fromJson(Map<String, dynamic> json) {
    return WeddingInfo(
      WeddingNum: json['WeddingNum'] as int,
      UserId: json['UserId'] as int,
      BrideName: json['BrideName'] as String,
      GroomName: json['GroomName'] as String,
      WeddingDate: json['WeddingDate'] as DateTime,
      WeddingTime: json['WeddingTime'] as TimeOfDay,
    );
  }
}
