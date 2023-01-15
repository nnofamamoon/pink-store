import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/constants/bigtext.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/constants/medtext.dart';
import 'package:myshop/controller/category-controller.dart';
import 'package:myshop/controller/home-without-token-controller.dart';
import 'package:myshop/localization/change-locale.dart';
import 'package:myshop/localization/translate-database.dart';
import 'package:myshop/model/allproduct-model.dart';
import 'package:myshop/model/category-model.dart';
import 'package:myshop/model/discount-model.dart';
import 'package:myshop/services/handlin-data-view.dart';
import 'package:myshop/view/authentication/login-screen.dart';
import 'package:myshop/view/homeScreen/widgets/category.dart';
import 'package:myshop/view/homeScreen/widgets/slider.dart';
class BottomBarWithoutToken extends GetView<LocaleController> {
  const BottomBarWithoutToken({super.key});

  @override
  Widget build(BuildContext context) {
    HomeWithoutTokenController homeWithoutTokenController=Get.put(HomeWithoutTokenController());
     CategoryController categoryController=Get.put(CategoryController());
    return GetBuilder<HomeWithoutTokenController>(
      builder: (homecontroller) {
        return   HandlingDataView(statusRequest:homecontroller.statusRequest ,
        widget:   SafeArea(
          child:Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
        Row(children: [
              Expanded(child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: IconButton(onPressed:(){}, icon: Icon(Icons.search,color: AppColor.primaryColor,)),
                  hintText: 'Find a Product'.tr,
                  hintStyle: TextStyle(fontFamily:controller.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 18),
                  helperStyle: TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                  
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)
                  ),
                  filled: true,
                  fillColor: Colors.grey[200]
                ),
              )),
              SizedBox(width: 10,),
            
               Container(
                    decoration: BoxDecoration(
                   color: Colors.grey[200],
                   borderRadius: BorderRadius.circular(10)
                    ),
                    width: 60,
                   
                    padding: EdgeInsets.symmetric(vertical: 7),
                    child: IconButton(onPressed:(){
                    //  locontroller.logout();
                    // Get.to(ShoppingCart());
                    Get.to(LoginScreen());
                    }, icon: Icon(Icons.shopping_cart,size: 30,color: AppColor.primaryColor,)),)
               
                  ],),
                  SizedBox(height: 20,),
               SliderScreen(),
              SizedBox(height: 15,),
                Container(
                height: 150,
                child: ListView.builder(
                  itemCount: homecontroller.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,i){
                    CategoriesModel cat=homecontroller.categories[i];
                    return CategoryWidget(
                        image: cat.image!,
                        title: translateDatabase(cat.name,cat.arName),
                        catid: cat.id!,
                        categories: homecontroller.categories,
                        // controller:homeWithoutTokenController,
                        loccontroller:controller
                    
                    );
                  }),
              ),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 BigText(text:'Discount'),
               
                  MedText(text: 'See All',(){
 
                  }),
                 
                ],
              ),
               Container(
                        height: 290,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homecontroller.discountProduct.length,
                          itemBuilder: (context,i){
                          
                              DiscountModel d=homecontroller.discountProduct[i];
                              // FavoriteProductHome fav=homecontroller.favorite[i];
                                 print( '${URL.imageUrl}'+'uploads/'+'${d.image}');
                          return Padding(padding:EdgeInsets.symmetric(vertical: 15,horizontal:5) ,
                        child: InkWell(
                          onTap: (){
         homecontroller.token=='null'?LoginScreen():categoryController.goToProductDetailPage(d.id!);
                          },
                          child: Row(
                            children: [
                              Padding(padding: EdgeInsets.symmetric(horizontal: 7),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 200,
                                    height: 270,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: Offset(0,3)
                                        )
                                      ]
                                    ),
                                    child: Column(
                                     // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                         Container(
                                            height: 200,
                                            width: 380,
                                         child: Image.network(
                                          '${URL.imageUrl}'+'uploads/'+'${d.image}',
                                          fit: BoxFit.fill,
                                         ),
                                            // child: Image.asset(
                                            //   'images/sho.jpeg',
                                            //   fit: BoxFit.fill,
                                            // ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: [
                                     Text(
                                       translateDatabase(d.name,d.arName)
                                           ,style: TextStyle(fontFamily:controller.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15)
                                     ),
                                SizedBox(height: 4,),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                Text(
                                            ' ${d.priceAfterDiscount}\$',
                                             style: TextStyle(color: Colors.grey),       
                                                ),
                                                SizedBox(width:10),
                                                Text(
                                            ' ${d.price}\$',
                                             style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),       
                                                ),
                                //  Icon(Icons.favorite_border_outlined)
                                  ],
                                ),
                                
                                              ],
                                            ),
                                          )
                          ,   
                                
                                      ],
                                    ),
                                  ),
                            Positioned(
                              right: 6,
                              top: 6,
                        
                           child: d.selfLiked==true?Icon(Icons.favorite,color:Colors.red ,):Icon(Icons.favorite_border_outlined,)
                              )
                                ],
                              ),
                              )
                            ],
                          ),
                        ),
                        );
                        },),
                      ),
                     SizedBox(height: 15,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 BigText(text:'All Products'),
               
                  MedText(text: 'See All',(){
 
                  }),
                 
                ],
              ),
                   Container(
                    height: 300,
                   child:ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homecontroller.allproduct.length,
                      itemBuilder: (context,i){
                        AllproductModel all=homecontroller.allproduct[i];
                      return Padding(padding:EdgeInsets.symmetric(vertical: 10,horizontal:5) ,
                    child: InkWell(
                      onTap: (){
    homecontroller.token=='null'?LoginScreen(): categoryController.goToProductDetailPage(all.id!);
                      },
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.symmetric(horizontal: 7),
                          child: Container(
                            width: 200,
                            height: 320,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: Offset(0,3)
                                )
                              ]
                            ),
                            child: Column(
                             // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Container(
                                    height: 200,
                                    width: 380,
                                 
                                    child: Image.network(
                                         '${URL.imageUrl}'+'uploads/'+'${all.image}',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                               Text(
                                     translateDatabase( all.name!,all.arName!),
                                     style: TextStyle(fontFamily:controller.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15)
                             ),
                            SizedBox(height: 4,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                    
                            Text(
                              translateDatabase(' ${all.price}\$', ' ${all.price}\$')
                                   ,
                                     style: TextStyle(color: Colors.grey),       
                                        ),
                    all.selfLiked==true?Icon(Icons.favorite,color:Colors.red ,):Icon(Icons.favorite_border_outlined,)
                             
                              ],
                            )
                                      ],
                                    ),
                                  )
                      ,   
                            
                              ],
                            ),
                          ),
                          )
                        ],
                      ),
                    ),
                    );
                    },), 
                   ),
                  
                
                         SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               BigText(text: 'Scarfs'),
               MedText(text: 'See All',(){})
               
                ],
              ),
               Container(
          height: 520,
          child: GridView.builder(
           shrinkWrap: true,
                  itemCount:homecontroller.discountProduct.length,
                   physics: BouncingScrollPhysics(),
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                                    mainAxisSpacing: 2.0,
                                    crossAxisSpacing: 1.0,
                                    childAspectRatio: 0.6
              ), 
                     itemBuilder: (context,i){
                        DiscountModel d=homecontroller.discountProduct[i];
         return  Column(
                          children: [
                            Padding(padding: EdgeInsets.symmetric(horizontal: 7),
                            child: InkWell(
                              onTap: (){
       homecontroller.token=='null'?Get.to(LoginScreen()): categoryController.goToProductDetailPage(d.id!);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width: 200,
                                    height: 270,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: Offset(0,3)
                                        )
                                      ]
                                    ),
                                    child: Column(
                                     // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                         Container(
                                            height: 200,
                                            width: 380,
                                         child: Image.network(
                                          '${URL.imageUrl}'+'uploads/'+'${d.image}',
                                          fit: BoxFit.fill,
                                         ),
                                            // child: Image.asset(
                                            //   'images/sho.jpeg',
                                            //   fit: BoxFit.fill,
                                            // ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: [
                                         Text(
                                           translateDatabase(d.name,d.arName)
                                           ,style: TextStyle(fontFamily:controller.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15)
                                     ),
                                    SizedBox(height: 4,),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                    Text(
                                            ' ${d.priceAfterDiscount}\$',
                                                 style: TextStyle(color: Colors.grey),       
                                                ),
                                                SizedBox(width:10),
                                                Text(
                                            ' ${d.price}\$',
                                                 style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),       
                                                ),
                                    //  Icon(Icons.favorite_border_outlined)
                                      ],
                                    ),
                                    
                                              ],
                                            ),
                                          )
                                                    ,   
                                    
                                      ],
                                    ),
                                  ),
                                                      Positioned(
                              right: 6,
                              top: 6,
                            
                               child: d.selfLiked==true?Icon(Icons.favorite,color:Colors.red ,):Icon(Icons.favorite_border_outlined,)
                              )
                                ],
                              ),
                            ),
                            )
                          ],
                        );
                        
                     }
            ),
         )


                    ],
                  ),
                ),
          )
           )
        );
      
      }
    );
  }
}