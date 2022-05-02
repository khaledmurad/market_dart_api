import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spree/Models/cart_model.dart';
import 'package:spree/Models/products_model.dart';
import 'package:spree/Models/profile_model.dart';
import 'package:spree/providers/profile_provider.dart';

class CallApi {
  String token;
  CallApi() {
    SharedPreferences.getInstance().then((value) {
      token = value.getString("token");
    });
  }

  Future postSignUpData(
      {String fName,
      String lName,
      String email,
      String password,
      String confirmPass}) async {
    String _url =
        'http://test.ngambmicheal.xyz/api/v1/register?first_name=$fName&last_name'
        '=$lName&email=$email&password=$password&password_confirmation=$confirmPass&tas=1';

    return await http.post(Uri.parse(_url), headers: _setHeaders());
  }

  Future postSignInData({String email, String password}) async {
    String _url =
        'http://test.ngambmicheal.xyz/api/v1/login?email=$email&password=$password';
    return await http.post(Uri.parse(_url), headers: _setHeaders());
  }

  Future postResetPassword({String email}) async {
    String _url =
        'http://test.ngambmicheal.xyz/api/v1/reset-password?email=$email';
    return await http.post(Uri.parse(_url), headers: _setHeaders());
  }

  Future getCard() async {
    await SharedPreferences.getInstance().then((value) async {
      token = value.getString('token');
      print("Token => $token");
      String _url = 'http://test.ngambmicheal.xyz/api/v1/profile/card';
      http.Response response =
          await http.get(Uri.parse(_url), headers: _setHeadersForProfile());
      print(response.body);
    });
  }

  Future<ProfileModel> getProfile({BuildContext context}) async {
    try {
      String _url = 'http://test.ngambmicheal.xyz/api/v1/profile';
      http.Response response = await http.get(Uri.parse(_url),
          headers: _setHeadersForProfile(context: context));
      if (response.statusCode == 200) {
        return ProfileModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print("profile error " + e.toString());
    }
  }

  getAllOder({BuildContext context}) async {
    try {
      String _url = 'http://test.ngambmicheal.xyz/api/v1/profile/order';
      http.Response response = await http.get(Uri.parse(_url),
          headers: _setHeadersForProfile(context: context));
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("profile error " + e.toString());
    }
  }

  getOrders({BuildContext context}) async {
    try {
      String _url =
          'http://test.ngambmicheal.xyz/api/v1/profile/order/3000001/products';
      http.Response response = await http.get(Uri.parse(_url),
          headers: _setHeadersForProfile(context: context));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      print("profile error " + e.toString());
    }
  }

  Future getProducts({BuildContext context}) async {
    try {
      String _url = 'http://test.ngambmicheal.xyz/api/v1/product/2000001';
      http.Response response =
          await http.get(Uri.parse(_url), headers: _setHeaders());
      if (response.statusCode == 200) {
        print(response.body);
        return ProductsModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print("Products error => ${e.toString()}");
    }
  }

  Future postItemsToCart({var id, var quantity, BuildContext context}) async {
    try {
      String _url =
          'http://test.ngambmicheal.xyz/api/v1/cart/store?id=$id&quantity=$quantity';
      http.Response response = await http.post(Uri.parse(_url),
          headers: _setHeadersForProfile(context: context));
      print("${response.body}");
    } catch (e) {
      print("Item to cart error ${e.toString()}");
    }
  }

  Future getItemsToCart({BuildContext context}) async {
    try {
      String _url = 'http://test.ngambmicheal.xyz/api/v1/cart';
      http.Response response = await http.get(Uri.parse(_url),
          headers: _setHeadersForProfile(context: context));
      print("${response.body}");
      if (response.statusCode == 200) {
        // return CartModel.fromJson(jsonDecode(response.body));
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("Item to cart error ${e.toString()}");
    }
  }

  Future getFeaturedCategories() async {
    await SharedPreferences.getInstance().then((value) async {
      token = value.getString('token');
      print("Token => $token");
      String _url =
          'http://spreere.com/api/v1/featured-categories/products?f_category=Latest In Fashion';
      //String _url = 'http://spreere.com/api/v1/featured-categories/products?f_category=Latest In Fashion';
      http.Response response =
          await http.get(Uri.parse(_url), headers: _setHeaders());
      print(response.body);
    });
  }

  //http://test.ngambmicheal.xyz/api/v1/featured-categories/products?f_category=New In Health

  Future getLatestInFashion({BuildContext context}) async {
    try {
      print('............Fashion..............');
      // await SharedPreferences.getInstance().then((value) async {
      //   token = value.getString('token');
      //   print("Token => $token");
      String _url =
          'http://test.ngambmicheal.xyz/api/v1/featured-categories/products?f_category=Latest In Fashion';

      http.Response response =
          await http.get(Uri.parse(_url), headers: _setHeaders());
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      }

      //});
    } catch (e) {
      print("Fashion Products error => ${e.toString()}");
    }
  }

  Future getNewInHealth({BuildContext context}) async {
    try {
      print('............Health..............');

      String _url =
          'http://test.ngambmicheal.xyz/api/v1/featured-categories/products?f_category=New In Health';
      http.Response response =
          await http.get(Uri.parse(_url), headers: _setHeaders());
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("Health Products error => ${e.toString()}");
    }
  }

  Future getCategories({BuildContext context}) async {
    try {
      print('............Categories..............');

      String _url = 'http://test.ngambmicheal.xyz/api/v1/sub-categories';
      http.Response response =
          await http.get(Uri.parse(_url), headers: _setHeaders());
      print("CAT"+response.body);
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("Categories error => ${e.toString()}");
    }
  }

  Future getBrands({BuildContext context}) async {
    try {
      print('............Brands..............');

      String _url = 'http://test.ngambmicheal.xyz/api/v1/brands';
      http.Response response =
          await http.get(Uri.parse(_url), headers: _setHeaders());
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("Brands error => ${e.toString()}");
    }
  }

  Future getSubCategories({var pName, var name, BuildContext context}) async {
    try {
      print('............Sub Categories..............');

      String _url =
          'http://test.ngambmicheal.xyz/api/v1/category?main=Fashion&p_name=$pName&name=$name';
      http.Response response =
          await http.get(Uri.parse(_url), headers: _setHeaders());
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("SubCategories error => ${e.toString()}");
    }
  }

  Future getBrandProducts({var name, BuildContext context}) async {
    try {
      print('............Brand Products..............');

      String _url =
          'http://test.ngambmicheal.xyz/api/v1/brand/products?name=$name';
      http.Response response =
          await http.get(Uri.parse(_url), headers: _setHeaders());
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("Brand Products error => ${e.toString()}");
    }
  }

  //http://test.ngambmicheal.xyz/api/v1/profile/card/store?name_on_card=Bilal&stripeToken=tok_us
  Future addCard({var name, var stripeToken, BuildContext context}) async {
    try {
      String _url =
          'http://test.ngambmicheal.xyz/api/v1/profile/card/store?name_on_card=$name&stripeToken=$stripeToken';
      http.Response response = await http.post(Uri.parse(_url),
          headers: _setHeadersForProfile(context: context));
      print("${response.body}");
    } catch (e) {
      print("Adding card error ${e.toString()}");
    }
  }

  Future<http.Response> postPersonalInfo(
      {BuildContext context,
      String fName,
      String lName,
      String address,
      String apartmentAddress,
      String zipCode,
      String city,
      String region,
      String country}) async {
    try {
      String url =
          "http://test.ngambmicheal.xyz/api/v1/profile/address/store?first_name=$fName&last_name=$lName&address=$address&app_address=$apartmentAddress&city=$city&region=$region&country=$country&zipcode=$zipCode";

      http.Response response = await http.post(Uri.parse(url),
          headers: _setHeadersForProfile(context: context));
      print("${response.body}");
      return response;
    } catch (e) {
      print("error on updating info => ${e.toString()}");
    }
  }

  Future<http.Response> GetPersonalInfo({BuildContext context}) async {
    try {
      String url = "http://test.ngambmicheal.xyz/api/v1/profile/address";

      http.Response response = await http.get(Uri.parse(url),
          headers: _setHeadersForProfile(context: context));

      print("${response.body}");
    } catch (e) {
      print("error on updating info => ${e.toString()}");
    }
  }

  Future getRecommendedProducts(
      {String product_id, BuildContext context}) async {
    try {
      String _url =
          'http://test.ngambmicheal.xyz/api/v1/recommended-products/$product_id';
      http.Response response = await http.get(Uri.parse(_url),
          headers: _setHeadersForProfile(context: context));
      print("${response.body}");

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("Adding recommended products error ${e.toString()}");
    }
  }

  Future getBanners({BuildContext context}) async {
    try {
      String _url = 'http://test.ngambmicheal.xyz/api/v1/banner';
      http.Response response = await http.get(Uri.parse(_url),
          headers: _setHeadersForProfile(context: context));

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("Getting banner error ${e.toString()}");
    }
  }

  Future getFeaturedBrand({BuildContext context}) async {
    try {
      String _url = 'http://test.ngambmicheal.xyz/api/v1/featured/brand';
      http.Response response = await http.get(Uri.parse(_url),
          headers: _setHeadersForProfile(context: context));
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("Getting featured brand error ${e.toString()}");
    }
  }

  _setHeaders() =>
      {'Content-type': 'application/json', 'Accept': 'application/json'};

  _setHeadersForProfile({BuildContext context}) => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${Provider.of<ProfileProvider>(context, listen: false).tokenGet()}'
      };
}
