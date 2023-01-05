import 'package:ecom/views/listCategories.dart';
import 'package:ecom/views/listarticle.dart';
import 'package:ecom/views/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/OnBoardingPage',
        routes: {
     
          '/': (context) => listarticles(),
          '/categories' : (context) => listecategories(),
          '/OnBoardingPage': (context) => OnBoardingPage(),
},
      ),
    );
  }
}