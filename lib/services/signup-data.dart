import 'package:myshop/constants/constants.dart';
import 'package:myshop/services/crud.dart';

class SignupData{
  Crud crud;
  SignupData(this.crud);
  getData(name,email,password,phone,address,image)async{
    Map data={
      'name':name,
      'email':email,
      'password':password,
      'phone':phone,
      'address':address,
      'image':image
    };
    var response=await crud.Signup(URL.signup,data);
    return response.fold((l) => l, (r) => r);
  }
}