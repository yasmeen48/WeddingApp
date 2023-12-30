class BrideDress {
  int ShopId;
  String CategoryName;
  int CategoryId;
  String Dealing;
  String PriceRange;
  String ServiceInfo;

  String img1;
  String img2;
  String img3;

  BrideDress(
      {required this.ShopId,
      required this.CategoryName,
      required this.Dealing,
      required this.PriceRange,
      required this.ServiceInfo,
      required this.CategoryId,
      required this.img1,
      required this.img2,
      required this.img3});
  factory BrideDress.fromJson(Map<String, dynamic> json) {
    return BrideDress(
      CategoryName: json['categoryName'] as String,
      CategoryId: json['categoryId'] as int,
      ShopId: json['ShopId'] as int,
      Dealing: json['Dealing'] as String,
      PriceRange: json['PriceRange'] as String,
      ServiceInfo: json['ServiceInfo'] as String,
      img1: json['img1'] as String,
      img2: json['img2'] as String,
      img3: json['img3'] as String,
    );
  }
}
