import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:railway_v1/ui/login.dart';
import 'package:railway_v1/ui/profile.dart';
import 'package:railway_v1/utils/colors_file.dart';

class CustomHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 30,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            onDetailsPressed: () => debugPrint('hello'),
            accountName: Text("Nader " "Salah"),
            accountEmail: Text("nadersalah20201111@gmail.com"),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "images/drawerBackground.jpg",
                  ),
                  alignment: Alignment(1, 0.7),
                  fit: BoxFit.cover),
            ),
            currentAccountPicture: Container(
              padding: EdgeInsets.all(17),
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                "images/profile1.svg",
                fit: BoxFit.cover,
                width: 10,
                height: 10,
                color: whiteColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0),
            color: primaryAppColor,
            height: MediaQuery.of(context).size.height / 1.355,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.home, color: blackColor),
                  title: Text(
                    'Home Page',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
                ListTile(
                    leading: Icon(Icons.person, color: blackColor),
                    title: Text(
                      'My Profile',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    }),
                Divider(),
                ListTile(
                  leading: Icon(Icons.phone, color: blackColor),
                  title: Text(
                    'Contact Us',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: blackColor),
                  title: Text(
                    'Settings',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.help, color: blackColor),
                  title: new RichText(
                    text: new TextSpan(
                      children: [
                        new TextSpan(
                          text: 'Help',
                          style: new TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.power_settings_new, color: Colors.red),
                  title: Text(
                    'Logout',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
