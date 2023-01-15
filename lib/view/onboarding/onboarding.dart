import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/controller/onboarding-controller.dart';
import 'package:myshop/model/onboarding.dart';
import 'package:myshop/view/homeScreen/home.dart';
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
   OnBoadringController controller=Get.put(OnBoadringController());
    return Scaffold(
      // backgroundColor: Color(0xffffff),
    body:Obx(()=>Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                // controller: _controller,
                controller:controller.pagecontroller,
                onPageChanged: (int index){
               
                  controller.currentindex.value=index;
               
                },
                itemBuilder: (context,i){
                  return Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                  Image.asset(controller.pages[i].image!,height: 300,),
                   SizedBox(height: 35,),
                  Text(controller.pages[i].title!,style: TextStyle(
                    fontSize: 35,fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 20,),
                  Text(controller.pages[i].body!,style: TextStyle(
                    fontSize: 18,
                    
                    color: Colors.grey
                  ),
                  textAlign: TextAlign.center,
                  )
            
                      ],
                    ),
                  );
                },
                itemCount: controller.pages.length,
                ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:List.generate(controller.pages.length, (index) => buildDot(index,controller))
              ),
            ),
            Container(height: 60,
            width: double.infinity,
            color: AppColor.primaryColor,
      margin: EdgeInsets.all(40),
      child: MaterialButton(
        onPressed: (){
          if(controller.currentindex.value==controller.pages.length -1){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
          }
          controller.pagecontroller!.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
        },
        color: AppColor.primaryColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(controller.currentindex.value==controller.pages.length-1?'Continue':'Next'),),
            )
          ],
        ),
      ))
   
    );
  }
  Container buildDot(int index,OnBoadringController controller) {
    return Container(
              height: 10,
              width:controller.currentindex.value==index?25: 10,
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.primaryColor
              ),
            );
  }
}
