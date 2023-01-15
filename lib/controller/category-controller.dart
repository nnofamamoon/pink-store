import 'package:get/get.dart';
import 'package:myshop/controller/handling-data-controller.dart';
import 'package:myshop/model/allproduct-model.dart';
import 'package:myshop/model/category-model.dart';
import 'package:myshop/model/category-product-model.dart';
import 'package:myshop/services/favorite-data.dart';
import 'package:myshop/services/onecategory-data.dart';
import 'package:myshop/services/status-request.dart';
import 'package:myshop/view/category-section/one-category.dart';
import 'package:myshop/view/product-detail.dart/product-detail.dart';


class CategoryController extends GetxController{
  List Categories=[];
 int? oneproductlist;
  int? catid;
  initialData(categories,cateid) {
//  Categories=Get.arguments['categories'];
//  catid=Get.arguments['categoryid'];
Categories=categories;
catid=cateid;
 print('catidcatidcatidcatid');
 print(cateid);
 print(Categories);
  // update();
 getData(cateid!);
 Get.to(OneCategory());
 update();
  }
  changeBetweenCategories(int catidnew){
    catid=catidnew;
    print('idididididididid');
    print(catid);
    update();
getData(catidnew);
update();
  }
  goToProductDetailPage(int oneproduct){
    
oneproductlist=oneproduct;
update();
print('category controller detail');
    print(oneproductlist);
     Get.to(ProductDetail(),arguments: {
      "oneProduct":oneproduct,
     });
     
  //   Get.to(ProductDetail(),arguments: {
  //   "oneProduct":oneproduct,
  
  // } );
  }
    OneCategoryData testData=OneCategoryData(Get.find());

   List onecategory=[];
  
  late StatusRequest statusRequest;
  getData(int catid)async{
    onecategory.clear();
    statusRequest=StatusRequest.loading;
    var response=await testData.getData(catid);
    print(response);
    print('---------------home controller');
    statusRequest=handlingData(response);
    print(statusRequest);
    if(StatusRequest.success==statusRequest){ 
 
  onecategory =response['itemsCategory'].map((p)=>CategoryProductModel.fromJson(p)).toList();
    }
    // else{
    // statusRequest=StatusRequest.failure;
    // }
    update();
  }
  @override
  void onInit() {
    // initialData();
    // getData();
    
    super.onInit();
  }

 
}