import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/controller/category-controller.dart';
import 'package:myshop/controller/home-controller.dart';
import 'package:myshop/controller/search_controller.dart';
import 'package:myshop/localization/change-locale.dart';
import 'package:myshop/model/allproduct-model.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchController searchController=Get.put(SearchController());
    LocaleController localeController=Get.find();
     CategoryController categoryController=Get.find();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 128, 166),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 241, 128, 166) ,
        elevation: 0,
      ),
      body: GetBuilder<SearchController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Search for a Product',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                TextField(
                  onChanged: (value)=>controller.searchMethod(value),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 241, 128, 166),
                    filled: true,
                    hintText: 'Find a Product',
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor:  Color.fromARGB(255, 209, 12, 77),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      // borderSide: BorderSide.
                    )
                  ),
                  
                ),
                SizedBox(height: 20,),
                Expanded(
                  child:controller.displaylist.length==0?Center(child: Text('No Result Found',style: TextStyle(fontFamily:localeController.myloc=="en"?'NotoSansLimbu':"Tajawal",color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),):
                       ListView.builder
                      (
                        itemCount:controller.displaylist.length,
                        itemBuilder: (context,i){
                             AllproductModel d=controller.displaylist[i];
                          return InkWell(
                               onTap: (){
                        categoryController.goToProductDetailPage(d.id!);
                      },
                            child: ListTile(
                              contentPadding: EdgeInsets.all(8),
                           title: Text(d.name!,style: TextStyle(fontFamily:localeController.myloc=="en"?'NotoSansLimbu':"Tajawal",color: Colors.white,fontWeight: FontWeight.bold)),
                           subtitle: Text(d.price!,style: TextStyle(fontFamily:localeController.myloc=="en"?'NotoSansLimbu':"Tajawal",color: Colors.white60,fontWeight: FontWeight.bold)) ,                        
                           leading: Container(
                            height: 50,
                            width: 50,
                             child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                               child: Image.network('${URL.imageUrl}'+'uploads/'+'${d.image}',fit: BoxFit.fill,
                                               ),
                             ),
                           ),                        
                            ),
                          );
                        }
                      )
                   )
              ],
            )
            );
        }
      ),
    );
  }
}