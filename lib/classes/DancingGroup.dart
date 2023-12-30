class DancingGroup {
  int ShopId;
  String CategoryName;
  int CategoryId;
  String Service;
  String GroupGender;
  String PriceRange;
  String img;

  DancingGroup({
    required this.ShopId,
    required this.CategoryName,
    required this.Service,
    required this.GroupGender,
    required this.PriceRange,
    required this.CategoryId,
    required this.img,
  });
  factory DancingGroup.fromJson(Map<String, dynamic> json) {
    return DancingGroup(
      ShopId: json['ShopId'] as int,
      CategoryName: json['categoryName'] as String,
      CategoryId: json['categoryId'] as int,
      Service: json['Service'] as String,
      GroupGender: json['GroupGender'] as String,
      PriceRange: json[' PriceRange'] as String,
      img: json['img1'] as String,
    );
  }
}
