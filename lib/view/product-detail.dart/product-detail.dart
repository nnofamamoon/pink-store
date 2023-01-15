import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/controller/cart-controller.dart';
import 'package:myshop/controller/category-controller.dart';
import 'package:myshop/controller/favorite-controller.dart';
import 'package:myshop/controller/home-controller.dart';
import 'package:myshop/controller/logged-controller.dart';
import 'package:myshop/controller/product-detail-controller.dart';
import 'package:myshop/localization/change-locale.dart';
import 'package:myshop/localization/translate-database.dart';
import 'package:myshop/model/allproduct-model.dart';
import 'package:myshop/view/authentication/login-screen.dart';
class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // ProductDetailController controller=Get.put(ProductDetailController());
    LocaleController loccontroller=Get.find();
    LoggedController mycont=Get.find();
    CategoryController categoryController=Get.find();
    ProductDetailController productDetailController=Get.put(ProductDetailController());
    // FavoriteController favcon=Get.put(FavoriteController());
    HomeController homeController=Get.find();
    CartController cartController=Get.put(CartController());
    int productid=0;
    // print(productDetailController.oneproductdata);
    return Scaffold(
      body:GetBuilder<ProductDetailController>(
          builder: (controller) {

return   controller.oneproductdata.isEmpty?Center(child: Lottie.asset(URL.loading,width: 70)):
SafeArea(
        child: 
           
           
             ListView.builder(
             itemCount:controller.oneproductdata.length,
             itemBuilder:(context,i){
AllproductModel data=controller.oneproductdata[i];
 productid=data.id!;
return    Column(
               
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                     
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(blurRadius: 2,color: Colors.black.withOpacity(0.2),spreadRadius: 1)
                      ]
                    ),
                    child: Stack(
                      children: [
                        Image.network('${URL.imageUrl}'+'uploads/'+'${data.image}',fit: BoxFit.fill,),
                        SafeArea(child: IconButton(onPressed: (){
                          Get.back();
                          Get.delete<ProductDetailController>();
                        }, icon: Icon(Icons.arrow_back_ios)))
                      ],
                    ),
                  ),
                  SizedBox(height: 25,),
    Text(
       translateDatabase( '${data.name}','${data.arName}'),
                 style: TextStyle(fontFamily:loccontroller.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15) 
                    ),
                   SizedBox(height: 25,),
                  Text('${data.price}'+'\$',style: TextStyle(fontFamily:'NotoSansLimbu',fontWeight: FontWeight.bold,fontSize: 19)),
                  SizedBox(height: 25,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
        translateDatabase(  '${data.description}', '${data.arDescription}'),
                 style: TextStyle(fontFamily:loccontroller.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15,color: Colors.grey[500])               
                        ),
                      ),
                       SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sizes'.tr,style: TextStyle(fontFamily:'NotoSansLimbu',fontWeight: FontWeight.bold,fontSize: 13)),
                          Text('Guide style'.tr,style: TextStyle(fontFamily:'NotoSansLimbu',fontWeight: FontWeight.bold,fontSize: 13)),
                      ],
                    ),
                  ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:List.generate(4, (index) =>   Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          // color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 0.5,
                            color: Colors.black.withOpacity(0.1)
                          )]
                        ),
                        child: Center(
                          child: Text('41',style: TextStyle(fontFamily:'NotoSansLimbu',fontWeight: FontWeight.bold,fontSize: 14)),
                        ),
                      ),
                    )),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GetBuilder<LoggedController>(
                        builder: (controller) {
                          return Container(
                            height: 50,
                            width: 50,
                             decoration: BoxDecoration(
                              // color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                spreadRadius: 1,
                                blurRadius: 0.5,
                                color: Colors.black.withOpacity(0.1)
                              )]
                            ),
                            child: InkWell(
                              onTap: (){
                                print(data.id!);
                                  print(controller.islogged);
                                  print(controller.userid);
                              controller.islogged=='null'?Get.to(LoginScreen())
                              :
                              productDetailController.favData(productid, controller.islogged);
                              // homeController.getData();
   
                              },
                              
 child: data.selfLiked==true? Icon(Icons.favorite,color:Colors.red):Icon(Icons.favorite_border_outlined))
//  Icon(Icons.favorite_border_outlined,color: controller.returnproductsataus=='likes'?Colors.red:Colors.black,)),
                          );
                        }
                      ),
                    ),
                    SizedBox(width: 20,),
                   Flexible(
                     child: TextButton(onPressed: (){
cartController.addtocart(productid);
                     }, 
                     child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Center(
                        child: Text('addtocart'.tr,style: TextStyle(color: Colors.white),),
                      ),
                     )
                     ),
                   )
                  ],
                )
                ],
              );
             }
            
            )
         
      );
          })
    
    );
  }
}