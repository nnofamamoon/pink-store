import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/controller/home-controller.dart';
import 'package:myshop/localization/change-locale.dart';
import 'package:myshop/services/main-service.dart';
import 'package:myshop/services/status-request.dart';
import 'package:myshop/view/account-screen.dart/account-view.dart';
import 'package:myshop/view/bottom-bar-without-token/BottomBar-Without-Token-view.dart';
import 'package:myshop/view/favorite-screen.dart/favorite-view.dart';
import 'package:myshop/view/homeScreen/home.dart';
class BottomBar extends StatelessWidget {
  // const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices=Get.find();
  // String token=myServices.sharedPrefrence.getString('token')??'null';
String t=  myServices.sharedPrefrence.getString('token')!;
    HomeController CONTROLLER=Get.put(HomeController());
    print('bottom bar');
      print(t);
    List<Widget> pages=[
//  t=='null'?BottomBarWithoutToken() :Home(),
Home(),
  FavoriteView(),
  AccountView(),
  
];
    return 
    Scaffold(
      body:GetBuilder<HomeController>(
        builder: (controller) {
          return pages.elementAt(controller.currentpage);
        }
      ) ,
      bottomNavigationBar: GetBuilder<HomeController>(
          builder: (controller) {
            return 
            Container(
              color: AppColor.primaryColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: GNav(
                  onTabChange: (val){
controller.changepage(val);
print(controller.currentpage);
                  },
                  selectedIndex:controller.currentpage ,
                  gap: 8,
                  iconSize: 30,
                  backgroundColor: AppColor.primaryColor,
                  color: Color.fromARGB(255, 111, 160, 199),
                  activeColor: Colors.white,
                  tabBackgroundColor: Color.fromARGB(255, 111, 160, 199),
                  padding: EdgeInsets.all(9),
                  tabs: [
                    GButton(icon: Icons.home,text: 'home'.tr,),
                         GButton(icon: Icons.favorite_border_outlined,text: 'favorite'.tr,),
                              GButton(icon: Icons.person,text: 'account'.tr,),
                  ],
                ),
              ),
            );
          }
        ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:myshop/constants/constants.dart';
// import 'package:myshop/localization/change-locale.dart';
// import 'package:myshop/view/account-screen.dart/account-view.dart';
// import 'package:myshop/view/favorite-screen.dart/favorite-view.dart';
// import 'package:myshop/view/homeScreen/home.dart';
// class BottomBar extends StatelessWidget {
//   // const BottomBar({super.key});
// List<Widget> pages=[
// Home(),
//   FavoriteView(),
//   AccountView(),
  
// ];
//   @override
//   Widget build(BuildContext context) {
//     return 
//     Scaffold(
//       body:GetBuilder<LocaleController>(
//         builder: (controller) {
//           return pages.elementAt(controller.currentpage);
//         }
//       ) ,
//       bottomNavigationBar: GetBuilder<LocaleController>(
//           builder: (controller) {
//             return Container(
//               color: AppColor.primaryColor,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//                 child: GNav(
//                   onTabChange: (val){
// controller.changepage(val);
// print(controller.currentpage);
//                   },
//                   selectedIndex:controller.currentpage ,
//                   gap: 8,
//                   iconSize: 30,
//                   backgroundColor: AppColor.primaryColor,
//                   color: Color.fromARGB(255, 111, 160, 199),
//                   activeColor: Colors.white,
//                   tabBackgroundColor: Color.fromARGB(255, 111, 160, 199),
//                   padding: EdgeInsets.all(9),
//                   tabs: [
//                     GButton(icon: Icons.home,text: 'Home',),
//                          GButton(icon: Icons.favorite_border_outlined,text: 'Favorite',),
//                               GButton(icon: Icons.person,text: 'Account',),
//                   ],
//                 ),
//               ),
//             );
//           }
//         ),
//     );
//   }
// }