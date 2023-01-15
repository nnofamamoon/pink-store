import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/controller/signup-controller.dart';
import 'package:myshop/services/status-request.dart';
import 'package:myshop/view/authentication/widget/text-form.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    SignupController controller=Get.put(SignupController());
    return Scaffold(
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical:50),
        child: Form(
          key: controller.formStatee,
          child: ListView(
            children: [
           
              Center(child: Text('SignUp',style: TextStyle(fontFamily:'NotoSansLimbu',fontWeight: FontWeight.bold,fontSize: 19))),
                        SizedBox(height: 20,),
            imageProfile(context),
                SizedBox(height: 10,),
            TextForm(
              hintText: 'name',icon:Icons.person ,mycontroller: controller.name,myvalidator: (value){
if(value!.isEmpty){
  return 'Required';
}
             },
             keytype: TextInputType.name,
             ),
                SizedBox(height: 10,),
                       TextForm(hintText: 'email',icon:Icons.email ,mycontroller: controller.email,myvalidator: (value){
if(value!.isEmpty){
  return 'Required';
}
             },
                  keytype: TextInputType.emailAddress,
             ),
                          SizedBox(height: 10,),
                      TextForm(hintText: 'password',icon:Icons.lock ,mycontroller: controller.password,myvalidator: (value){
if(value!.isEmpty){
  return 'Required';
}
             },),
                          SizedBox(height: 10,),
                           TextForm(hintText: 'address',icon:Icons.home ,mycontroller: controller.address,myvalidator: (value){
if(value!.isEmpty){
  return 'Required';
}
             },),
                          SizedBox(height: 10,),
                         TextForm(hintText: 'phone',icon:Icons.call ,mycontroller: controller.phone,myvalidator: (value){
if(value!.isEmpty){
  return 'Required';
}
             },
                  keytype: TextInputType.number,
             ),
                SizedBox(height: 10,),
                 GetBuilder<SignupController>(
                   builder: (controller) {
                     return 
                     Flexible(
                           child: TextButton(onPressed: (){
                           
                            controller.Signup();
                          
                           }, 
                           child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(
                              child:controller.statusRequest==StatusRequest.loading?
                              Center(child: CircularProgressIndicator(color: Colors.white),):
                               Text('SignUp',style: TextStyle(color: Colors.white,fontFamily:'NotoSansLimbu'),),
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
                        Text('Already Have an Account?',style: TextStyle(fontFamily:'NotoSansLimbu')),
                            InkWell(
                              onTap: (){
                                controller.goToLogin();
                              },
                              child: Text('SignIn',style: TextStyle(fontFamily:'NotoSansLimbu',decoration: TextDecoration.underline,color:AppColor.primaryColor))),
                      ],
                     )
            ],
          ),
        ),
      ),
      ),
    );
    
  }
   Widget imageProfile(BuildContext context){
    
  return GetBuilder<SignupController>(
    builder: (controller) {
      
      return Center(
        child: Stack(children: [
      InkWell(
        onTap: (){
          showModalBottomSheet(context: context,
 builder:((builder)=>bottomsheet()),);
        },
        child: CircleAvatar(radius: 80,
        backgroundImage: controller.imageFile == null ?  AssetImage('${URL.imageAssetUrl}'+'u.jpg'): FileImage(File(controller.imageFile!.path)) as ImageProvider,
        ),
      ),
//       Positioned(child: InkWell(
//         onTap: (){
// showModalBottomSheet(context: context,
//  builder:((builder)=>bottomsheet()),);

//         },
//         child: Icon(Icons.camera_alt)),
//       bottom: 20.0,
//       right: 20.0,
//       )
        ],),
      );
    }
  );
}
Widget bottomsheet(){
  return GetBuilder<SignupController>(
    builder: (controller) {
      return Container(
        height: 100.0,
        width: Get.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20
        ),
child: Column(children: [
      Text('choose photo'),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        TextButton(onPressed: (){
          controller.takePhoto(ImageSource.camera,);
        },
         child: Row(
          children: [
            Icon(Icons.camera,color: AppColor.primaryColor,),
            Text('Camera')
          ],
         ), 
         ),
         TextButton(onPressed: (){
           controller.takePhoto(ImageSource.gallery);
         },
         child: Row(
          children: [
            Icon(Icons.image,color: AppColor.primaryColor,),
            Text('Gallary')
          ],
         ), 
         ),
      ],)
],),
      );
    }
  );
}

}