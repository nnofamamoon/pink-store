import 'package:myshop/constants/constants.dart';
import 'package:myshop/services/crud.dart';

class AllFavoriteData{
  Crud crud;
  AllFavoriteData(this.crud);
  getData(token)async{
    // Map data={
    //   'pinkproduct_id':'$productid'
      
    
    // };

    var response=await crud.getallfavoritedata(URL.allfavoritedata,token);
    return response.fold((l) => l, (r) => r);
  }
}