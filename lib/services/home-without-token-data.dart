import 'package:myshop/constants/constants.dart';
import 'package:myshop/services/crud.dart';

class HomeWithoutTokenData{
  Crud crud;
  HomeWithoutTokenData(this.crud);
  getData()async{
    var response=await crud.homeProductwithoutToken(URL.homeProductwithoutToken);
    return response.fold((l) => l, (r) => r);
  }
}