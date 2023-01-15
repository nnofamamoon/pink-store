import 'package:get/get.dart';
import 'package:myshop/controller/favorite-controller.dart';
import 'package:myshop/controller/handling-data-controller.dart';
import 'package:myshop/controller/home-controller.dart';
import 'package:myshop/model/allproduct-model.dart';
import 'package:myshop/model/discount-model.dart';
import 'package:myshop/model/favorite-list-model.dart';
import 'package:myshop/services/favorite-data.dart';
import 'package:myshop/services/main-service.dart';
import 'package:myshop/services/product-detail-data.dart';
import 'package:myshop/services/status-request.dart';

class ProductDetailController extends GetxController{
  int? oneproduct;
  initialData() {
 oneproduct=Get.arguments['oneProduct'];
 update();
print(oneproduct);
 update();
  }
  @override
  void onInit() {
    initialData();
    getData(oneproduct!);
    super.onInit();

  }
 
ProductDetailData testData=ProductDetailData(Get.find());
MyServices myServices=Get.find();
   List oneproductdata=[];
   String token='null';
  late StatusRequest statusRequest;
  getData(int oneproduct)async{
     token=myServices.sharedPrefrence.getString('token')??'null';
     update();
    statusRequest=StatusRequest.loading;
    print('///////////');
    print(oneproduct);
    var response=await testData.getData(oneproduct,token);
    print(response);
    print('---------------home controller');
    statusRequest=handlingData(response);
    print(statusRequest);
    if(StatusRequest.success==statusRequest){ 
 
  oneproductdata =response['one'].map((p)=>AllproductModel.fromJson(p)).toList();
    }
    // else{
    // statusRequest=StatusRequest.failure;
    // }
    update();
  }
FavoriteData favoriteData=FavoriteData(Get.find());
FavoriteController favorits=Get.find();
HomeController homeController=Get.find();
   favData(int productid,String token)async{
    statusRequest=StatusRequest.loading;
    var response=await favoriteData.getData(productid,token);
    print(response);
    print('---------------home controller');
    statusRequest=handlingData(response);
    print(statusRequest);
    if(StatusRequest.success==statusRequest){ 
  oneproductdata =response['one'].map((p)=>AllproductModel.fromJson(p)).toList();
favorits.Favoritelist=response['allFavoriteForonePerson'].map((p)=>FavoriteList.fromJson(p)).toList();
homeController.getData();
  update();
 print(response);

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