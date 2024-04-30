import 'package:flutter/material.dart';
import 'package:quotes_app/utils/app_routes.dart';

bool isColor = false;
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Dancing'),
    debugShowCheckedModeBanner: false,
    routes: app_routes
    ,),);
}