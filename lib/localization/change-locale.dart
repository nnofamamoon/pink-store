import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/services/main-service.dart';

class LocaleController extends GetxController{
 
  Locale? language;
  MyServices myservices=Get.find();
  String? myloc;
  changeLanguage(String langcode){
Locale locale=Locale(langcode);
myservices.sharedPrefrence.setString("lang", langcode);
Get.updateLocale(locale);
  }
  @override
  void onInit() {
 String? sharepreflang=myservices.sharedPrefrence.getString("lang");
 myloc=myservices.sharedPrefrence.getString("lang");
 if(sharepreflang == "ar"){
  language=Locale("ar");
 }else if(sharepreflang == "en"){
   language=Locale("en");
 }else{
  language=Locale(Get.deviceLocale!.languageCode);
 }
    super.onInit();
  }
}