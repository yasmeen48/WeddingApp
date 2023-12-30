class UserRegister {
  int UserId;
  String Name;
  String UserName;
  String Email;
  String PhoneNumber;
  String Location;
  String Password;
  String Type;
  UserRegister(
      {required this.UserId,
      required this.Name,
      required this.UserName,
      required this.Email,
      required this.PhoneNumber,
      required this.Location,
      required this.Password,
      required this.Type});
  factory UserRegister.fromJson(Map<String, dynamic> json) {
    return UserRegister(
      UserId: json['UserId'] as int,
      Name: json['Name'] as String,
      UserName: json['UserName'] as String,
      Email: json['Email'] as String,
      PhoneNumber: json['PhoneNumber'] as String,
      Location: json['Location'] as String,
      Password: json['Password'] as String,
      Type: json['Type'] as String,
    );
  }
}
