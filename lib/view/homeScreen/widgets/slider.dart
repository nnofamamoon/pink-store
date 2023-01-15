import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:myshop/constants/constants.dart';
class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 300,
                child: Carousel(
                  dotColor: AppColor.primaryColor,
            dotSize: 6,
            borderRadius: true,
            // animationCurve: Curves.bounceIn,
            animationDuration: Duration(milliseconds: 800),
            radius: Radius.circular(30),
          dotBgColor: Colors.transparent,
                  images: [
                    Image.asset('images/a.jpeg',fit: BoxFit.cover,),
                        Image.asset('images/w.jpeg',fit: BoxFit.cover,),
                            Image.asset('images/e.jpeg',fit: BoxFit.cover,),
                                Image.asset('images/s.jpeg',fit: BoxFit.cover,),
                  ],

                ),
              ),
            );
  }
}