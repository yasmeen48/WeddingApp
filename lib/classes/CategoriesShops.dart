class CategoriesShops {
  int ShopId;
  int CategoryId;
  // add in back end and data base
  String CategoryName;
  String ShopName;
  String WebsiteLink;
  String PhoneNum;
  String Location;
  String WorkingHour;
  String StoreType;
  int NumOfVisit;
  String img;
  CategoriesShops({
    required this.CategoryName,
    required this.ShopId,
    required this.CategoryId,
    required this.ShopName,
    required this.WebsiteLink,
    required this.PhoneNum,
    required this.Location,
    required this.WorkingHour,
    required this.StoreType,
    required this.NumOfVisit,
    required this.img,
  });
  factory CategoriesShops.fromJson(Map<String, dynamic> json) {
    return CategoriesShops(
      CategoryName: json['categoryName'] as String,
      ShopId: json['int ShopId'] as int,
      CategoryId: json['CategoryId'] as int,
      ShopName: json['ShopName'] as String,
      WebsiteLink: json['WebsiteLinkl'] as String,
      PhoneNum: json['PhoneNum'] as String,
      Location: json['Location'] as String,
      WorkingHour: json['WorkingHour'] as String,
      StoreType: json['StoreType'] as String,
      NumOfVisit: json['NumOfVisit'] as int,
      img: json['img'] as String,
    );
  }
}
