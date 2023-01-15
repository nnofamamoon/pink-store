import 'package:get/get.dart';
import 'package:myshop/controller/handling-data-controller.dart';
import 'package:myshop/model/allproduct-model.dart';
import 'package:myshop/services/favorite-data.dart';
import 'package:myshop/services/main-service.dart';
import 'package:myshop/services/status-request.dart';
import 'package:myshop/view/authentication/login-screen.dart';
import 'package:myshop/view/bottom-bar.dart';

class LoggedController extends GetxController{
   MyServices myServices=Get.find();
  String islogged='null';
  int userid=0;
  bool log=false;
  test(){
    islogged=myServices.sharedPrefrence.getString('token')??'null';
    userid=myServices.sharedPrefrence.getInt('userid')??0;
    update();
  }
   logout()async{
 log=await myServices.sharedPrefrence.setString('token', 'null');
 update();
 print('logout');
 Get.to(LoginScreen());

//  if(log==true){
//   islogged='null';
//  }
// update();
// Get.to(BottomBar());
  }
  @override
  void onInit() {
    test();
    super.onInit();
  }
   

   List oneproductdata=[];
   String? returnproductsataus='dislike';
  
  late StatusRequest statusRequest;
 
}