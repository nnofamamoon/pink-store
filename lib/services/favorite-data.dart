import 'package:myshop/constants/constants.dart';
import 'package:myshop/services/crud.dart';

class FavoriteData{
  Crud crud;
  FavoriteData(this.crud);
  getData(productid,token)async{
    // Map data={
    //   'pinkproduct_id':'$productid'
      
    
    // };

    var response=await crud.addTofavorite(URL.addTofavorite,productid,token);
    return response.fold((l) => l, (r) => r);
  }
}