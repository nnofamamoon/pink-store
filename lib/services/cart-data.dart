import 'package:myshop/constants/constants.dart';
import 'package:myshop/services/crud.dart';

class CartData{
  Crud crud;
  CartData(this.crud);
  getData(token,productid)async{
  

    var response=await crud.addProductToCartTable(URL.addProductToCartTable,productid,token);
    return response.fold((l) => l, (r) => r);
  }
}
//////////////////////////
class AllCartData{
  Crud crud;
  AllCartData(this.crud);
  getData(token)async{
  

    var response=await crud.showCartProducts(URL.showCartProducts,token);
    return response.fold((l) => l, (r) => r);
  }
}
///////////////////////////
class increaseQuantity{
  Crud crud;
  increaseQuantity(this.crud);
  getData(data,token)async{
  

    var response=await crud.increaseQuantity(URL.increaseQuantity,data,token);
    return response.fold((l) => l, (r) => r);
  }
}
/////////////////////////////////////////////////////
class decreseQuantity{
  Crud crud;
  decreseQuantity(this.crud);
  getData(data,token)async{
  

    var response=await crud.decreaseQuantity(URL.decreaseQuantity,data,token);
    return response.fold((l) => l, (r) => r);
  }
}