import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:railway_v1/ApiFunctions/Api.dart';
import 'package:railway_v1/models/trip.dart';
import 'package:railway_v1/models/trips.dart';
import 'package:railway_v1/utils/colors_file.dart';


class TripsTest extends StatefulWidget {
  final Trip trip;

  const TripsTest({Key key, this.trip}) : super(key: key);

  @override
  _TripsTestState createState() => _TripsTestState();
}

class _TripsTestState extends State<TripsTest> {

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

  const TripsBody({Key key, this.success}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 150,
      child: Card(
        elevation: 10,
        color: primaryAppColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                          Text(success.arrivalTime,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
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
                          Text(success.departTime,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
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
    );
  }
}
