import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:railway_v1/ui/login.dart';
import 'package:railway_v1/utils/colors_file.dart';
import 'package:railway_v1/utils/custom_widgets/backgrount.dart';
import 'package:railway_v1/utils/custom_widgets/custom_button.dart';
import 'package:railway_v1/utils/custom_widgets/custom_snackBar.dart';
import 'package:railway_v1/utils/navigator.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool checkValue = false;
  bool _isHidden = false;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  bool _autoValidate = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scafoldState = new GlobalKey<ScaffoldState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var phoneCodeController = TextEditingController();

  String valueChoosedPhoneCode;
  List phoneCodeItems = [
    "+20",
    "+213",
    "+216",
    "+962",
    "+961",
    "+963",
    "+964",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  builder: (context)=>Column(
                    children: [
                      SizedBox(height: 30),
                      Center(
                        child: SvgPicture.asset(
                          "images/train.svg",
                          color: primaryAppColor,
                          height: 150,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("SIGN UP",
                          style: TextStyle(color: whiteColor, fontSize: 32)),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: nameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.name,
                        validator: validateName,
                        style: TextStyle(color: whiteColor),
                        cursorColor: primaryAppColor,
                        decoration: InputDecoration(
                            fillColor: greyPrimaryColor.withOpacity(.1),
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                            hintText: 'Name',
                            hintStyle: TextStyle(color: greyPrimaryColor)),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 10,right: 10),
                            width: 80,
                            height: 58,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.1),
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButton(
                              hint: Text(
                                "+20",
                                style: TextStyle(
                                  color: Color(0xffb8c3cb).withOpacity(0.5),
                                ),
                              ),
                              icon: Icon(Icons.keyboard_arrow_down, color: Color(0xffb8c3cb)),
                              isExpanded: true,
                              underline: SizedBox(),
                              dropdownColor: Color(0xff173049),
                              style: TextStyle(color: whiteColor),
                              value: valueChoosedPhoneCode,
                              onChanged: (newValue) {
                                setState(() {
                                  valueChoosedPhoneCode = newValue;
                                });
                              },
                              items: phoneCodeItems.map((valueItem) {

                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            height: 80,
                            width: MediaQuery.of(context).size.width /
                                1.61,
                            child: TextFormField(
                              controller: phoneController,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.number,
                              validator: validatePhone,
                              style: TextStyle(color: whiteColor),
                              cursorColor: primaryAppColor,
                              decoration: InputDecoration(
                                  fillColor:
                                  Colors.grey.withOpacity(.1),
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                      BorderRadius.circular(5)),
                                  hintText: 'Phone Number',
                                  hintStyle: TextStyle(
                                      color: Color(0xffb8c3cb)
                                          .withOpacity(0.5))),
                            ),
                          ),
                        ],
                      ),
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
                      SizedBox(height: 10),
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
                              Text('I Accept Terms And Conditions',
                                  style: TextStyle(color: whiteColor)),
                            ],
                          )),
                      SizedBox(height: 30),
                      CustomButton(
                          bttnName: 'Register',
                          bttnHeight: 55,
                          bttnWidth: 368,
                          bttnNameSize: 20,
                          onPress: () {
                            _validateInputs();
                            if (formKey.currentState.validate()) {
                              navigateAndKeepStack(context, Login());
                            }
                            else CustomSnackBar(context,"Invalid Data !");
                          }),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "If You Have Account ",
                            style: TextStyle(color: greyPrimaryColor),
                          ),
                          InkWell(
                            onTap: () {
                              navigateAndClearStack(context, Login());
                            },
                            child: RichText(
                              text: TextSpan(
                                text: "Sign in",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: whiteColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                )
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
  String validatePhoneCode(String value) {
    if (value.length == 0)
      return 'Pick code';
    else
      return null;
  }
  String validatePhone(String value) {
    if (value.length == 0)
      return 'Enter Phone Number';
    else if (value.length < 11)
      return 'Enter a valid Phone Number';
    else
      return null;
  }
  String validateName(String value) {
    if (value.length == 0)
      return 'Enter your Name';
    else if (value.length < 3)
      return 'Enter a Correct Name';
    else
      return null;
  }
}
