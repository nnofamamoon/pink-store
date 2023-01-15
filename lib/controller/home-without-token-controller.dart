import 'package:get/get.dart';
import 'package:myshop/controller/handling-data-controller.dart';
import 'package:myshop/model/allproduct-model.dart';
import 'package:myshop/model/category-model.dart';
import 'package:myshop/model/discount-model.dart';
import 'package:myshop/services/home-without-token-data.dart';
import 'package:myshop/services/main-service.dart';
import 'package:myshop/services/status-request.dart';

class HomeWithoutTokenController extends GetxController{
  HomeWithoutTokenData testData=HomeWithoutTokenData(Get.find());
   late StatusRequest statusRequest;
    List discountProduct=[];
   List categories=[];
     List allproduct=[];
     MyServices myServices=Get.find();
     String token='null';
  getData()async{
     
     update();
    statusRequest=StatusRequest.loading;
    var response=await testData.getData();
    print(response);
    print('---------------home without token controller');
    statusRequest=handlingData(response);
    print(statusRequest);
    if(StatusRequest.success==statusRequest){ 
  
   discountProduct=response['Discounts'].map((p)=>DiscountModel.fromJson(p)).toList();
  categories =response['categories'].map((p)=>CategoriesModel.fromJson(p)).toList();
  allproduct=response['allproducts'].map((p)=>AllproductModel.fromJson(p)).toList();
  update();

  print('data');
  print(discountProduct);
  
    }
    // else{
    // statusRequest=StatusRequest.failure;
    // }
    update();
  }
  @override
  void onInit() {
      token=myServices.sharedPrefrence.getString('token')??'null';
    getData();
    super.onInit();
  }
}