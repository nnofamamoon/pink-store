import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/controller/home-controller.dart';
import 'package:myshop/services/status-request.dart';
import 'package:myshop/view/bottom-bar.dart';
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController con=Get.put(HomeController());
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller){
          return controller.statusRequest==StatusRequest.loading?Center(
            child: Lottie.asset(URL.loading),
          ) :Go();
        },
      ),
    );
  }
  Go(){
    Get.to(BottomBar());
  }
}