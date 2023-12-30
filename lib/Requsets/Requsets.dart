import 'dart:convert';
import 'package:weddingplanner/auth/catagory.dart';
import 'package:weddingplanner/classes/BrideAccessories.dart';
import 'package:weddingplanner/classes/Category.dart';
import 'package:weddingplanner/classes/CategoriesShops.dart';
import "package:weddingplanner/backend/constant.dart";
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:weddingplanner/classes/WeddingInfo.dart';
import '../classes/User.dart';

class Requset {
//get category
  // ignore: non_constant_identifier_names
  Future<List<Category>> GetCategory() async {
    String url2 = url;
    String apiname = getcategory;
    final url1 =
        '$url2$apiname'; //الي بعد ؟ اسمو بال back end "الي بعد$ بالفرونت" ////؟=$ بينهم &
    final response = await http.get(Uri.parse(url1));
    if (response.statusCode == 200) {
      final caregories = jsonDecode(response.body).cast<Map<String, dynamic>>();
      List<Category> result = caregories
          .map<Category>((json) => Category.fromJson(json))
          .toList(); //اتاكد ********
      return result;
    } else
      throw Exception('Failed to load categories');
  }

  ////////////////
  /*Future<List<UserRegister>> Getuserinfo(int UserId) async {
    String url2 = url;
    String apiname = userinfoApi;
    final url1 =
        '$url2$apiname?UserId==$UserId'; //الي بعد ؟ اسمو بال back end "الي بعد$ بالفرونت" ////؟=$ بينهم &
    final response = await http.get(Uri.parse(url1));
    if (response.statusCode == 200) {
      final caregories = jsonDecode(response.body).cast<Map<String, dynamic>>();
      List<UserRegister> result = caregories
          .map<UserRegister>((json) => UserRegister.fromJson(json))
          .toList(); //اتاكد ********
      return result;
    } else
      throw Exception('Failed to load UserInfo');
  }
  */

  //api get forgetpassword
  Future<String> forgetPass(String Email) async {
    String url2 = url;
    String apiname = forgetpassword;
    final url1 =
        '$url2$apiname?&Email=$Email'; //الي بعد ؟ اسمو بال back end "الي بعد$ بالفرونت" ////؟=$ بينهم &
    final response = await http.get(Uri.parse(url1));
    if (response.statusCode == 200) {
      final password = response.body;
      return password;
    } else
      throw Exception('Failed to update password');
  }

  ///api get categoryitem
  ///// need update from backend add ocation to the api method and add where location
  ///// string country = location.split(,)
  /// where location contains country[1]
  Future<List<CategoriesShops>> GetCategoryItem(int Categoryid) async {
    String url2 = url;
    String apiname = getcategoryitem;
    final url1 =
        '$url2$apiname?CategoryId==$Categoryid'; //الي بعد ؟ اسمو بال back end "الي بعد$ بالفرونت" ////؟=$ بينهم &
    final response = await http.get(Uri.parse(url1));
    if (response.statusCode == 200) {
      final caregoryitems =
          jsonDecode(response.body).cast<Map<String, dynamic>>();
      List<CategoriesShops> result = caregoryitems
          .map<CategoriesShops>((json) => CategoriesShops.fromJson(json))
          .toList(); //اتاكد ********
      return result;
    } else
      throw Exception('Failed to load categoryItems');
  }

///////////////////////
  ///
  ///
  /// the catgory id must be bassed to this method to be used
  ///
  Future<List<dynamic>> GetCItemdetalis(
      String categorydescripption, int shopid) async {
    String url2 = url;
    String apiname = getCIdetailes;
    final url1 =
        '$url2$apiname?categorydescripption==$categorydescripption&shopid==$shopid'; //الي بعد ؟ اسمو بال back end "الي بعد$ بالفرونت" ////؟=$ بينهم &
    final response = await http.get(Uri.parse(url1));
    if (response.statusCode == 200) {
      // object is dynamic ? dynamic list
      List<dynamic> list = (jsonDecode(response.body)["data"] as List)
          .map((dynamic e) => e as Map<String, dynamic>)
          .toList();
      return list;
    }
    // then check the List[0].CategoryName
    // if (List[0].CategoryName == 'Accessories')
    /* {
              List<BrideAccessories> listofaccessories=[];
              listofaccessories.addAll(list);

       }*/
    // if (List[0].CategoryName == 'Dress')
    /* {
              List<BrideDress> listofdress=[];
              listofdess.addAll(list);

       }*/
    // if (List[0].CategoryName == 'DancingGroup')
    /* {
              List<DancingGroup> listofDancingGroup=[];
              listofDancingGroup.addAll(list);

       }*/
    // if (List[0].CategoryName == 'MusicDjs')
    /* {
              List<MusicDjs> listofMusicDjs=[];
              listofMusicDjs.addAll(list);

       }*/
    // if (List[0].CategoryName == 'PhotographicStudio')
    /* {
              List<BrideAccessories> listofPhotographicStudio=[];
              listofPhotographicStudio.addAll(list);

       }*/
    // if (List[0].CategoryName == 'PlacesToShoot')
    /* {
              List<PlacesToShoot> listofPlacesToShoot=[];
              listofPlacesToShoot.addAll(list);

       }*/
    // if (List[0].CategoryName == 'Saloon')
    /* {
              List<Saloon> listofSaloon=[];
              listofSaloon.addAll(list);

       }*/
    // if (List[0].CategoryName == 'WeddingFood_Cake')
    /* {
              List<WeddingFood_Cake> listofWeddingFood_Cake=[];
              listofWeddingFood_Cake.addAll(list);

       }*/

    // if (List[0].CategoryName == 'WeddingDecoration')
    /* {
              List<WeddingDecoration> listofWeddingDecoration=[];
              listofWeddingDecoration.addAll(list);

       }*/

    // if (List[0].CategoryName == 'WeddingHall')
    /* {
              List<WeddingHall> listofWeddingHall=[];
              listofWeddingDecoration.addAll(list);

       }*/

    else {
      throw Exception('Failed to load categoryItems');
    }
  }

///////////signup
  Future<String> signup(UserRegister user) async {
    final data = {"user": user};
    final url1 = Uri.parse('$url$signupApi$signup?user==$user');
    final response = await http.post(url1, body: json.encode(data));
    print('Status code: ${response.statusCode}');
    print(url1.toString());
    print(json.encode(data));
    if (response.statusCode == 200) {
      print("ressss11" + response.body);
      return "User added succssfuly";
    } else
      throw Exception('Failed to Add User');
  }

////////////////login
  Future<UserRegister> login(String Email, String Password) async {
    final data = {"Email": Email, "Password": Password};
    final url1 =
        Uri.parse('$url$loginApi$login?"UserName"=$Email&"Password"=$Password');
    final response = await http.post(url1, body: json.encode(data));
    print('Status code: ${response.statusCode}');
    print(url1.toString());
    print(json.encode(data));
    if (response.statusCode == 200) {
      final userinfo = jsonDecode(response.body).cast<Map<String, dynamic>>();
      UserRegister result =
          userinfo.map<UserRegister>((json) => WeddingInfo.fromJson(json));
      print("ressss11" + response.body);
      return result;
    } else
      throw Exception('Failed to login ');
  }

//////////////weddinginfo
  Future<String> weddinginfo(WeddingInfo weddinginfo,
      {required int UserId}) async {
    final data = {"weddinginfo": weddinginfo};
    final url1 =
        Uri.parse('$url$weddinginfoApi$weddinginfo?weddinginfo=$weddinginfo');
    final response = await http.post(url1, body: json.encode(data));
    print('Status code: ${response.statusCode}');
    print(url1.toString());
    print(json.encode(data));
    if (response.statusCode == 200) {
      print("ressss11" + response.body);
      return "weddinginfo added succssfuly";
    } else
      throw Exception('Failed to add weddinginfo ');
  }

/////////////get info
  Future<WeddingInfo> GetweddingInfo(int UserId) async {
    String url2 = url;
    String apiname = getweddinginfoApi;
    final url1 =
        '$url2$apiname?UserId==$UserId'; //الي بعد ؟ اسمو بال back end "الي بعد$ بالفرونت" ////؟=$ بينهم &
    final response = await http.get(Uri.parse(url1));
    if (response.statusCode == 200) {
      final caregoryitems =
          jsonDecode(response.body).cast<Map<String, dynamic>>();
      WeddingInfo result = caregoryitems.map<WeddingInfo>(
          (json) => WeddingInfo.fromJson(json)); //اتاكد ********
      return result;
    } else
      throw Exception('Failed to load wedding info');
  }

/////////editprofile
  Future<String> editprRofile(UserRegister user, int userid) async {
    final data = {"user2": user, "UserId": userid};
    final url1 =
        Uri.parse('$url$editprofileApi ?"user2"=$user&"UserId"=$userid');
    final response = await http.post(url1, body: json.encode(data));
    print('Status code: ${response.statusCode}');
    print(url1.toString());
    print(json.encode(data));
    if (response.statusCode == 200) {
      print("ressss11" + response.body);
      return "user information edit succssfuly";
    } else
      throw Exception('Failed to edit user information ');
  }

/////////addcategory
  Future<String> addcategory(Category category) async {
    final data = {"category": category};
    final url1 =
        Uri.parse('$url$addcategoryApi$addcategory?"category"=$category');
    final response = await http.post(url1, body: json.encode(data));
    print('Status code: ${response.statusCode}');
    print(url1.toString());
    print(json.encode(data));
    if (response.statusCode == 200) {
      print("ressss11" + response.body);
      return "category added succssfuly";
    } else
      throw Exception('Failed to add category ');
  }

/////////
  Future<String> addCItem(CategoriesShops categoryshop) async {
    final data = {"categoryshop": categoryshop};
    final url1 =
        Uri.parse('$url$addCItemApi$addCItem?"categoryshop"=$categoryshop');
    final response = await http.post(url1, body: json.encode(data));
    print('Status code: ${response.statusCode}');
    print(url1.toString());
    print(json.encode(data));
    if (response.statusCode == 200) {
      print("ressss11" + response.body);
      return "category Item added succssfuly";
    } else
      throw Exception('Failed to add category item ');
  }

/////
  Future<String> deletecategory(int categoryid) async {
    final data = {"CategoryId": categoryid};
    final url1 = Uri.parse(
        '$url$delcategoryApi$deletecategory?"CategoryId"=$categoryid');
    final response = await http.post(url1, body: json.encode(data));
    print('Status code: ${response.statusCode}');
    print(url1.toString());
    print(json.encode(data));
    if (response.statusCode == 200) {
      print("ressss11" + response.body);
      return "category deleted succssfuly";
    } else
      throw Exception('Failed to delete category');
  }

//////
  Future<String> deletecitem(int shopid) async {
    final data = {"ShopId": shopid};
    final url1 = Uri.parse('$url$delcitemApi$deletecitem?"ShopId"=$shopid');
    final response = await http.post(url1, body: json.encode(data));
    print('Status code: ${response.statusCode}');
    print(url1.toString());
    print(json.encode(data));
    if (response.statusCode == 200) {
      print("ressss11" + response.body);
      return "categoryitem  deleted succssfuly";
    } else
      throw Exception('Failed to delete categoryitem');
  }
}
