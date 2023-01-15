import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/controller/login-controller.dart';
import 'package:myshop/services/status-request.dart';
import 'package:myshop/view/authentication/widget/text-form.dart';

import '../../controller/account-controller.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    LoginController controller=Get.put(LoginController());
      AccountController accountController=Get.put(AccountController());
    // Get.lazyPut(() => LoginController());
    return Scaffold(
      body: SafeArea(
        child: 
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical:80),
              child:Form(
                key: controller.formStatee,
                child: ListView(
                  children: [
                          Lottie.asset(URL.auth,height: 200),
                  Center(child: Text('SignIn',style: TextStyle(fontFamily:'NotoSansLimbu',fontWeight: FontWeight.bold,fontSize: 19))),
                            SizedBox(height: 10,),
                                TextForm(hintText: 'email',icon:Icons.email ,mycontroller: controller.email,myvalidator: (value){
              if(value!.isEmpty){
                return 'Required';
              }
                   },
                        keytype: TextInputType.emailAddress,),
                              SizedBox(height: 10,),
                          TextForm(hintText: 'password',icon:Icons.lock ,mycontroller: controller.password,),
                           SizedBox(height: 10,),
                GetBuilder<LoginController>(
                  builder: (controller) {
                    return Flexible(
                                   child: TextButton(onPressed: (){
                                   print('hh');
                                    controller.login();
                                   }, 
                                   child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: 
                                    Center(
                                      child:controller.statusRequest==StatusRequest.loading?
                                      Center(child: CircularProgressIndicator(color: Colors.white),):
                                       Text('SignIn',style: TextStyle(color: Colors.white,fontFamily:'NotoSansLimbu'),),
                                    ),
                                   )
                                   ),
                                 );
                  }
                ),
                        
                   SizedBox(height: 5,),
                           Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Donot Have an Account?',style: TextStyle(fontFamily:'NotoSansLimbu')),
                                  InkWell(
                                    onTap: (){
                                      controller.goToSignup();
                                    },
                                    child: Text('SignUp',style: TextStyle(fontFamily:'NotoSansLimbu',decoration: TextDecoration.underline,color:AppColor.primaryColor))),
                            ],
                           )
                  ],
                ),
              ) ,
            )
        ),
    );
  }
}