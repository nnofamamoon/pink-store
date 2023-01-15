import 'package:myshop/constants/constants.dart';
import 'package:myshop/services/crud.dart';

class OneCategoryData{
  Crud crud;
  OneCategoryData(this.crud);
  getData(catid)async{
    var response=await crud.oneCategory(URL.oneCategory,catid);
    return response.fold((l) => l, (r) => r);
  }
}