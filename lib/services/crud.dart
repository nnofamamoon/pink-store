import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myshop/services/check-internet.dart';
import 'package:myshop/services/main-service.dart';
import 'package:myshop/services/status-request.dart';

class Crud{

  Future<Either<StatusRequest,Map>> postData(String linkUrl,String token)async{
    print('start');
try{
  if(await checkInternet()){
   
   
    MyServices myServices=Get.find();
  // String token=myServices.sharedPrefrence.getString('token')??'null';
String t=  myServices.sharedPrefrence.getString('token')!;
 print('start1');
 print(t);
var response=await http.get(Uri.parse(linkUrl),
headers: {
   'Authorization':'Bearer $t',
  'Accept':'application/json',
  'Content-Type':'application/json'
}
);
print(response);
print(response.statusCode);
if(response.statusCode == 200 || response.statusCode == 201){
  print(200);
  var responsebody=jsonDecode(response.body);
   print('+++++++++++');
  // print(responsebody);
  print(responsebody);
  // print(responsebody);
  // return Right({"status":"success"});
  return Right(responsebody);
}else{
  return Left(StatusRequest.none);
}
}else{
  print('crud');
  print(Left(StatusRequest.offlinefailure));
  return Left(StatusRequest.offlinefailure);
}
}catch(e){
return Left(StatusRequest.serverException);
}
  }

  Future<Either<StatusRequest,Map>> oneCategory(String linkUrl,var data)async{
    print('start');
try{
  if(await checkInternet()){
    print('start1CATE');
  
    print('ddddd');
    // print('http://192.168.239.189:8000/api/getCategoryitem/'+data);
var response=await http.get(Uri.parse('http://192.168.45.189:8000/api/getCategoryitem/$data'));
print(response);
if(response.statusCode == 200 || response.statusCode == 201){
  print(200);
  var responsebody=jsonDecode(response.body);
   print('+++++++++++');
  // print(responsebody);
  print(responsebody);
  // print(responsebody);
  // return Right({"status":"success"});
  return Right(responsebody);
}else{
  return Left(StatusRequest.serverfailure);
}
}else{
  print('crud');
  print(Left(StatusRequest.offlinefailure));
  return Left(StatusRequest.offlinefailure);
}
}catch(e){
return Left(StatusRequest.serverException);
}
  }

    Future<Either<StatusRequest,Map>> Signup(String linkUrl,var data)async{
    print('start');
try{
  if(await checkInternet()){
    print('net');
  var request=http.MultipartRequest('POST',Uri.parse(linkUrl));
  print('start');
 request.files.add(await http.MultipartFile.fromPath("image",data['image']));
 print('start1');
 request.fields.addAll({
 'name':data['name'],
      'email':data['email'],
      'password':data['password'],
      'phone':data['phone'],
      'address':data['address'],
 });
// request.fields['name']=nam
 request.headers.addAll({
   'Content-type':'multipart/form-data'
 });
 print('kh');
var response=await request.send();
print('ss');
var res=await http.Response.fromStream(response);
// final responsedata=jsonDecode(res.body);
print(res.body);
print(res.statusCode);
if(res.statusCode==200 || res.statusCode==201){
 print(200);
  return Right({"status":"success"}); 
}else{
 print('server fai;');
      return Left(StatusRequest.serverfailure);
}
}else{
  print('crud');
  print(Left(StatusRequest.offlinefailure));
  return Left(StatusRequest.offlinefailure);
}
}catch(e){
return Left(StatusRequest.serverException);
}
  }
////////////////////////////////////////////////////////
   Future<Either<StatusRequest,Map>> verifycode(String linkUrl,var data)async{
   
try{
  if(await checkInternet()){

var response=await http.post(Uri.parse(linkUrl),body:data);


if(response.statusCode == 200 || response.statusCode == 201){
   print('verifycode');
     print('verifycode');
       print('verifycode');
  var responsebody=jsonDecode(response.body);
 
  // print(responsebody);
  // return Right({"status":"success"});
  return Right(responsebody);
  
}else{
  return Left(StatusRequest.serverfailure);
}
}else{
  print('crud');
  print(Left(StatusRequest.offlinefailure));
  return Left(StatusRequest.offlinefailure);
}
}catch(e){
return Left(StatusRequest.serverException);
}
  }
  
   Future<Either<StatusRequest,Map>> addTofavorite(String linkUrl,var data,token)async{
   
try{
  if(await checkInternet()){
// print('net');
// print(linkUrl);
// print(data);
// print(token);
print(data);
var response=await http.post(Uri.parse('$linkUrl/$data'),headers: {
  'Authorization':'Bearer $token',
  'Accept':'application/json',
  'Content-Type':'application/json'
});
print('after');
if(response.statusCode == 200 || response.statusCode == 201){
   print('200');
    
  var responsebody=jsonDecode(response.body);
 
  // print(responsebody);
  // return Right({"status":"success"});
  return Right(responsebody);
  
}else{
  return Left(StatusRequest.serverfailure);
}
}else{
  print('crud');
  print(Left(StatusRequest.offlinefailure));
  return Left(StatusRequest.offlinefailure);
}
}catch(e){
return Left(StatusRequest.serverException);
}
  }
  //////////////////////////////////////////////
  

   Future<Either<StatusRequest,Map>> oneProduct(String linkUrl,var data,token)async{
   
try{
  if(await checkInternet()){
// print('net');
// print(linkUrl);
// print(data);
// print(token);
print(data);
var response=await http.get(Uri.parse('$linkUrl/$data'),headers: {
  'Authorization':'Bearer $token',
  'Accept':'application/json',
  'Content-Type':'application/json'
});
print('after');
print(response.statusCode);
if(response.statusCode == 200 || response.statusCode == 201){
   print('200');
    
  var responsebody=jsonDecode(response.body);
 
  // print(responsebody);
  // return Right({"status":"success"});
  return Right(responsebody);
  
}else{
  return Left(StatusRequest.serverfailure);
}
}else{
  print('crud');
  print(Left(StatusRequest.offlinefailure));
  return Left(StatusRequest.offlinefailure);
}
}catch(e){
return Left(StatusRequest.serverException);
}
  }
  ///////////////////////////////////////////////
    Future<Either<StatusRequest,Map>> getallfavoritedata(String linkUrl,token)async{
   
try{
  if(await checkInternet()){
var response=await http.get(Uri.parse(linkUrl),headers: {
  'Authorization':'Bearer $token',
  'Accept':'application/json',
  'Content-Type':'application/json'
});
print('after');
print(response.statusCode);
if(response.statusCode == 200 || response.statusCode == 201){
   print('200');
    
  var responsebody=jsonDecode(response.body);
 
  // print(responsebody);
  // return Right({"status":"success"});
  return Right(responsebody);
  
}else{
  return Left(StatusRequest.serverfailure);
}
}else{
  print('crud');
  print(Left(StatusRequest.offlinefailure));
  return Left(StatusRequest.offlinefailure);
}
}catch(e){
return Left(StatusRequest.serverException);
}
  }
  ///////////////////////////////////////////////////////
  Future<Either<StatusRequest,Map>> addProductToCartTable(String linkUrl,var data,token)async{
   print(data);
try{
  if(await checkInternet()){
// print('net');

// print(data);
// print(token);

var response=await http.post(Uri.parse('$linkUrl/$data'),headers: {
  'Authorization':'Bearer $token',
  'Accept':'application/json',
  'Content-Type':'application/json'
});


if(response.statusCode == 200 || response.statusCode == 201){
   print('200');
    
  var responsebody=jsonDecode(response.body);
 
  // print(responsebody);
  // return Right({"status":"success"});
  return Right(responsebody);
  
}else{
  return Left(StatusRequest.serverfailure);
}
}else{
  print('crud');
  print(Left(StatusRequest.offlinefailure));
  return Left(StatusRequest.offlinefailure);
}
}catch(e){
return Left(StatusRequest.serverException);
}
  }
  ////////////////////////////////////////////////////////////////////////////////
  
  Future<Either<StatusRequest,Map>> showCartProducts(String linkUrl,token)async{
   
try{
  if(await checkInternet()){
// print('net');
// print(linkUrl);
// print(data);
// print(token);

var response=await http.get(Uri.parse('$linkUrl'),headers: {
  'Authorization':'Bearer $token',
  'Accept':'application/json',
  'Content-Type':'application/json'
});
print('after');
print(response.statusCode);
if(response.statusCode == 200 || response.statusCode == 201){
   print('200');
    
  var responsebody=jsonDecode(response.body);
 
  // print(responsebody);
  // return Right({"status":"success"});
  return Right(responsebody);
  
}else{
  return Left(StatusRequest.serverfailure);
}
}else{
  print('crud');
  print(Left(StatusRequest.offlinefailure));
  return Left(StatusRequest.offlinefailure);
}
}catch(e){
return Left(StatusRequest.serverException);
}
  }
  //////////////////////////////////////
  
    Future<Either<StatusRequest,Map>> increaseQuantity(String linkUrl,var data,token)async{
   print(data);
try{
  if(await checkInternet()){
// print('net');

// print(data);
// print(token);

var response=await http.post(Uri.parse('$linkUrl/$data'),headers: {
  'Authorization':'Bearer $token',
  'Accept':'application/json',
  'Content-Type':'application/json'
});


if(response.statusCode == 200 || response.statusCode == 201){
   print('200');
    
  var responsebody=jsonDecode(response.body);
 
  // print(responsebody);
  // return Right({"status":"success"});
  return Right(responsebody);
  
}else{
  return Left(StatusRequest.serverfailure);
}
}else{
  print('crud');
  print(Left(StatusRequest.offlinefailure));
  return Left(StatusRequest.offlinefailure);
}
}catch(e){
return Left(StatusRequest.serverException);
}
  }
  ///////////////////////////////////////////////////////
  
  Future<Either<StatusRequest,Map>> decreaseQuantity(String linkUrl,var data,token)async{
   print(data);
try{
  if(await checkInternet()){
// print('net');

// print(data);
// print(token);

var response=await http.post(Uri.parse('$linkUrl/$data'),headers: {
  'Authorization':'Bearer $token',
  'Accept':'application/json',
  'Content-Type':'application/json'
});


if(response.statusCode == 200 || response.statusCode == 201){
   print('200');
    
  var responsebody=jsonDecode(response.body);
 
  // print(responsebody);
  // return Right({"status":"success"});
  return Right(responsebody);
  
}else{
  return Left(StatusRequest.serverfailure);
}
}else{
  print('crud');
  print(Left(StatusRequest.offlinefailure));
  return Left(StatusRequest.offlinefailure);
}
}catch(e){
return Left(StatusRequest.serverException);
}
  }
  /////////////////////////////////////////////////////
  
   Future<Either<StatusRequest,Map>> homeProductwithoutToken(String linkUrl)async{
   
try{
  if(await checkInternet()){
var response=await http.get(Uri.parse(linkUrl),headers: {
  // 'Authorization':'Bearer $token',
  'Accept':'application/json',
  'Content-Type':'application/json'
});
print('after');
print(response.statusCode);
if(response.statusCode == 200 || response.statusCode == 201){
   print('200');
    
  var responsebody=jsonDecode(response.body);
 
  // print(responsebody);
  // return Right({"status":"success"});
  return Right(responsebody);
  
}else{
  return Left(StatusRequest.serverfailure);
}
}else{
  print('crud');
  print(Left(StatusRequest.offlinefailure));
  return Left(StatusRequest.offlinefailure);
}
}catch(e){
return Left(StatusRequest.serverException);
}
  }
  ///////////////////////////////////////////////////
   Future<Either<StatusRequest,Map>> order(String linkUrl,var data)async{
    print('////////////');
   print(linkUrl);
try{
  if(await checkInternet()){
 MyServices myServices=Get.find();
  // String token=myServices.sharedPrefrence.getString('token')??'null';
String t=  myServices.sharedPrefrence.getString('token')!;
var response=await http.post(Uri.parse(linkUrl),headers: {
  'Authorization':'Bearer $t',
},body:data);
  print('verifycode');

if(response.statusCode == 200 || response.statusCode == 201){
   print('verifycode');
     print('verifycode');
     
  var responsebody=jsonDecode(response.body);
 
  // print(responsebody);
  // return Right({"status":"success"});
  return Right(responsebody);
  
}else{
  return Left(StatusRequest.serverfailure);
}
}else{
  print('crud');
  print(Left(StatusRequest.offlinefailure));
  return Left(StatusRequest.offlinefailure);
}
}catch(e){
return Left(StatusRequest.serverException);
}
  }
}
