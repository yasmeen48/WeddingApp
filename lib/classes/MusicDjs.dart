class MusicDjs {
  int ShopId;
  String CategoryName;
  int CategoryId;
  String Service;
  String PriceRange;
  String img;

  MusicDjs({
    required this.ShopId,
    required this.CategoryName,
    required this.Service,
    required this.PriceRange,
    required this.CategoryId,
    required this.img,
  });
  factory MusicDjs.fromJson(Map<String, dynamic> json) {
    return MusicDjs(
      ShopId: json['ShopId'] as int,
      CategoryName: json['categoryName'] as String,
      CategoryId: json['categoryId'] as int,
      Service: json['Service'] as String,
      PriceRange: json[' PriceRange'] as String,
      img: json['img1'] as String,
    );
  }
}
