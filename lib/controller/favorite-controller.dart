import 'package:get/get.dart';
import 'package:myshop/controller/handling-data-controller.dart';
import 'package:myshop/controller/home-controller.dart';
import 'package:myshop/model/discount-model.dart';
import 'package:myshop/model/favorite-list-model.dart';
import 'package:myshop/services/all-favorite-data.dart';
import 'package:myshop/services/favorite-data.dart';
import 'package:myshop/services/main-service.dart';
import 'package:myshop/services/status-request.dart';

class FavoriteController extends GetxController{
  AllFavoriteData favoriteData=AllFavoriteData(Get.find());
  MyServices myServices=Get.find();
  String token='null';
  List Favoritelist=[];
  @override
  void onInit() {
  token=myServices.sharedPrefrence.getString('token')??'null';
  update();
 favData();
    super.onInit();
  }
  late StatusRequest statusRequest;
  
   favData()async{
    statusRequest=StatusRequest.loading;
 token=myServices.sharedPrefrence.getString('token')??'null';

 update();
    var response=await favoriteData.getData(token);
    print(response);
    print('---------------favorite data controller');
  
    statusRequest=handlingData(response);
    print(statusRequest);
    if(StatusRequest.success==statusRequest){ 
  Favoritelist =response['message'].map((p)=>FavoriteList.fromJson(p)).toList();
  update();
 print(response);

    }
    // else{
     
    //   print('false;');
    //  update();
    // }
   
    update();
  }
  /////////////////////////
  FavoriteData unlikedata=FavoriteData(Get.find());
  HomeController ho=Get.find();
  unlike(int productid)async{
    var token=myServices.sharedPrefrence.getString('token')??'null';
    statusRequest=StatusRequest.loading;
    var response=await unlikedata.getData(productid,token);
    print(response);
    print('---------------home controller');
    statusRequest=handlingData(response);
    print(statusRequest);
    if(StatusRequest.success==statusRequest){ 
  // oneproductdata =response['one'].map((p)=>AllproductModel.fromJson(p)).toList();
Favoritelist=response['allFavoriteForonePerson'].map((p)=>FavoriteList.fromJson(p)).toList();
ho.getData();
// ho.discountProduct=response['Discounts'].map((p)=>DiscountModel.fromJson(p)).toList();
  update();
//  print(ho.discountProduct);

    }
    else{
     
      print('false;');
     update();
    }
    // else{
    // statusRequest=StatusRequest.failure;
    // }
    update();
  }
}