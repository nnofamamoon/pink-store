import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/handling-data-controller.dart';
import 'package:myshop/model/cart-model.dart';
import 'package:myshop/services/cart-data.dart';
import 'package:myshop/services/main-service.dart';
import 'package:myshop/services/order-data.dart';
import 'package:myshop/services/status-request.dart';
import 'package:myshop/view/bottom-bar.dart';
import 'package:myshop/view/shoppingCart/shopping-cart-view.dart';

class CartController extends GetxController{
  // int? productid;
  
@override
  void onInit() {
  showProductInCart();
    addressController=TextEditingController();
    super.onInit();
  }
 late TextEditingController addressController;
  String? DeliveryMethod;
  var totalprice;
  List productlist=[];
  List productDetaillist=[];
  MyServices myServices=Get.find();
  CartData testData=CartData(Get.find());
    String token='null';
    changeDelivaryMethod(String value){
      DeliveryMethod=value;
      update();
    }
late StatusRequest statusRequest;
  addtocart(int productid)async{
    print('addtocart');
     token=myServices.sharedPrefrence.getString('token')??'null';
     update();
    statusRequest=StatusRequest.loading;
    var response=await testData.getData(token,productid);
    print(response);
    print('---------------home controller');
    statusRequest=handlingData(response);
    print(statusRequest);
    if(StatusRequest.success==statusRequest){ 
if(response['success']=='already exists'){
Get.snackbar('Success', 'already exists in shopping cart',snackPosition: SnackPosition.TOP,);
}else{
   productlist=response['productDetail'].map((p)=>CartModel.fromJson(p)).toList();
   totalprice=response['allproductPrice'];
   print('totalprice');
   print(totalprice);
    update();
Get.to(ShoppingCart());
}

print('success');
 

    }
  
    update();
  }
  ////////////////////////////
  AllCartData mydata=AllCartData(Get.find());
  
showProductInCart()async{
     token=myServices.sharedPrefrence.getString('token')??'null';
     update();
    statusRequest=StatusRequest.loading;
    var response=await mydata.getData(token);
    print(response);
    print('---------------home controller');
    statusRequest=handlingData(response);
    print(response);
    var re=response['message'];
    if(re=='product not found'){
print('yes');
statusRequest=StatusRequest.none;
update();
    }else{
print(statusRequest);
    if(StatusRequest.success==statusRequest){ 

  productlist =response['message'].map((p)=>CartModel.fromJson(p)).toList();
    totalprice=response['allproductPrice'];
    print('/////////////////////');
    print(response['allproductPrice']);
    update();



print('success');
 

    }
    }
    
  
    update();
  }  
  ///////////////////////////////////////////////////
  increaseQuantity increasedata=increaseQuantity(Get.find());
  addQuentity(proid)async{
       token=myServices.sharedPrefrence.getString('token')??'null';
     update();
    statusRequest=StatusRequest.loading;
    var response=await increasedata.getData(proid,token);
    print(response);
    print('---------------home controller');
    statusRequest=handlingData(response);
    print(statusRequest);
    if(StatusRequest.success==statusRequest){ 

  productlist =response['message'].map((p)=>CartModel.fromJson(p)).toList();
   totalprice=response['allproductPrice'];
    update();



print('success');
 

    }
  
    update();
  }
  ////////////////////////////////////////////////////////
  decreseQuantity decreasedata=decreseQuantity(Get.find());
  decreaseQuentity(proid)async{
       token=myServices.sharedPrefrence.getString('token')??'null';
     update();
    statusRequest=StatusRequest.loading;
    var response=await decreasedata.getData(proid,token);
    print(response);
    print('---------------home controller');
    statusRequest=handlingData(response);
    print(statusRequest);
    if(StatusRequest.success==statusRequest){ 

  productlist =response['message'].map((p)=>CartModel.fromJson(p)).toList();
   totalprice=response['allproductPrice'];
    update();



print('success');
 

    }
  
    update();
  }
  ///////////////////////////////////////////////////////////////////
  OrderData orderdata=OrderData(Get.find());
  order()async{
   token=myServices.sharedPrefrence.getString('token')??'null';
     update();
    statusRequest=StatusRequest.loading;
    var response=await orderdata.getData(DeliveryMethod,addressController.text);
    print(response);
    print('---------------home controller');
    statusRequest=handlingData(response);
    print(statusRequest);
    if(StatusRequest.success==statusRequest){ 

  // productlist =response['message'].map((p)=>CartModel.fromJson(p)).toList();
  //  totalprice=response['allproductPrice'];
  //   update();
  productlist.clear();
  statusRequest=StatusRequest.none;
  update();
Get.defaultDialog(
  title: 'Success',
  middleText: 'Order complete successfully',
  titleStyle: TextStyle(fontFamily: 'NotoSansLimbu',fontWeight: FontWeight.bold,fontSize: 18),
  middleTextStyle: TextStyle(fontFamily: 'NotoSansLimbu'),
  textConfirm: 'OK',
  
  onConfirm: (){
    Get.to(BottomBar());
  }
);
// Get.to(BottomBar());

print('success');
 

    }
  
    update();
  }
}