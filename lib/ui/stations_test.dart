import 'package:flutter/material.dart';
import 'package:railway_v1/ApiFunctions/Api.dart';
import 'package:railway_v1/models/stations.dart';
import 'package:railway_v1/utils/colors_file.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:railway_v1/utils/global_vars.dart';
import 'package:railway_v1/utils/navigator.dart';
import 'package:railway_v1/utils/custom_widgets/custom_snackBar.dart';

class StationsTest extends StatefulWidget {
  @override
  _StationsTestState createState() => _StationsTestState();
}

class _StationsTestState extends State<StationsTest> {
  StationsModel stationsModel;
  List<Success> stationsList = List();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 0), () {
      gettingData();
    });
//    showHud();
  }

  gettingData() {
    setState(() {
      Api(context).stationApi(_scaffoldKey).then((value) {
        stationsModel = value;
        stationsModel.success.forEach((element) {
          setState(() {
            stationsList.add(element);
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Container(),
          backgroundColor: primaryAppColor,
          bottom: PreferredSize(
            preferredSize: Size.square(20),
            child: Container(
              // height: 200,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 30, left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Main Stations",
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 25,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
      body: Center(
        child: Container(
          child:ListView.builder(
            itemCount: stationsList.length,
            itemBuilder: (context,index){
              return  ListTile(
                leading:  Icon(Icons.location_on,color: Colors.blue,),
                title: Text(
                  "${stationsList[index].name}",
                  style: TextStyle(color: blackColor, fontSize: 20,),
                ),
              );
            },
          )
        ),
      ),
    );
  }
}
