import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:railway_v1/ApiFunctions/Api.dart';
import 'package:railway_v1/models/trips.dart';
import 'package:railway_v1/utils/bottomSheet.dart';
import 'package:railway_v1/utils/colors_file.dart';
import 'package:railway_v1/utils/custom_widgets/custom_button.dart';
import 'package:railway_v1/utils/bookticket_bottomSheet.dart';
import 'package:railway_v1/utils/size_config.dart';

class Trips extends StatefulWidget {
  final TripsModel trip;

  const Trips({Key key, this.trip}) : super(key: key);

  @override
  _TripsState createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  TripsModel tripsModel;
  List<Success> tripsList = List();

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
      Api(context).tripsApi(_scaffoldKey).then((value) {
        tripsModel = value;
        tripsModel.success.forEach((element) {
          setState(() {
            tripsList.add(element);
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(),
          backgroundColor: primaryAppColor,
          bottom: PreferredSize(
            preferredSize: Size.square(20),
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              // height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 30, left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Daily Railway Trips",
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 25,
                          ),
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 30, left: 20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(
                        "images/destination2.svg",
                        color: Colors.black,
                        width: 12,
                        height: 35,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
            ),
          )),
      key: _scaffoldKey,
      backgroundColor: primaryAppColor,
      body: SafeArea(
        child: tripsList.length == 0
            ? Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2),
                alignment: Alignment.topCenter,
                child: Text(
                  "Loading Trips ...",
                  style: TextStyle(fontSize: 20),
                ))
            : Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: 150,
                  child: ListView.builder(
                    itemCount: tripsList.length,
                    itemBuilder: (ctx, index) {
                      return TripsBody(
                        tripsList[index],
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }

  Widget TripsBody(Success success) {
    return InkWell(
      onTap: () {
        showRoundedModalBottomSheet(
            autoResize: true,
            dismissOnTap: false,
            context: context,
            radius: 30.0,
            // This is the default
            color: Colors.white,
            // Also default
            builder: (context) => bookTicketBottomSheet(
                  success: success,
                ));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 150,
        child: Card(
          elevation: 10,
          color: primaryAppColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  success.baseStation.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Start Time"),
                            SizedBox(height: 5,),
                            Text(
                              success.departTime,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          "images/train.svg",
                          color: blackColor,
                          height: 30,
                        ),
                        Column(
                          children: [
                            Text("Arrival Time"),
                            SizedBox(height: 5,),
                            Text(
                              success.arrivalTime,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  success.destinationStation.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
