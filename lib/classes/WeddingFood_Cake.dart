class WeddingFood_Cake {
  int ShopId;
  String CategoryName;
  int CategoryId;
  String Service;
  String PriceRange;
  String img1;
  String img2;
  String img3;

  WeddingFood_Cake(
      {required this.ShopId,
      required this.CategoryName,
      required this.Service,
      required this.PriceRange,
      required this.CategoryId,
      required this.img1,
      required this.img2,
      required this.img3});
  factory WeddingFood_Cake.fromJson(Map<String, dynamic> json) {
    return WeddingFood_Cake(
      ShopId: json['ShopId'] as int,
      CategoryName: json['categoryName'] as String,
      CategoryId: json['categoryId'] as int,
      Service: json['Service'] as String,
      PriceRange: json[' PriceRange'] as String,
      img1: json['img1'] as String,
      img2: json['img2'] as String,
      img3: json['img3'] as String,
    );
  }
}
