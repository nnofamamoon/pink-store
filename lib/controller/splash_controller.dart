import 'package:get/get.dart';
import 'package:myshop/services/main-service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController{
  int? initScreen;
  var l;
  @override
  void onInit()async {
    // TODO: implement onInit
     MyServices myServices=Get.find();
   initScreen=await myServices.sharedPrefrence.getInt("initScreen");
   update();
  await  myServices.sharedPrefrence.setInt("initScreen", 1);
  update();
  print('////////initScreen');
  print(initScreen);
  final pref=await SharedPreferences.getInstance();
 l=pref.getString('token');
 print('lllltoken');
print(l);
    super.onInit();
  }
}