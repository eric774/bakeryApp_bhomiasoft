import 'package:bakery/body.dart';
import 'package:bakery/countdown_base.dart';
import 'package:flutter/material.dart';
// import 'package:nexmo_verify/nexmo_sms_verify.dart';

import 'custom_textfield.dart';
import 'progress_hud.dart';
import 'rest_api.dart';
import 'signup_screen.dart';

// ignore: must_be_immutable
class OtpVerificationScreenState extends StatefulWidget {
  String mobileNumber;

  OtpVerificationScreenState(this.mobileNumber);
  @override
  _OtpVerificationScreenState createState() =>
      _OtpVerificationScreenState(mobileNumber);
}

class _OtpVerificationScreenState extends State<OtpVerificationScreenState> {
  bool _isLoading = false;
  bool _isResendEnable = false;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String otpWaitTimeLabel = "";
  bool _isMobileNumberEnter = false;
  String mobileNumber;

  final _teOtpDigitOne = TextEditingController();
  final _teOtpDigitTwo = TextEditingController();
  final _teOtpDigitThree = TextEditingController();
  final _teOtpDigitFour = TextEditingController();

  FocusNode _focusNodeDigitOne = FocusNode();
  FocusNode _focusNodeDigitTwo = FocusNode();
  FocusNode _focusNodeDigitThree = FocusNode();
  FocusNode _focusNodeDigitFour = FocusNode();

  // NexmoSmsVerificationUtil _nexmoSmsVerificationUtil;

  _OtpVerificationScreenState(this.mobileNumber);

  @override
  void initState() {
    super.initState();
    changeFocusListener(_teOtpDigitOne, _focusNodeDigitTwo);
    changeFocusListener(_teOtpDigitTwo, _focusNodeDigitThree);
    changeFocusListener(_teOtpDigitThree, _focusNodeDigitFour);

    startTimer();

    // _nexmoSmsVerificationUtil = NexmoSmsVerificationUtil();
    // _nexmoSmsVerificationUtil.initNexmo("api_key", "secret_key");
  }

  bool isVerified = false;

  void _submit() {
    // if (_isMobileNumberEnter) {
    //   showLoader();
    //   _nexmoSmsVerificationUtil
    //       .verifyOtp(_teOtpDigitOne.text +
    //           _teOtpDigitTwo.text +
    //           _teOtpDigitThree.text +
    //           _teOtpDigitFour.text)
    //       .then((dynamic res) {
    //     closeLoader();

    //     // isVerified = true;
    //   });
    // }
    _performLogin();
  }

  @override
  Widget build(BuildContext context) {
    var otpBox = Padding(
        padding: EdgeInsets.only(left: 80.0, right: 80.0),
        child: Row(
          children: <Widget>[
            inputBox(_teOtpDigitOne, _focusNodeDigitOne),
            SizedBox(
              width: 10.0,
            ),
            inputBox(_teOtpDigitTwo, _focusNodeDigitTwo),
            SizedBox(
              width: 10.0,
            ),
            inputBox(_teOtpDigitThree, _focusNodeDigitThree),
            SizedBox(
              width: 10.0,
            ),
            inputBox(_teOtpDigitFour, _focusNodeDigitFour),
          ],
        ));

    var form = Column(
      children: <Widget>[
        Container(
          alignment: FractionalOffset.center,
          margin: EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 0.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)),
          ),
          child: Column(
            children: <Widget>[
              Container(
                alignment: FractionalOffset.center,
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 50.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  border: Border.all(color: Colors.brown),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6.0),
                      topRight: Radius.circular(6.0)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 0.0,
                        height: 30.0,
                      ),
                      Text(
                        "OTP VERIFICATION",
                      ),
                      SizedBox(
                        width: 0.0,
                        height: 20.0,
                      ),
                      Text(
                        "OTP",
                      ),
                      otpBox,
                      SizedBox(
                        width: 0.0,
                        height: 20.0,
                      ),
                      Text(
                        otpWaitTimeLabel,
                      ),
                      SizedBox(
                        width: 0.0,
                        height: 10.0,
                      ),
                      RaisedButton(
                        color: Colors.brown,
                        onPressed: _submit,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: RaisedButton(
            color: Colors.brown,
            onPressed: _resendOtp,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: Text("RESEND OTP",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFFFFFF),
                )),
          ),
        )
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: ProgressHUD(
        child: Container(
          padding: const EdgeInsets.only(top: 30.0),
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Expanded(
                      child: Image.asset(
                    "assets/playstore-icon.png",
                    height: 100,
                  )),
                ),
                // SizedBox(
                //   height: 100,
                // ),
                isVerified
                    ? Container(
                        // height: 200.0,
                        alignment: FractionalOffset.center,
                        margin: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0)),
                        ),
                        child: Text(
                          "Verified: " + mobileNumber,
                          style: TextStyle(fontSize: 16.0, color: Colors.blue),
                        ))
                    : form
              ],
            ),
          ),
        ),
        inAsyncCall: _isLoading,
      ),
    );
  }

  @override
  void onLoginError(String errorTxt) {
    setState(() => _isLoading = false);
  }

  void changeFocusListener(
      TextEditingController teOtpDigitOne, FocusNode focusNodeDigitTwo) {
    teOtpDigitOne.addListener(() {
      if (teOtpDigitOne.text.length > 0 && focusNodeDigitTwo != null) {
        FocusScope.of(context).requestFocus(focusNodeDigitTwo);
      }
      setState(() {});
    });
  }

  @override
  void closeLoader() {
    setState(() => _isLoading = false);
  }

  @override
  void showLoader() {
    setState(() => _isLoading = true);
  }

  void _resendOtp() {
    if (_isResendEnable) {
      // _nexmoSmsVerificationUtil.resentOtp();
    }
  }

  void startTimer() {
    setState(() {
      _isResendEnable = false;
    });

    var sub = CountDown(new Duration(minutes: 1)).stream.listen(null);

    sub.onData((Duration d) {
      setState(() {
        int sec = d.inSeconds % 60;
        otpWaitTimeLabel = d.inMinutes.toString() + ":" + sec.toString();
      });
    });

    sub.onDone(() {
      setState(() {
        _isResendEnable = true;
      });
    });
  }

  @override
  void optSent() {
    startTimer();
  }

  Widget inputBox(
      TextEditingController teOtpDigitOne, FocusNode focusNodeDigitOne) {
    return CustomTextField(
            inputBoxController: teOtpDigitOne,
            focusNod: focusNodeDigitOne,
            keyBoardType: TextInputType.number,
            textColor: 0xFFA6A6A6,
            textSize: 14.0,
            textFont: "Nexa_Bold",
            maxLength: 1,
            textAlign: TextAlign.center)
        .textField("", "");
  }

  void _performLogin() {
    // This is just a demo, so no actual login here.
    /* final snackbar = SnackBar(
      content: Text('Email: $_email, password: $_password'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);*/
    //----adding details to api----- when otp sent---
    final body = {
      "otp": "123456",
      "username": "random1",
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      "email": emailController.text,
      "pno": phoneController.text,
      "password": passwordController.text,
    };

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BodyOTP()));
  }
}
