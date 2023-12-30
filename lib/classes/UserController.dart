// ignore_for_file: non_constant_identifier_names

class UserController {
  int VisitId;
  int WeddingNum;
  int CategoryId;
  int SubCategoryId;
  int ChatId;

  UserController({
    required this.VisitId,
    required this.WeddingNum,
    required this.CategoryId,
    required this.SubCategoryId,
    required this.ChatId,
  });
  factory UserController.fromJson(Map<String, dynamic> json) {
    return UserController(
      VisitId: json['VisitId'] as int,
      WeddingNum: json['WeddingNum'] as int,
      CategoryId: json['CategoryId'] as int,
      SubCategoryId: json['SubCategoryId'] as int,
      ChatId: json['ChatId'] as int,
    );
  }
}
