import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:railway_v1/ApiFunctions/Api.dart';
import 'package:railway_v1/ApiFunctions/shared.dart';
import 'package:railway_v1/models/users.dart';
import 'package:railway_v1/ui/home_page.dart';
import 'package:railway_v1/ui/signUp.dart';
import 'package:railway_v1/utils/colors_file.dart';
import 'package:railway_v1/utils/custom_widgets/backgrount.dart';
import 'package:railway_v1/utils/custom_widgets/custom_button.dart';
import 'package:railway_v1/utils/custom_widgets/custom_snackBar.dart';
import 'package:railway_v1/utils/global_vars.dart';
import 'package:railway_v1/utils/navigator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  UsersModel usersModel;

  bool _isHidden = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  bool _autoValidate = false;
  final GlobalKey<ScaffoldState> scafoldState = new GlobalKey<ScaffoldState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldState,
      body: Stack(
        children: [
          Background(),
          SafeArea(
              child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.only(left: 23, right: 23),
                child: Builder(
                  builder: (context) => Column(
                    children: [
                      SizedBox(height: 49),
                      Center(
                        child: SvgPicture.asset(
                          "images/train.svg",
                          color: primaryAppColor,
                          height: 150,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Login",
                          style: TextStyle(color: whiteColor, fontSize: 32)),
                      SizedBox(height: 43),
                      TextFormField(
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                        style: TextStyle(color: whiteColor),
                        cursorColor: primaryAppColor,
                        decoration: InputDecoration(
                            fillColor: greyPrimaryColor.withOpacity(.1),
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: greyPrimaryColor)),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validatePassword,
                        obscureText: _isHidden,
                        style: TextStyle(color: whiteColor),
                        cursorColor: primaryAppColor,
                        decoration: InputDecoration(
                            fillColor: greyPrimaryColor.withOpacity(.1),
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: _toggleVisibility,
                              icon: _isHidden
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: greyPrimaryColor,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: whiteColor,
                                    ),
                            ),
                            hintStyle: TextStyle(color: greyPrimaryColor)),
                      ),
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              custom_checkBox(),
                              SizedBox(width: 10),
                              Text('Remember Me',
                                  style: TextStyle(color: whiteColor)),
                            ],
                          )),
                      SizedBox(height: 50),
                      CustomButton(
                          bttnName: 'Login',
                          bttnHeight: 55,
                          bttnWidth: 368,
                          bttnNameSize: 20,
                          onPress: () {
                            _validateInputs();
                            if (formKey.currentState.validate()) {
                              Api(context)
                                  .userLogin(scafoldState, emailController.text,
                                      passwordController.text)
                                  .then((value) {
                                if (value is UsersModel) {
                                  usersModel = value;
                                  Future.delayed(Duration(seconds: 1), () {
                                    print(
                                        "_isSelected_isSelected ${_isSelected}");
                                    if (_isSelected) {
                                      setUserTocken(
                                        auth_token: usersModel
                                            .token.plainTextToken
                                            .split("|")[1],
                                        userId: usersModel.user.id,
                                        userName: usersModel.user.name,
                                        userEmail: usersModel.user.email,
                                        userPhone: usersModel.user.phoneNumber,
                                        userJoinedTime: usersModel.token.accessToken.createdAt,
                                      )
                                          .then((value) {
                                        UserTocken =
                                        "Bearer ${usersModel.token.plainTextToken.split("|")[1]}";
                                        userName = usersModel.user.name;
                                        userEmail = usersModel.user.email;
                                        userPhone = usersModel.user.phoneNumber;
                                        userJoinedTime = usersModel.token.accessToken.createdAt;
                                        userId = usersModel.user.id;
                                        navigateAndKeepStack(
                                            context, HomePage());
                                        // navigateAndKeepStack(context,Competitions());
                                      });
                                    }
//talent_id: 46
                                    else {
                                      UserTocken =
                                      "Bearer ${usersModel.token.plainTextToken.split("|")[1]}";
                                      // userName = usersModel.user.name;
                                      // userEmail = usersModel.user.email;
                                      // userPhone = usersModel.user.phoneNumber;
                                      // userJoinedTime = usersModel.token.accessToken.createdAt;
                                      // userId = usersModel.user.id;
                                      navigateAndKeepStack(context, HomePage());
                                      // navigateAndKeepStack(context,Competitions());
                                    }
                                  });
                                } else {}
                              });
                            }
                          }
                          // {
                          //   _validateInputs();
                          //   if (formKey.currentState.validate()) {
                          //     navigateAndKeepStack(context, HomePage());
                          //   } else
                          //     CustomSnackBar(scafoldState, context,
                          //         "please enter correct data");
                          // },
                          ),
                      SizedBox(height: 20),
                      Text(
                        "Forget Password? ",
                        style: TextStyle(color: greyPrimaryColor),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "If You Don't Have Account ",
                            style: TextStyle(color: greyPrimaryColor),
                          ),
                          InkWell(
                            onTap: () {
                              navigateAndClearStack(context, SignUp());
                            },
                            child: RichText(
                              text: TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: whiteColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  bool _isSelected = false;

  GestureDetector custom_checkBox() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: _isSelected ? primaryAppColor : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            border: _isSelected
                ? null
                : Border.all(color: greyPrimaryColor, width: 1.0)),
        width: 20,
        height: 20,
        child:
            _isSelected ? Icon(Icons.check, size: 15, color: blackColor) : null,
      ),
    );
  }

  void _validateInputs() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.length == 0)
      return 'You must enter your Email';
    else if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.length == 0)
      return 'You must enter your Password';
    else if (value.length < 5)
      return 'Enter your Correct Password';
    else
      return null;
  }
}
