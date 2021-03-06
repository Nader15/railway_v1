import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:railway_v1/ApiFunctions/shared.dart';
import 'package:railway_v1/ui/home_page.dart';
import 'package:railway_v1/ui/second.dart';
import 'package:railway_v1/utils/colors_file.dart';
import 'package:railway_v1/utils/global_vars.dart';
import 'dart:async';

import 'package:railway_v1/utils/navigator.dart';



// ignore: camel_case_types
class SplashScreen extends StatefulWidget {
  @override
  _openState createState() => _openState();
}

// ignore: camel_case_types
class _openState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      getUserTocken(context).then((value) {

        print("UserTocken:: ${UserTocken}");
        if(UserTocken=="null"){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Second()));

        }
        else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryAppColor,
      body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("images/train.svg",color: blackColor,height: 100,),
              SizedBox(height: 20),
              Text("Railway",style: TextStyle(color:blackColor,fontSize: 40 ),),
            ],
          )
      ),
    );
  }
}
