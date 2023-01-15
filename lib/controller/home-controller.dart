import 'package:get/get.dart';
import 'package:myshop/controller/handling-data-controller.dart';
import 'package:myshop/model/allproduct-model.dart';
import 'package:myshop/model/category-model.dart';
import 'package:myshop/model/favorite-list-model.dart';
import 'package:myshop/services/main-service.dart';
import 'package:myshop/services/my-data.dart';
import 'package:myshop/services/status-request.dart';
import 'package:myshop/model/discount-model.dart';
import 'package:myshop/view/category-section/one-category.dart';
class HomeController extends GetxController{
 
   int currentpage=0;
  changepage(int v){
currentpage=v;
update();
  }
MyServices myServices=Get.find();
  HomeData testData=HomeData(Get.find());
  List discountProduct=[];
   List categories=[];
     List allproduct=[];
      List favorite=[];
      String token='null';
  late StatusRequest statusRequest;
  getData()async{
     token=myServices.sharedPrefrence.getString('token')??'null';
     update();
    statusRequest=StatusRequest.loading;
    var response=await testData.getData(token);
    print(response);
    print('---------------home controller');
    statusRequest=handlingData(response);
    print(statusRequest);
    if(StatusRequest.success==statusRequest){ 
  print('Discounts Discounts Discounts');
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
  void onInit()async {
   token=myServices.sharedPrefrence.getString('token')??'null';
update();
print('controller token');
print(token);
    getData();
    super.onInit();
  }
// List allCategories=[];
// int? catid;
    GoToOneCategory(allCategories,catid){
Get.to(OneCategory(),arguments: {
    "categories":allCategories,
    "categoryid":catid
  });
  update();
  }
 
}