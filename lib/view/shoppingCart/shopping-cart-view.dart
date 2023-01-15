import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/controller/cart-controller.dart';
import 'package:myshop/localization/change-locale.dart';
import 'package:myshop/localization/translate-database.dart';
import 'package:myshop/model/cart-model.dart';
import 'package:myshop/services/handlin-data-view.dart';
import 'package:myshop/services/status-request.dart';
import 'package:myshop/view/checkout/checkout.dart';
class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    var pri;
     CartController cartController=Get.put(CartController());
     LocaleController localeController=Get.find();
    return Scaffold(
      body: SafeArea(
        child:GetBuilder<CartController>(
          builder: (controller) {
            
            return controller.statusRequest==StatusRequest.none?Center(child: Text('No item in cart',style: TextStyle(fontFamily:localeController.myloc=="en"?'NotoSansLimbu':"Tajawal",fontWeight: FontWeight.bold,fontSize: 20),))
            : Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: controller.productlist.length,
                        itemBuilder: (context,i){
                          CartModel cartModel= controller.productlist[i];
                          pri=cartModel.allproductPrice;
                          return     Container(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 9),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                           decoration: BoxDecoration(
                          
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage( '${URL.imageUrl}'+'uploads/'+'${cartModel.pinkproduct!.image}'),fit: BoxFit.scaleDown)
                          ),
                               child: Center(
                      
                               ),
                        ),
                        SizedBox(width: 12,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                               
                                child: Text(
            translateDatabase(  '${cartModel.pinkproduct!.name!}', '${cartModel.pinkproduct!.arName!}'),
                                  )),
                                SizedBox(height: 8,),
                            Row(
                              children: [
                                    InkWell(
                                       onTap:(){
controller.addQuentity(cartModel.pinkProductId);


                          },
                                      child: Container(
                                                                      width: 25,
                                                                      height: 25,
                                                                     decoration: BoxDecoration(
                                                                       color: AppColor.primaryColor,
                                                                       borderRadius: BorderRadius.circular(4)
                                                                     ),
                                                            child: Icon(Icons.add,color: Colors.white,size: 20,),
                                                                    ),
                                    ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text('${cartModel.quantity}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                ),
                                   InkWell(
                                    onTap: (){
                                      controller.decreaseQuentity(cartModel.pinkProductId);
                                    },
                                     child: Container(
                                                                     width: 25,
                                                                     height: 25,
                                                                    decoration: BoxDecoration(
                                     color: AppColor.primaryColor,
                                     borderRadius: BorderRadius.circular(4)
                                                                    ),
                                                           child: Icon(Icons.remove,color: Colors.white,size: 15,),
                                                                   ),
                                   ),
                                Spacer(),
                            Text('${cartModel.totalPrice}'+'\$',style: TextStyle(fontWeight: FontWeight.bold,),),
                        
                              
                               ],
                            ),

                                
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                        }
                        ),
                    )
                    ),
              
             
                  Divider(),
               Container(
                height: 150,
                child:Column(
                  children:[
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 17),
                         child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Text('total'.tr),
                                         
                          Text('${cartController.totalprice}'+'\$')
                                       ],
                                     ),
                       ),
                  Spacer(),
                      Flexible(
                         child: TextButton(onPressed: (){
Get.to(CheckOut());
                         }, 
                         child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Center(
                            child: Text('Checkout'.tr,style: TextStyle(color: Colors.white),),
                          ),
                         )
                         ),
                       )
                  ]
                )
               )

                ],
              ),
              );
            
           
          }
        )
      ),
    );
  }
}