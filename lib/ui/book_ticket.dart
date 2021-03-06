import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:railway_v1/ApiFunctions/Api.dart';
import 'package:railway_v1/models/trips.dart';
import 'package:railway_v1/utils/colors_file.dart';
import 'package:railway_v1/utils/custom_widgets/custom_button.dart';
import 'package:railway_v1/utils/navigator.dart';

class BookTicket extends StatefulWidget {
  final Success success;

  BookTicket({this.success});

  @override
  _BookTicketState createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {
  final GlobalKey<ScaffoldState> scafoldState = new GlobalKey<ScaffoldState>();

  counter() {
    int count = 0;
    for (int i = 0; i < widget.success.seats.length; i++) {
      if (widget.success.seats[i].status == "available") {
        count++;
      } else
        count = count;
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldState,
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
                          "Book A Ticket",
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
                        "images/ticket.svg",
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
      body: Container(
        height: MediaQuery.of(context).size.height / 1.1,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "- Station :",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.success.baseStation.name,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "To",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        widget.success.destinationStation.name,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "- Time :",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.success.departTime,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "To",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        widget.success.arrivalTime,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "- Trip Seats :",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${widget.success.seats.length}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "- Available Seats :",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${counter()}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "- Choose Seat :",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 50,
                    child: GridView.builder(
                      itemCount: widget.success.seats.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 1.5,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap:
                              widget.success.seats[index].status == "available"
                                  ? () {
                                      Api(context).bookTicketApi(scafoldState,
                                          widget.success.seats[index].id);
                                    }
                                  : () {},
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: widget.success.seats[index].status ==
                                      "available"
                                  ? greenColor
                                  : redColor,
                            ),
                            child: Text(
                              "${widget.success.seats[index].status}",
                              style: TextStyle(color: whiteColor),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                  bttnName: "Book",
                  bttnHeight: 55,
                  bttnWidth: 368,
                  bttnNameSize: 18,
                  onPress: () {}),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
