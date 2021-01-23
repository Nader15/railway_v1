import 'package:flutter/material.dart';
import 'package:railway_v1/utils/colors_file.dart';

class Tickets extends StatefulWidget {
  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  int purbleTicket = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryAppColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 60,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: blackColor, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "0",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(20),
                          width: 95,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "100 EG for seat",
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 60,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: blackColor, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "0",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(20),
                          width: 95,
                          height: 40,
                          decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "150 EG for seat",
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 60,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: blackColor, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "${purbleTicket.toString()}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(20),
                          width: 95,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "200 EG for seat",
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: GridView.builder(
                    itemCount: 32,
                    physics: ScrollPhysics(),
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1.9,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            purbleTicket++;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 30,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "A-1",
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
                RaisedButton(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Text(
                      "Pay",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
