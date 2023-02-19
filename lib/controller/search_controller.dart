import 'package:get/get.dart';
import 'package:myshop/model/allproduct-model.dart';

class SearchController extends GetxController{
  List allProductList=[];
 List products=[];
 List displaylist=[];
  initialData() {
 allProductList=Get.arguments['allproducts'];
 update();
  displaylist=List.from(allProductList);
 update();
  }
  //search method
  searchMethod(String value){
    displaylist=allProductList.where((element) => element.name!.toLowerCase().contains(value.toLowerCase())).toList();
 update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    initialData();
    super.onInit();
  }
}