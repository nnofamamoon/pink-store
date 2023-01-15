 import 'package:flutter/material.dart';
class AppColor{
static const Color primaryColor= Color.fromARGB(255, 243, 167, 220);
}

class URL{
  static const String primaryUrl='http://192.168.45.189:8000/api/';
  //  static const String primaryUrl='http://pinkshop.byethost31.com/api/';

  static const String imageUrl='http://192.168.45.189:8000/';
    // static const String imageUrl='http://pinkshop.byethost31.com/';

  static const String getDiscountProduct='${primaryUrl}'+'homeProduct';
  
    static const String signup='${primaryUrl}'+'signup';

static const String test='${primaryUrl}'+'justprint';

  static const String oneCategory='${primaryUrl}'+'getCategoryitem';

  static const String verifycode='${primaryUrl}'+'verifysignupcode';
  
  static const String login='${primaryUrl}'+'login';

  static const String oneproduct='${primaryUrl}'+'likesForOneproduct';

  static const String addTofavorite='${primaryUrl}'+'wishlist';

 static const String allfavoritedata='${primaryUrl}'+'getproductfavoraite';

 static const String addProductToCartTable='${primaryUrl}'+'addproducttocarttable';

static const String showCartProducts='${primaryUrl}'+'productInCartTable';

static const String increaseQuantity='${primaryUrl}'+'addproductquantity';

static const String decreaseQuantity='${primaryUrl}'+'removeproductquantity';

static const String homeProductwithoutToken='${primaryUrl}'+'homeProductwithoutToken';

static const String order='${primaryUrl}'+'checkOut';

    static const String imageAssetUrl='images/';

     static const String loading='${imageAssetUrl}'+'loading.json';

        static const String offline='${imageAssetUrl}'+'offline.json';

           static const String auth='${imageAssetUrl}'+'auth.json';
}
