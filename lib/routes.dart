import 'package:fpg_flutter/app/views/main_home.dart';
import 'package:fpg_flutter/main_bindings.dart';
import 'package:get/get.dart';

//pages paths
const accountPath = '/ucenter';
const profileChangePasswordPath = '/change-password';
const homePath = '/home';

final List<GetPage> routes = [
  GetPage(name: '/', page: () => MainHome(), binding: MainBindings(),),
  GetPage(name: homePath, page: () => MainHome(), binding: MainBindings(),),
  // GetPage(name: accountPath, page: () => AccountView()),
  // GetPage(name: '/settings', page: () => SettingsView()),
  // Add more routes as needed
];