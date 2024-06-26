import 'package:fpg_flutter/app/controllers/auth_controller.dart';
import 'package:fpg_flutter/app/controllers/main_home_controller.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainHomeController());
    Get.lazyPut(() => AuthController()); // Initialize AuthController globally
    // You can put other bindings here
  }
}