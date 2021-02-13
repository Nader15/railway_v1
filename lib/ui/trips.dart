import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:railway_v1/ApiFunctions/Api.dart';
import 'package:railway_v1/models/trip.dart';
import 'package:railway_v1/models/trips.dart';
import 'package:railway_v1/utils/colors_file.dart';

class Trips extends StatefulWidget {
  final Trip trip;

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
      backgroundColor: primaryAppColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            width: 150,
            child: ListView.builder(
              itemCount: tripsList.length,
              itemBuilder: (ctx, index) {
                return TripsBody(
                  success: tripsList[index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class TripsBody extends StatelessWidget {
  final Success success;

   TripsBody({Key key, this.success}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color(0xff1D1D1D),
                title: Text(
                  "Delete Trip ?",
                  style:
                      TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Api(context).deleteTripApi(_scaffoldKey, success.id);
                      },
                      child: Text(
                        "delete",
                      )),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "cancel",
                      ))
                ],
                content: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Center(
                    child: Text(
                      " Delete This Trip ?",
                      style: TextStyle(
                          fontFamily: 'custom_font', color: Colors.white),
                    ),
                  ),
                ),
              );
            });
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
                            Text(
                              success.departTime,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
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
                            Text(
                              success.arrivalTime,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
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
