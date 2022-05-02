import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ProfileProvider  extends ChangeNotifier{

  String fName;
  String lName;
  String email;
  String token;
  String fNameGet()=>fName;
  String tokenGet()=>token;
  String lNameGet()=>lName;
  String emailGet()=>email;

  fNameSet(String name){
    notifyListeners();
    this.fName = name;
  }

   tokenSet(String token){
    notifyListeners();
    this.token = token;
  }

  lNameSet(String name){
    notifyListeners();
    lName = name;
  }

  emailSet(String email){
    notifyListeners();
    email = email;
  }


}