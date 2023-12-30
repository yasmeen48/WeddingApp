class Category {
  int CategoryId;
  String CategoryName;
  int NumOfShops;

  Category(
      {required this.CategoryId,
      required this.CategoryName,
      required this.NumOfShops});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      CategoryId: json['CategoryId'] as int,
      CategoryName: json['CategoryName'] as String,
      NumOfShops: json['NumOfShops'] as int,
    );
  }
}
