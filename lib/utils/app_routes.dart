import 'package:flutter/material.dart';
import 'package:quotes_app/screen/edit/edit_screen.dart';
import 'package:quotes_app/screen/home/home_screen.dart';
import 'package:quotes_app/screen/quotes/quotes_screen.dart';
import 'package:quotes_app/screen/splash/splash_screen.dart';

Map<String,WidgetBuilder> app_routes =
{
  "/":(context) => SplashScreen(),
  "home":(context) => HomeScreen(),
  "quotes":(context) => QuotesScreen(),
  "edit":(context) => EditScreen(),

};

