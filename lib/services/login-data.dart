import 'package:myshop/constants/constants.dart';
import 'package:myshop/services/crud.dart';

class LoginData{
  Crud crud;
  LoginData(this.crud);
  getData(email,password)async{
    Map data={
      'email':email,
      'password':password,
    };
    var response=await crud.verifycode(URL.login,data);
    return response.fold((l) => l, (r) => r);
  }
}