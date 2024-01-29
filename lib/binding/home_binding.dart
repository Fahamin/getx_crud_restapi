import 'package:get/get.dart';
import 'package:getx_crud_restapi/controler/api_controler.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => UserController());
  }

}