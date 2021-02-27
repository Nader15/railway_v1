import 'package:flutter/material.dart';
import 'package:railway_v1/ui/SplahScreen.dart';
import 'package:railway_v1/ui/signUp.dart';
import 'package:railway_v1/ui/stations_test.dart';
import 'package:railway_v1/ui/home_page.dart';
import 'package:railway_v1/ui/train_tracking.dart';

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Railway-TestApp',
  // home: StationsTest(),
  // home: HomePage(),
  // home: TrainTracking(),
  home: SplashScreen(),
));
