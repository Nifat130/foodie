import 'package:foodie/features/home/presentation/screens/home_screen.dart';
import 'package:foodie/features/navbar/presentation/screens/nav_bar_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static String init = "/";
  static String homeScreen = "/homeScreen";

  static List<GetPage> routes = [
    GetPage(name: init, page: () => NavBarScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
  ];
}