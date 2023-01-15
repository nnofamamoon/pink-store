import 'package:get/get.dart';
import 'package:myshop/services/main-service.dart';

translateDatabase(columnen,columnar){
  MyServices myServices=Get.find();
  if(myServices.sharedPrefrence.getString('lang') == 'ar'){
return columnar;
  }else{
    return columnen;
  }
}