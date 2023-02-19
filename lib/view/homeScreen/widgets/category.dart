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
      Size size=MediaQuery.of(context).size;
    CategoryController categoryController=Get.put(CategoryController());
    return InkWell(
      onTap: (){
        print('frome home');
        print(title);
         print(catid);

      
      categoryController.initialData(categories,catid);
    
      },
      child: 
     Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    width: size.width*0.26,
                   
                    decoration: BoxDecoration(
                      // color: Color(0xffFE738A).withOpacity(0.2),
                      color:Color.fromRGBO(243, 135, 166, 0.922),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                         height: 30,
                          child:    Image.network(
                          '${URL.imageUrl}'+'uploads/'+'${image}' ,
                           height: 10,),
                        ),
                   
                        SizedBox(height: size.height*0.009,),
                       Text( '$title',style: TextStyle(fontFamily:loccontroller.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 14))
                      ],
                    ),
                  ),
                )
    );
  }
}
 