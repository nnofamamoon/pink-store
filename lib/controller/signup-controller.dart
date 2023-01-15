import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myshop/controller/handling-data-controller.dart';
import 'package:myshop/services/signup-data.dart';
import 'package:myshop/services/status-request.dart';
import 'package:myshop/view/authentication/login-screen.dart';
import 'package:myshop/view/authentication/verifycode-screen.dart';

class SignupController extends GetxController{
 late TextEditingController name;
  late  TextEditingController email;
   late   TextEditingController password;
     late   TextEditingController address;
       late   TextEditingController phone;
         late  TextEditingController image;
         GlobalKey<FormState> formStatee=GlobalKey<FormState>();
             SignupData testData=SignupData(Get.find());
              
   StatusRequest statusRequest=StatusRequest.success;
  PickedFile? imageFile;
  final ImagePicker picker=ImagePicker();
    goToVerifycode(){
    Get.to(VerifyCodeScreen(),arguments:{
       "email":email.text,
       "password":password.text
    } );
  }
           Signup()async{
          
          var formdata=formStatee.currentState;
    if(formdata!.validate()){ 
    statusRequest=StatusRequest.loading;
     update();
    print('inside controller');
    
    var response=await testData.getData(name.text,email.text,password.text,address.text,phone.text,imageFile!.path);
     statusRequest=handlingData(response);
     update();
    print(response);
    print(statusRequest);
    print('---------------home controller');
  
      if(StatusRequest.success==statusRequest){
       if(response['status']=='success'){
      goToVerifycode();
      email.clear();
      password.clear();
      name.clear();
      address.clear();
      phone.clear();
      
    }
    }else if(StatusRequest.offlinefailure==statusRequest){
Get.snackbar('offline', 'check your network connection',snackPosition: SnackPosition.TOP,duration: Duration(seconds: 10));
    }else if(StatusRequest.serverException==statusRequest){
Get.snackbar('failure', 'account does not created',snackPosition: SnackPosition.TOP,duration: Duration(seconds: 10));
    }

    
           }
               update();
           }
           @override
  void onInit() {
   name=TextEditingController();
   email=TextEditingController();
   password=TextEditingController();
   phone=TextEditingController();
   address=TextEditingController();
   image=TextEditingController();
    super.onInit();
  }

  goToLogin(){
    Get.to(LoginScreen());
  }

  void takePhoto(ImageSource source)async{
  final pickedFile=await picker.getImage(source: source);
imageFile=pickedFile;
 update();
}
}