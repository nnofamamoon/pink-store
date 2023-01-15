import 'package:myshop/constants/constants.dart';
import 'package:myshop/services/crud.dart';

class VerifycodeData{
  Crud crud;
  VerifycodeData(this.crud);
  getData(String email,String otp,String password)async{
    Map data={
      'email':email,
      'verifycode':otp,
      'password':password
    };
    var response=await crud.verifycode(URL.verifycode,data);
    return response.fold((l) => l, (r) => r);
  }
}