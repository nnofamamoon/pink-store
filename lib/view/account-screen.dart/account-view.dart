import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/controller/account-controller.dart';
import 'package:myshop/controller/home-controller.dart';
import 'package:myshop/controller/logged-controller.dart';
import 'package:myshop/localization/change-locale.dart';
import 'package:myshop/model/discount-model.dart';
import 'package:myshop/view/order-detail/order-detail.dart';
class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    print('acccccccccount');
  LocaleController localeController=Get.find();
  LoggedController loggedController=Get.find();
  // AccountController accountController=Get.find();
  AccountController accountController=Get.put(AccountController());
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Theme(
        data: Theme.of(context).copyWith(
          brightness: Brightness.dark,
          primaryColor: Colors.purple
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                SizedBox(height: 30,),
            //  Container(
            //   width: double.infinity,
            //   height: 50,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10,),color: Colors.white
            //   ),
            //   child: ListTile(
            //     leading: Icon(Icons.language,weight: 30,),
            //     title: InkWell(
            //       onTap: (){
            //           localeController.changeLanguage("ar");
            //       },
            //       child: Text('Arabic'.tr,style: TextStyle(fontFamily:localeController.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15),)),
            //   ),
            //  ),
            //  SizedBox(height: 10,),
            //   Container(
            //   width: double.infinity,
            //   height: 50,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10,),color: Colors.white
            //   ),
            //   child: ListTile(
            //     leading: Icon(Icons.language,weight: 30,),
            //     title: InkWell(
            //       onTap: (){
            //           localeController.changeLanguage("en");
            //       },
            //       child: Text('English'.tr,style: TextStyle(fontFamily:localeController.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15))),
            //   ),
            //  ),
            //    SizedBox(height: 10,),
            //   Container(
            //   width: double.infinity,
            //   height: 50,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10,),color: Colors.white
            //   ),
            //   child: ListTile(
            //     leading: Icon(Icons.logout_outlined,weight: 30,),
            //     title: InkWell(
            //       onTap: (){
            //         loggedController.logout();
            //       },
            //       child: Text('Logout'.tr,style: TextStyle(fontFamily:localeController.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15))),
            //   ),
            //  ),
          GetBuilder<AccountController>(
            builder: (controller) {
              return Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage('${URL.imageUrl}'+'uploads/'+'${controller.image}',),fit: BoxFit.cover),
                      border: Border.all(width: 2)
                    ),
                  ),
                  SizedBox(height: 11,),
                 
                  
                    
                      Text('${controller.name}',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                         SizedBox(height: 11,),
                      Text('${controller.address}',style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey.shade700)),
                         SizedBox(height: 11,),
                      Text('${controller.email}',style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey.shade700)),
                  
                ],
              );
            }
          ),
          SizedBox(height: 20,),
          ListTile(
            onTap: (){
  localeController.changeLanguage("ar");
            },
            title: Text('Arabic'.tr,style: TextStyle(fontFamily:localeController.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15)),
            leading: Icon(Icons.language,color: Colors.grey.shade700,),
          ),
          SizedBox(height: 10,),
            ListTile(
            onTap: (){
  localeController.changeLanguage("en");
            },
            title: Text('English'.tr,style: TextStyle(fontFamily:localeController.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15)),
            leading: Icon(Icons.language,color: Colors.grey.shade700,),
          ),
          SizedBox(height: 10,),
            ListTile(
              onTap: (){
              Get.to(OrderDetail());
              },
            title: Text('order history'.tr,style: TextStyle(fontFamily:localeController.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15)),
            leading: Icon(Icons.history_edu_outlined,color: Colors.grey.shade700,),
          ),
             SizedBox(height: 10,),
               ListTile(
              onTap: (){
               
              },
            title: Text('Usage policy'.tr,style: TextStyle(fontFamily:localeController.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15)),
            leading: Icon(Icons.policy,color: Colors.grey.shade700,),
          ),
             SizedBox(height: 10,),
            ListTile(
              onTap: (){
                 loggedController.logout();
              },
            title: Text('Logout'.tr,style: TextStyle(fontFamily:localeController.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15)),
            leading: Icon(Icons.logout_sharp,color: Colors.grey.shade700,),
          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}