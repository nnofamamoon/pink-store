import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/constants/bigtext.dart';
import 'package:myshop/controller/category-controller.dart';
import 'package:myshop/controller/home-controller.dart';
import 'package:myshop/localization/change-locale.dart';
import 'package:myshop/view/category-section/one-category.dart';

import '../../../constants/constants.dart';
class CategoryWidget extends StatelessWidget {
   
  final String image;
   final String title;
      final int catid;
      final List categories;
      // final HomeController controller;
       final LocaleController loccontroller;
  const CategoryWidget({super.key, required this.image, required this.title, required this.catid, required this.categories, required this.loccontroller,});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController=Get.put(CategoryController());
    return InkWell(
      onTap: (){
        print('frome home');
        print(title);
         print(catid);

        // controller.GoToOneCategory(categories,catid);
      categoryController.initialData(categories,catid);
        // Get.to(OneCategory(catid: catid,categories:categories ,));
      },
      child: Padding(
      padding: const EdgeInsets.only(right:8.0,left: 8),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
         decoration: BoxDecoration(
color: AppColor.primaryColor,
borderRadius: BorderRadius.circular(50),
 boxShadow: [
                                BoxShadow(color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: Offset(0,3)
                                )
                              ]
            ),
            child: Image.network(
                          '${URL.imageUrl}'+'uploads/'+'${image}' ,
                          height: 10,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child:     Text( '$title',style: TextStyle(fontFamily:loccontroller.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 14)),
          )
        ],
      ),
    )
    
    );
  }
}
  // Container(
  //                 margin: EdgeInsets.only(right: 15),
  //                 child: Chip(
                    
  //                   backgroundColor: AppColor.primaryColor,
  //                   label: Row(
  //                   children: [
  //                       Image.network(
  //                         '${URL.imageUrl}'+'uploads/'+'${image}' ,
  //                         height: 40,),
  //                     SizedBox(width: 20,),
  //                       Text( '$title',style: TextStyle(fontFamily:loccontroller.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 19)),
  //                   ],
  //                 )),
  //               ),