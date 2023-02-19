import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:myshop/controller/splash_controller.dart';
import 'package:myshop/view/authentication/login-screen.dart';
import 'package:myshop/view/bottom-bar.dart';
import 'package:myshop/view/onboarding/onboarding.dart';
import 'package:page_transition/page_transition.dart';
import '../../main.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    // SplashScreenController splashScreenController=Get.put(SplashScreenController());
    print('splash');
    return AnimatedSplashScreen(
      splash:Column(
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('images/g.jpg'))),
            SizedBox(height: 18,),
          Text('P I N K  S T O R E',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)
        ],
      ) ,
      duration: 4000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.topToBottom,
      backgroundColor: Color.fromARGB(255, 241, 128, 166),
      splashIconSize: 250,
      animationDuration: Duration(seconds: 1),
      nextScreen:initScreen==0 || initScreen==null? OnBoardingScreen():l=='null'?LoginScreen():BottomBar() ,
    );
  }
}