import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/localization/change-locale.dart';
class MedText extends GetView<LocaleController> {
  final String text;
 final void Function()? ontap;
  const MedText(this.ontap, {super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell
    (
      onTap: ontap,
      child: Text('${text}'.tr,style: TextStyle(fontFamily:controller.myloc=="en"?'NotoSansLimbu' :'Tajawal',fontSize: 15)));
  }
}