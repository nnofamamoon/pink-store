import 'package:get/get.dart';
import 'package:myshop/controller/account-controller.dart';
import 'package:myshop/controller/favorite-controller.dart';
import 'package:myshop/controller/handling-data-controller.dart';
import 'package:myshop/controller/home-controller.dart';
import 'package:myshop/controller/logged-controller.dart';
import 'package:myshop/model/allproduct-model.dart';
import 'package:myshop/model/category-model.dart';
import 'package:myshop/model/person-model.dart';
import 'package:myshop/services/main-service.dart';
import 'package:myshop/services/my-data.dart';
import 'package:myshop/services/status-request.dart';
import 'package:myshop/model/discount-model.dart';
import 'package:myshop/services/verifycode-data.dart';
import 'package:myshop/view/bottom-bar.dart';
import 'package:myshop/view/category-section/one-category.dart';
import 'package:myshop/view/homeScreen/home.dart';
class VerifycodeSignupController extends GetxController{
 String? email;
 String? password;
 String? otp;
 AccountController accountController=Get.put(AccountController());
 HomeController homeController=Get.find();
 FavoriteController favController=Get.find();
 MyServices myServices=Get.find();
String islogged='null';
 initialData() {
 email=Get.arguments['email'];
  password=Get.arguments['password'];
 update();
  }
  VerifycodeData testData=VerifycodeData(Get.find());
  LoggedController logcon=Get.find();
  List userdata=[];
  late StatusRequest statusRequest=StatusRequest.success;
  getData()async{
    statusRequest=StatusRequest.loading;
    update();
    print(email);
    print(otp);
    var response=await testData.getData(email!,otp!,password!);
    print(response);
    print('---------------home controller');
    statusRequest=handlingData(response);
    print(statusRequest);
    if(StatusRequest.success==statusRequest){ 
  // data.addAll(response['Discounts'].map((p)=>disc.fromJson(p)).toList());
   userdata=response['success'].map((p)=>PersonModel.fromJson(p)).toList();
   update();
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
  //  islogged=await myServices.sharedPrefrence.getString('token')??'null';
  logcon.islogged=await myServices.sharedPrefrence.getString('token')??'null';

  print(islogged);
  update();
  
}
homeController.getData();
accountController.getData();
favController.favData();

  Get.to(BottomBar());
    }else if(StatusRequest.offlinefailure==statusRequest){
Get.snackbar('offline', 'check your network connection',snackPosition: SnackPosition.TOP,duration: Duration(seconds: 10));
    }else if(StatusRequest.serverException==statusRequest){
Get.snackbar('failure', 'Wrong Verification Code',snackPosition: SnackPosition.TOP,duration: Duration(seconds: 10));
    }else if(StatusRequest.serverfailure==statusRequest){
Get.snackbar('failure', 'Wrong Verification Code',snackPosition: SnackPosition.TOP,duration: Duration(seconds: 10));
    }
 
    update();
  }
  @override
  void onInit() {
    initialData();
    // getData();
    super.onInit();
  }
// List allCategories=[];
// int? catid;
    GoToOneCategory(allCategories,catid){
Get.to(OneCategory(),arguments: {
    "categories":allCategories,
    "categoryid":catid
  });
  }
}