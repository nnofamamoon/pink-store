import 'package:myshop/constants/constants.dart';
import 'package:myshop/services/crud.dart';

class OrderData{
  Crud crud;
  OrderData(this.crud);
  getData(delmethod,address)async{
  
    Map data={
      'payment_method':delmethod,
      'address':address,
     
    };
    print('data');
    print(data);
    var response=await crud.order(URL.order,data);
    return response.fold((l) => l, (r) => r);
  }
}