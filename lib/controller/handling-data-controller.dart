import 'package:myshop/services/status-request.dart';

handlingData(response){
if(response is StatusRequest){
return response;
}else{
return StatusRequest.success;
}
}