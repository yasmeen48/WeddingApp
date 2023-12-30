class Saloon {
  int ShopId;
  String CategoryName;
  int CategoryId;
  String ArtistGender;
  String Service;
  String PriceRange;
  String img1;
  String img2;
  String img3;

  Saloon(
      {required this.ShopId,
      required this.CategoryName,
      required this.ArtistGender,
      required this.Service,
      required this.PriceRange,
      required this.CategoryId,
      required this.img1,
      required this.img2,
      required this.img3});
  factory Saloon.fromJson(Map<String, dynamic> json) {
    return Saloon(
      ShopId: json['ShopId'] as int,
      CategoryName: json['categoryName'] as String,
      CategoryId: json['categoryId'] as int,
      ArtistGender: json['ArtistGender'] as String,
      Service: json['Service'] as String,
      PriceRange: json[' PriceRange'] as String,
      img1: json['img1'] as String,
      img2: json['img2'] as String,
      img3: json['img3'] as String,
    );
  }
}
