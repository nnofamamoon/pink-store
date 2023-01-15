import 'package:myshop/constants/constants.dart';
import 'package:myshop/services/crud.dart';

class ProductDetailData{
  Crud crud;
  ProductDetailData(this.crud);
  getData(productid,token)async{
    var response=await crud.oneProduct(URL.oneproduct,productid,token);
    return response.fold((l) => l, (r) => r);
  }
}