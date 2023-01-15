import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/account-controller.dart';
import 'package:myshop/controller/favorite-controller.dart';
import 'package:myshop/controller/handling-data-controller.dart';
import 'package:myshop/controller/home-controller.dart';
import 'package:myshop/controller/logged-controller.dart';
import 'package:myshop/model/person-model.dart';
import 'package:myshop/services/login-data.dart';
import 'package:myshop/services/main-service.dart';
import 'package:myshop/services/status-request.dart';
import 'package:myshop/view/authentication/signup-screen.dart';
import 'package:myshop/view/bottom-bar.dart';

class LoginController extends GetxController{
   late  TextEditingController email;
   late   TextEditingController password;
    GlobalKey<FormState> formStatee=GlobalKey<FormState>();
    MyServices myServices=Get.find();
    String islogged='null';
   @override
  void onInit() {
     email=TextEditingController();
   password=TextEditingController();
  //  login();
    super.onInit();
  }
 LoginData testData=LoginData(Get.find());
 LoggedController logcon=Get.find();
 HomeController homeController=Get.put(HomeController());
 AccountController accountController=Get.put(AccountController());
 FavoriteController favoriteController=Get.put(FavoriteController());
  List userdata=[];
   StatusRequest statusRequest=StatusRequest.success;
  login()async{
          var formdata=formStatee.currentState;
    if(formdata!.validate()){ 
    statusRequest=StatusRequest.loading;
    update();
    var response=await testData.getData(email.text,password.text);
    print(response);
    print('---------------home controller');
    statusRequest=handlingData(response);
    print(statusRequest);
    if(StatusRequest.success==statusRequest){ 
  // data.addAll(response['Discounts'].map((p)=>disc.fromJson(p)).toList());
   userdata=response['success'].map((p)=>PersonModel.fromJson(p)).toList();
   print('home update');
homeController.getData();
print('account update');

 print('length');
 print(userdata.length);
for(int i=0;i<userdata.length;i++){
     PersonModel all= userdata[i];
    
 await myServices.sharedPrefrence.setString('token', all.token!);
 await myServices.sharedPrefrence.setInt('userid', all.id!);
  await myServices.sharedPrefrence.setString('username', all.name!);
   await myServices.sharedPrefrence.setString('useremail', all.email!);
    await myServices.sharedPrefrence.setString('useraddress', all.address!);
     await myServices.sharedPrefrence.setString('userimage', all.image!);
 update();
  print(islogged);
  //  islogged=myServices.sharedPrefrence.getString('token')??'null';

  logcon.islogged=myServices.sharedPrefrence.getString('token')!;
 logcon.userid=myServices.sharedPrefrence.getInt('userid')??0;
  print(myServices.sharedPrefrence.getString('token')!);
  update();
   email.clear();
  password.clear();
  update();
  accountController.getData();
  print('favfavafafavfavfavfavfavfavafafavfavfavfavfavfavafafavfavfavfav');
  favoriteController.favData();
  print('...............');
  update();
}
  Get.to(BottomBar());
    }else if(StatusRequest.offlinefailure==statusRequest){
Get.snackbar('offline', 'check your network connection',snackPosition: SnackPosition.TOP,duration: Duration(seconds: 10));
    }else if(StatusRequest.serverException==statusRequest){
Get.snackbar('failure', 'Wrong email or password',snackPosition: SnackPosition.TOP,duration: Duration(seconds: 10));
    }else if(StatusRequest.serverfailure==statusRequest){
Get.snackbar('failure', 'Wrong email or password',snackPosition: SnackPosition.TOP,duration: Duration(seconds: 10));
    }}
 
    update();
  }
  goToSignup(){
    Get.to(SignupScreen());
  }
}