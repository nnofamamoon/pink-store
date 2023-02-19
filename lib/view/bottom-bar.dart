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

Home(),
// HomeScreen(),
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
              // color:  Color(0xffFE738A).withOpacity(0.2),
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
                  // backgroundColor:  Color(0xffFE738A).withOpacity(0.2),
                  color: Color.fromRGBO(236, 20, 81, 0.933),
                  activeColor: Colors.white,
                  tabBackgroundColor:Color.fromRGBO(236, 20, 81, 0.933),
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
