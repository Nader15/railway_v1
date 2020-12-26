import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:railway_v1/utils/colors_file.dart';

class HomeScreen extends StatelessWidget {
  List<Widget> sliderImages = [
    Image(
      image: AssetImage("images/railwaySlider.png"),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage("images/trainGirl.jpeg"),
      fit: BoxFit.cover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryAppColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 200,
                child: CarouselSlider(
                  items: sliderImages,
                  options: CarouselOptions(
                    height: 400,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlayCurve: Curves.easeInOutQuad,
                    autoPlayAnimationDuration: Duration(milliseconds: 1500),
                  ),
                ), //Top Slider
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 13),
                child: Text(
                  'Application Overview',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(thickness: 0,),
              SizedBox(height: 10,),
              Container(
                height: 430,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Overview();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Overview() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30, left: 15, right: 15),
          alignment: Alignment.topCenter,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage("images/railwaySlider.png"),
                fit: BoxFit.cover,
              ),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20.0)]),
        ),
        Container(
          margin: EdgeInsets.only(left: 40, right: 40, bottom: 20),
          height: 100,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    offset: Offset(5.0, 5.0))
              ],
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          padding: EdgeInsets.all(10.0),
          child: Text(
              'first Step : you must Sign up with your information as a first time using this application and our parking services ,if you had an account and already used this application one day so you can sign in easly .'),
        ),
      ],
    );
  }
}
