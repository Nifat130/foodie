import 'package:foodie/features/home/presentation/screens/home_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static String init = "/";

  static List<GetPage> routes = [
    GetPage(name: init, page: () => HomeScreen()),
  ];
}