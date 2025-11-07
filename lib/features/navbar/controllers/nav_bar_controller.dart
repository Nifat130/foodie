

import 'package:flutter/cupertino.dart';
import 'package:foodie/features/home/presentation/screens/home_screen.dart';
import 'package:foodie/features/navbar/presentation/screens/dummy_screen.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {

  var currentIndex = 0.obs;

  var listOfScreens = [
    HomeScreen(),
    DummyScreen(statusText: "Favorite Screen"),
    DummyScreen(statusText: "Cart Screen"),
    DummyScreen(statusText: "Bookmark Screen"),
    DummyScreen(statusText: "List Screen"),
  ];
}
