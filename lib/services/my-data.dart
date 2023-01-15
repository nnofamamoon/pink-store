import 'package:myshop/constants/constants.dart';
import 'package:myshop/services/crud.dart';

class HomeData{
  Crud crud;
  HomeData(this.crud);
  getData(token)async{
    var response=await crud.postData(URL.getDiscountProduct,token);
    return response.fold((l) => l, (r) => r);
  }
}