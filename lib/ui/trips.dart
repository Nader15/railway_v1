import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:railway_v1/models/trip.dart';
import 'package:railway_v1/utils/colors_file.dart';


class Trips extends StatefulWidget {
  final Trip trip;

  const Trips({Key key, this.trip}) : super(key: key);

  @override
  _TripsState createState() => _TripsState();
}

class _TripsState extends State<Trips> {
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
              itemCount: trips.length,
              itemBuilder: (ctx, index) {
                return TripsBody(
                  trip: trips[index],
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
  final Trip trip;

  const TripsBody({Key key, this.trip}) : super(key: key);
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
                trip.location,
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
                          Text(trip.timeFrom,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
                          Text(trip.timeTo,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                trip.destination,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
