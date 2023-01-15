import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/controller/category-controller.dart';
import 'package:myshop/localization/change-locale.dart';
import 'package:myshop/localization/translate-database.dart';
import 'package:myshop/model/allproduct-model.dart';
import 'package:myshop/model/category-model.dart';
import 'package:myshop/model/category-product-model.dart';
import 'package:myshop/services/handlin-data-view.dart';
class OneCategory extends StatelessWidget {
//  final List categories;
// final int catid;
  const OneCategory({super.key,});

  @override
  Widget build(BuildContext context) {
    LocaleController controller=Get.find();
    // CategoryController categoryController=Get.put(CategoryController());
    CategoryController categoryController=Get.find();
    return Scaffold(
      body: SafeArea(
        
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
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
                  child: IconButton(onPressed:(){}, icon: Icon(Icons.shopping_bag_rounded,size: 30,color: AppColor.primaryColor,)),)
                    ],),
                    SizedBox(height: 20,),
              GetBuilder<CategoryController>(
                builder: (categoryController) {
                  //this
                   print(categoryController.catid);
                  return Container(
                    height: 35,
                    child: ListView.builder(
                      
                      scrollDirection: Axis.horizontal,
                      itemCount:categoryController.Categories.length,
                      
                      itemBuilder: (context,i){
                      
                         CategoriesModel cat=categoryController.Categories[i];
                          
                        print(cat.id);
                        return InkWell(
                          onTap:(){
                            print(i);
                            var l=i+1;
                            categoryController.changeBetweenCategories(l);
                              // Get.delete<CategoryController>();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right:14),
                            child: Container(
                               decoration:categoryController.catid==cat.id? BoxDecoration(
                              border: Border(bottom: BorderSide(width: 3,color: AppColor.primaryColor))
                             ) : null,
                              child: Text(translateDatabase('${cat.name}','${cat.arName}'),
                              style: TextStyle(fontFamily:controller.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 16) ,),
                            ),
                          ),
                        );
                      }
                      ),
                  );
                }
              ),
              SizedBox(height: 17,),
                //  itemCount:catcontroller.onecategory.length ,
                //       itemBuilder: (context,i){
                //            AllproductModel item=catcontroller.onecategory[i];
              GetBuilder<CategoryController>(
                builder: (catcontroller) {
                  return HandlingDataView(
                    statusRequest:catcontroller.statusRequest,
                    widget:
                Container(
                    height: Get.height,
                    child: GridView.builder(
                       shrinkWrap: true,
                                  itemCount:catcontroller.onecategory.length,
                                   physics: BouncingScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                   
                                    ), 
                     itemBuilder: (context,i){
                         
                      CategoryProductModel item=catcontroller.onecategory[i];
                      return InkWell(
                        onTap: (){
                          print(item.name);
                          catcontroller.goToProductDetailPage(item.id!);
                        },
                        child: Padding(
                              padding: const EdgeInsets.only(right: 10,left: 10),
                          child: Column(
                                     
                            children: [
                              Container(
                                height:160 ,
                                decoration: BoxDecoration(
                                  image:DecorationImage(image:
                                   NetworkImage('${URL.imageUrl}'+'uploads/'+'${item.image}',),fit: BoxFit.fill),
                               boxShadow: [
                                  BoxShadow(color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0,3)
                                  )
                                ]
                                ),
                              ),
                         SizedBox(height: 10,),
                                     Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                             Text(translateDatabase('${item.name}', '${item.arName}'),
                          style:    TextStyle(fontFamily:controller.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15),
                          ),
                        
                     
                                          Text('${item.price} \$',style: TextStyle(color: AppColor.primaryColor,fontSize: 16,fontWeight: FontWeight.bold))   
                    ],
                                     )                        
                            ],
                          ),
                        )
                      );
                     }
                     ),
                  ))
                   ;

                 
                }
              ),
             
            ],
          ),
        )
        ),
    );
  }
}

// InkWell(
//                         onTap: (){
//                           print(item.name);
//                           catcontroller.goToProductDetailPage(item.id!);
//                         },
//                         child: Card(
                             
//                                         child: Padding(
//                                           padding: const EdgeInsets.only(right: 10,left: 10),
//                                           child:   Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                                           crossAxisAlignment: CrossAxisAlignment.center,
//                                           children: [
                                          
                     
//                        Container(
//                         height: 160,
//                         decoration: BoxDecoration(
                     
//                           image: DecorationImage(image: NetworkImage('${URL.imageUrl}'+'uploads/'+'${item.image}',),fit: BoxFit.fill)
//                         ),
//                        ),
                    
//                           SizedBox(height: 10,),
//                           Text(translateDatabase('${item.name}', '${item.arName}'),
//                           style:    TextStyle(fontFamily:controller.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15),
//                           ),
                        
                     
//                                           Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('${item.price} \$',style: TextStyle(color: AppColor.primaryColor,fontSize: 16,fontWeight: FontWeight.bold)),
//                           // IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined))
//                         ],
//                                           )
//                                           ],
                                          
//                                           ),
//                                         ),
//                                           ),
//                       )