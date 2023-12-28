import 'package:flutter/material.dart';
import 'package:flutter_getx_shayari/model/category.dart';
import 'package:flutter_getx_shayari/ui_helder/utils.dart';
import 'package:get/get.dart';
import 'pages/category_page.dart';
import 'pages/display_page.dart';
import 'pages/home_page.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blueColor),
        useMaterial3: true,
      ),
      home: SplashPage(),
      routes: {
        '/homepage': (context) => HomePage(),
        '/displaypage': (context) => DisplayPage(
          catename: Get.arguments.catename,
          shayari: Get.arguments.shayari,
        ),
        '/categorypage': (context) => CategoryPage(
          categoryname: Get.arguments.categoryname,
          index: Get.arguments.index,
        ),
      },
    );
  }
}
