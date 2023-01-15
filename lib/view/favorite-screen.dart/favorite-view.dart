import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/controller/favorite-controller.dart';
import 'package:myshop/controller/home-controller.dart';
import 'package:myshop/controller/product-detail-controller.dart';
import 'package:myshop/localization/change-locale.dart';
import 'package:myshop/localization/translate-database.dart';
import 'package:myshop/model/favorite-list-model.dart';
class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController localeController=Get.find();
    FavoriteController controller=Get.find();
 HomeController homeController=Get.find();
    print('favfav');
    return Scaffold(
  body: GetBuilder<FavoriteController>(
    builder: (controller) {
      return controller.Favoritelist.isEmpty?Center(child: Text('No Favorite item'.tr,style: TextStyle(fontFamily:localeController.myloc=="en"?'NotoSansLimbu':"Tajawal",fontWeight: FontWeight.bold,fontSize: 20),)) :
      SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child:ListView.builder(
            itemCount: controller.Favoritelist.length,
            itemBuilder: (context,i){
              FavoriteList fav=controller.Favoritelist[i];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: Image.network(  '${URL.imageUrl}'+'uploads/'+'${fav.pinkproduct!.image}',
                                      fit: BoxFit.fill,width: 100,height: 100,),
                    title:Text(translateDatabase( fav.pinkproduct!.name!,fav.pinkproduct!.arName!),
                   style: TextStyle(fontFamily:localeController.myloc=="en"?'NotoSansLimbu':"Tajawal",fontSize: 15)
                    )
                    
                 
                     ,
                    subtitle: Text(fav.pinkproduct!.price!+'\$'),
                    trailing: InkWell(
                      onTap: (){
// productDetailController.favData(fav.pinkproduct!.id!, controller.token);
controller.unlike(fav.pinkproduct!.id!);
homeController.getData();
                      },
                      child: Icon(Icons.favorite,color: Colors.red,)),
                  ),
                ),
              );
            }
            ) ,
        ),
        ));
    }
  ),
    );
  }
}