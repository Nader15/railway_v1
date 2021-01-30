import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:railway_v1/models/stations.dart';
import 'package:railway_v1/models/trips.dart';
import 'package:railway_v1/models/users.dart';
import 'package:railway_v1/utils/custom_widgets/custom_snackBar.dart';
import 'package:railway_v1/utils/navigator.dart';
import 'package:xs_progress_hud/xs_progress_hud.dart';
import 'package:railway_v1/utils/global_vars.dart';

class Api {
  String baseUrl = 'https://railway-project.herokuapp.com/api/';
  String stationUrl = 'stations';
  String tripsUrl = 'trips';
  String registerUrl = 'token/register';

  BuildContext context;

  Api(@required this.context);

  Future stationApi(GlobalKey<ScaffoldState> _scaffoldKey) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + stationUrl;

    final response = await http.get(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: UserTocken
      },
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      return StationsModel.fromJson(dataContent);
    } else if (response.statusCode == 401) {
      // clearAllData();
      navigateAndClearStack(
          context,
          Container(
            child: Text("Error"),
          ));
    } else {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      return false;
    }
  }

  Future tripsApi(GlobalKey<ScaffoldState> _scaffoldKey) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + tripsUrl;

    final response = await http.get(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: UserTocken
      },
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      return TripsModel.fromJson(dataContent);
    } else if (response.statusCode == 401) {
      // clearAllData();
      navigateAndClearStack(
          context,
          Center(
            child: Container(
              child: Text("Error"),
            ),
          ));
    } else {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      return false;
    }
  }

  Future userRegister(
      GlobalKey<ScaffoldState> _scaffoldKey,
      String name,
      String email,
      String password,
      String passwordConfirmation,
      String phone,
      ) async {
    XsProgressHud.show(context);
    final String apiUrl = baseUrl + registerUrl;
    var data = {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "device_name": "Anonymous Device",
      "admin": "0",
      "phone_number": phone,
    };
    var userToJson = json.encode(data);
    final response = await http.post(
      apiUrl,
      headers: {'Content-Type': 'application/json',
        'Accept': 'application/json'},
      body: userToJson,
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();

    print("dataContent1:: ${dataContent}");
    print("dataContent2:: ${response.body.toString().contains('errors')}");

    if (!(response.body).toString().contains('errors')){
      return UsersModel.fromJson(dataContent);
      print(json.decode(response.body));
    }
    else {
      CustomSnackBar(_scaffoldKey,context, dataContent["errors"]["email"].toString());
      return false;
    }
  }

}
