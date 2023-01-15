import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/constants/constants.dart';
class TextForm extends StatelessWidget {
  final String hintText;
 final IconData icon;
 final TextEditingController mycontroller;
 final String? Function(String?)? myvalidator;
 final TextInputType? keytype;
  const TextForm({super.key, required this.hintText, required this.icon, required this.mycontroller, this.myvalidator,  this.keytype});

  @override
  Widget build(BuildContext context) {
    return           TextFormField(
      keyboardType:keytype ,
      validator: myvalidator,
      controller: mycontroller,
                decoration: InputDecoration(
                  prefixIcon: IconButton(onPressed:(){}, icon: Icon(icon,color: AppColor.primaryColor,)),
                  hintText: hintText.tr,
                  hintStyle: TextStyle(fontFamily:'NotoSansLimbu',fontSize: 18),
                  helperStyle: TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                  
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)
                  ),
                  filled: true,
                  fillColor: Colors.grey[200]
                ),
              );
  }
}