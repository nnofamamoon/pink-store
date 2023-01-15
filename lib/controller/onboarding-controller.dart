import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/model/onboarding.dart';

class OnBoadringController extends GetxController{
  @override
  void onInit() {

   pagecontroller=PageController(initialPage: 0);
    super.onInit();
  }
  RxInt currentindex=0.obs;
  PageController? pagecontroller;
  
  RxList<onBoardingModel> pages=[
onBoardingModel(
  title: 'Shopping With Us'.tr,
  body: 'body'.tr,
  image: 'images/g.jpg'
  ),
  onBoardingModel(
  title: 'Enjoy our offers'.tr,
  body: 'body'.tr,
  image: 'images/i.jpg'
  ),
  onBoardingModel(
  title: 'Pay In Save'.tr,
  body: 'body'.tr,
  image: 'images/r.jpg'
  ),
  ].obs;
}