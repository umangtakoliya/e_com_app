import 'package:ecom_cf_2/Screens/cart_page.dart';
import 'package:flutter/material.dart';

import 'Screens/detail_page.dart';
import 'Screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => HomePage(),
      'detail_page': (context) => Detail_Screen(),
      'cart_page': (context) => Cart_Page(),
    }),
  );
}
