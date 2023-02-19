import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/account-controller.dart';
import 'package:myshop/controller/favorite-controller.dart';
import 'package:myshop/controller/home-controller.dart';
import 'package:myshop/controller/logged-controller.dart';
import 'package:myshop/controller/product-detail-controller.dart';
import 'package:myshop/controller/verifycode-signup-controller.dart';
import 'package:myshop/localization/change-locale.dart';
import 'package:myshop/localization/translation.dart';
import 'package:myshop/services/crud.dart';
import 'package:myshop/services/main-service.dart';
import 'package:myshop/view/authentication/login-screen.dart';
import 'package:myshop/view/bottom-bar.dart';
import 'package:myshop/view/homeScreen/home.dart';
import 'package:myshop/view/onboarding/onboarding.dart';
import 'package:myshop/view/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/bottom-bar-without-token/BottomBar-Without-Token-view.dart';
int? initScreen;
var l;
void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
    MyServices myServices=Get.find();
  initScreen=await myServices.sharedPrefrence.getInt("initScreen");
  print('initScreenmain');
  print(initScreen);
  await  myServices.sharedPrefrence.setInt("initScreen", 1);
final pref=await SharedPreferences.getInstance();
 l=pref.getString('token');
print(l);
//  vecontroller.islogged=myServices.sharedPrefrence.getString('token')??'null';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller=Get.put(LocaleController());
     Crud controller2=Get.put(Crud());
     LoggedController locon=Get.put(LoggedController());
      HomeController homeController=Get.put(HomeController());
     FavoriteController favorits=Get.put(FavoriteController());
 AccountController accountController=Get.put(AccountController());
     print('logcontroll');
     print(locon.islogged);
      //  VerifycodeSignupController vecontroller=Get.put(VerifycodeSignupController());
    
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: MyTranslation(),
      locale: controller.language,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    home: SplashScreen(),
    //  home:initScreen==0 || initScreen==null? OnBoardingScreen():l=='null'?LoginScreen():BottomBar(),
    );
  }
}
