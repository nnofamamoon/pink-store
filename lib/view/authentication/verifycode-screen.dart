import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/controller/verifycode-signup-controller.dart';
import 'package:myshop/services/status-request.dart';
class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VerifycodeSignupController controller=Get.put(VerifycodeSignupController());
    return Scaffold(
      body:SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Verify Your Account',style:  TextStyle(fontFamily:'NotoSansLimbu',fontWeight: FontWeight.bold,fontSize: 19),),
          SizedBox(height: 7,),
           Text('Enter Code Send To ${controller.email}',style:  TextStyle(fontFamily:'NotoSansLimbu',fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),),
        SizedBox(height: 17,),
          OtpTextField(
numberOfFields: 5,
borderRadius: BorderRadius.circular(10),
textStyle: TextStyle(fontFamily:'NotoSansLimbu',fontWeight: FontWeight.bold,fontSize: 15),
borderColor:AppColor.primaryColor ,
cursorColor: AppColor.primaryColor,
focusedBorderColor: Color.fromARGB(255, 221, 23, 162),
enabledBorderColor: AppColor.primaryColor,
keyboardType: TextInputType.number,
showFieldAsBox: true,
margin:EdgeInsets.only(right: 20),
onSubmit: (value){
controller.otp=value;
controller.getData();
},
          ),
          SizedBox(height: 15,),
          GetBuilder<VerifycodeSignupController>(builder: (controller){
            return controller.statusRequest==StatusRequest.loading?
            Center(child: CircularProgressIndicator(color: AppColor.primaryColor,),):
            Text('');
          })
        ],
      ))
    );
  }
}