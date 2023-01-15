import 'package:get/get.dart';
import 'package:myshop/services/main-service.dart';

class AccountController extends GetxController{
  @override
  void onInit() {
  getData();
    super.onInit();
  }
   MyServices myServices=Get.find();
String? name;
String? email;
String? address;
String? image;
getData(){
  name=myServices.sharedPrefrence.getString('username')??'';
   email=myServices.sharedPrefrence.getString('useremail')??'';
    address=myServices.sharedPrefrence.getString('useraddress')??'';
     image=myServices.sharedPrefrence.getString('userimage')??'';
     update();
     print(';;;;;;;;;;;;;;');
  print(name);
}
}