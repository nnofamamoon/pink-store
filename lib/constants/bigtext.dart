import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/localization/change-locale.dart';
class BigText extends GetView<LocaleController> {
 final String text;
  const BigText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return   Text('${text}'.tr,style: TextStyle(fontFamily:controller.myloc=="en"?'NotoSansLimbu':"Tajawal",fontWeight: FontWeight.bold,fontSize: 19),);
  }
}