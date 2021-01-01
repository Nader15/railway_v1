import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:railway_v1/ui/home_screen.dart';
import 'package:railway_v1/ui/profile.dart';
import 'package:railway_v1/ui/trips.dart';
import 'package:railway_v1/utils/colors_file.dart';
import 'package:railway_v1/utils/custom_widgets/custom_home_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final items = [
      HomeScreen(),
      Trips(),
      Center(
        child: Text("You don't have tickets, yet ."),
      ),
      Profile(),
    ];
    return Scaffold(
        drawer: CustomHomeDrawer(),
        bottomNavigationBar: Row(
          children: [
            BuildNavBar('images/HomeIcon1.svg', 'images/HomeIcon2.svg', 'Home',
                true, 0),
            BuildNavBar('images/destination2.svg', 'images/destination.svg',
                'Trips', true, 1),
            BuildNavBar(
                'images/ticket.svg', 'images/ticket.svg', 'Tickets', true, 2),
            BuildNavBar('images/profile1.svg', 'images/profile2.svg', 'Profile',
                true, 3),
          ],
        ),
        body: items[_currentIndex]);
  }

  Widget BuildNavBar(
      String icon1, String icon2, String name, bool isActive, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
          alignment: Alignment.center,
          height: 70,
          width: MediaQuery.of(context).size.width / 4,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 4,
                color: index == _currentIndex
                    ? primaryAppColor
                    : Colors.transparent,
              ),
            ),
            color: blackColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              index == _currentIndex
                  ? SvgPicture.asset(
                      icon1,
                      color: index == _currentIndex
                          ? primaryAppColor
                          : Colors.grey,
                      width: 22,
                      height: 25,
                    )
                  : SvgPicture.asset(
                      icon2,
                      color: index == _currentIndex
                          ? primaryAppColor
                          : Colors.grey,
                      width: 22,
                      height: 22,
                    ),
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(
                    color:
                        index == _currentIndex ? primaryAppColor : Colors.grey),
              )
            ],
          )),
    );
  }
}
