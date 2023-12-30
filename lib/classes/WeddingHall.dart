class WeddingHall {
  int ShopId;
  String CategoryName;
  int CategoryId;
  String HallType;
  String PriceRange;
  String Service;
  String img1;
  String img2;
  String img3;

  WeddingHall(
      {required this.ShopId,
      required this.CategoryName,
      required this.HallType,
      required this.PriceRange,
      required this.Service,
      required this.CategoryId,
      required this.img1,
      required this.img2,
      required this.img3});
  factory WeddingHall.fromJson(Map<String, dynamic> json) {
    return WeddingHall(
      ShopId: json['ShopId'] as int,
      CategoryName: json['categoryName'] as String,
      CategoryId: json['categoryId'] as int,
      HallType: json['HallType'] as String,
      PriceRange: json[' PriceRange'] as String,
      Service: json['Service'] as String,
      img1: json['img1'] as String,
      img2: json['img2'] as String,
      img3: json['img3'] as String,
    );
  }
}
