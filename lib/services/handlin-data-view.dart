import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myshop/constants/constants.dart';
import 'package:myshop/services/status-request.dart';
class HandlingDataView extends StatelessWidget {
   final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
     return statusRequest==StatusRequest.loading ? Center(child: Lottie.asset(URL.loading,width: 70)):
    statusRequest==StatusRequest.offlinefailure?Center(child: Lottie.asset(URL.offline)) :
    statusRequest==StatusRequest.serverfailure?Center(child: Text('server failure')) :
    statusRequest==StatusRequest.failure?Center(child: Text('no data')) :statusRequest==StatusRequest.none? 
    Center(child:Text('no Item in shopping cart')): widget
    ;
  }
}