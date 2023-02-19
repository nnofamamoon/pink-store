import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/controller/cart-controller.dart';
import 'package:myshop/view/authentication/widget/text-form.dart';
class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController=Get.find();
    return Scaffold(
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey,
            child: Card(
              elevation: 10,
              child: GetBuilder<CartController>(
                builder: (controller) {
                  return Column(
                    children: [
                   Padding(
                     padding: const EdgeInsets.only(top:8.0),
                     child: Text('Payment Method'),
                   ),
             Row(
            children: [
             
                    Radio(value: 'cash', 
                    groupValue: cartController.DeliveryMethod, 
                    onChanged: (val){
                      controller.changeDelivaryMethod(val!);

                    }
                    ),
                     Text('Cash'),
            ],
             ),
                  Row(
            children: [
             
                    Radio(value: 'paypal', 
                    groupValue: cartController.DeliveryMethod, 
                    onChanged: (val){
 controller.changeDelivaryMethod(val!);
                    }
                    ),
                     Text('Paypal'),
            ],
             ),
           
             Padding(
                  padding: EdgeInsets.all(10),
                  child: TextForm(hintText: 'Address',icon:Icons.home ,mycontroller: cartController.addressController,myvalidator: (value){
                  if(value!.isEmpty){
                    return 'Required';
                  }
                       },
                            keytype: TextInputType.streetAddress,),
             ),
           
                      
                    ],
                  );
                }
              ),
            ),
          ),
            Flexible(
                                   child: TextButton(onPressed: (){
                    cartController.order(context);            
                                   }, 
                                   child: Container(
                                    width: 140,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: 
                                    Center(
                                    
                  child:Text('Approve',style: TextStyle(color: Colors.white,fontFamily:'NotoSansLimbu'),),
                                    ),
                                   )
                                   ),
                                 )
        ],
      )),
    );
  }
}