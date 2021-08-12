import 'package:bakery/authentication_service.dart';
import 'package:bakery/body.dart';
import 'package:bakery/login/PhoneAuth.dart';
import 'package:bakery/login/ProgressHUD.dart';
import 'package:bakery/login/api/model/login_model.dart';
import 'package:bakery/login/passwordReset.dart';
import 'package:bakery/otp.dart';
import 'package:bakery/services/Auth_Service.dart';
import 'package:bakery/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';

TextEditingController emailController = new TextEditingController();
TextEditingController phoneController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
bool circular = false;
firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
AuthClass authClass = AuthClass();
bool isLoggedInSuccessfully = true;
// bool isLoggedInSuccessfully;
var emailAddress;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  bool hidePassword = true;
  bool isApiCallProcess = false; //
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  // LoginRequestModel loginRequestModel; //
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    // loginRequestModel = new LoginRequestModel(); //
    isLoggedInSuccessfully = false;
    // if (resetpass) {

    // }
  }

  // void _performLogin() {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => OtpVerificationScreenState('9352530180')));
  // }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.brown,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          try {
            firebase_auth.UserCredential userCredential =
                await firebaseAuth.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text);
            authClass.storeTokenAndData(userCredential);
            print(userCredential.user.email);
            emailAddress = userCredential.user.email;
            setState(() {
              circular = false;
            });
            isLoggedInSuccessfully = true;
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (builder) => BodyOTP()),
                (route) => false);
          } catch (e) {
            final snackbar = SnackBar(content: Text(e.toString()));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
            setState(() {
              circular = false;
            });
            isLoggedInSuccessfully = false;
          }
          // if (validateAndSave()) {
          //   context.read<AuthenticationService>().signIn(
          //         email: emailController.text.trim(),
          //         password: passwordController.text.trim(),
          //       );
          //   print("password after click = " + passwordController.text);
          //   print(isLoggedInSuccessfully);
          //   if (isLoggedInSuccessfully) {
          //     final snackBar = SnackBar(content: Text("Login Successful"));
          //     scaffoldKey.currentState.showSnackBar(snackBar);
          //     _performLogin();
          //   } else {
          //     final snackBar = SnackBar(content: Text("Check details again"));
          //     scaffoldKey.currentState.showSnackBar(snackBar);
          //   }
          // }
        },
        child: circular
            ? CircularProgressIndicator()
            : Text("LOGIN",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.brown,
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BodyOTP()
                    // Login_Screen()
                    ));
          },
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BodyOTP()
                        // Login_Screen()
                        ));
              },
              child: Text('Skip > >'))
        ],
      ),
      // backgroundColor: Theme.of(context).accentColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                // color: Colors.orange,
                height: MediaQuery.of(context).size.height / 3,
                //alignment: Alignment.topLeft,
                // margin: EdgeInsets.only(top: 7.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Image.asset("assets/playstore-icon.png"))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      await authClass.googleSignIn(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      height: 60,
                      child: Card(
                        color: Colors.white54,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/google.svg",
                              height: 25,
                              width: 15,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Google',
                              style: TextStyle(
                                color: Colors.brown,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => PhoneAuthPage()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      height: 60,
                      child: Card(
                        color: Colors.white60,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/phone.svg",
                              height: 25,
                              width: 15,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Phone',
                              style: TextStyle(
                                color: Colors.brown,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 15.0, left: 15, right: 15),
                  child: Row(children: <Widget>[
                    Expanded(
                        child: Divider(
                      color: Colors.brown,
                    )),
                    Text("  OR  "),
                    Expanded(
                        child: Divider(
                      color: Colors.brown,
                    )),
                  ])
                  // Divider(
                  //   color: Colors.brown,
                  // ),
                  ),
              Container(
                child: SafeArea(
                  top: false,
                  bottom: false,
                  child: Card(
                    elevation: 2,
                    child: Form(
                      key: globalFormKey,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 25),
                            SizedBox(height: 20),
                            TextFormField(
                              // controller: phoneController,
                              controller: emailController,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.brown,
                                        style: BorderStyle.solid),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.brown,
                                        style: BorderStyle.solid),
                                  ),
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.brown,
                                  ),
                                  // icon: Icon(
                                  //   Icons.phone,
                                  //   color: Colors.brown,
                                  // ),
                                  hintText: 'Your email address',
                                  labelText: 'E-mail',
                                  // hintText: 'Your contact number',
                                  // labelText: 'Phone No.',
                                  labelStyle: TextStyle(color: Colors.brown)),
                              // keyboardType: TextInputType.emailAddress,
                              validator: (val) => !val.contains('@')
                                  ? 'Not a valid email.'
                                  : null,
                              keyboardType: TextInputType.emailAddress,
                              // validator: validateMobile,
                              // onSaved: (input) =>
                              //     loginRequestModel.email = input,
                            ),
                            SizedBox(height: 20),
                            new TextFormField(
                              controller: passwordController,
                              // style: TextStyle(
                              //     color: Theme.of(context).accentColor),
                              keyboardType: TextInputType.text,
                              // onSaved: (input) =>
                              //     loginRequestModel.password = input,
                              validator: (val) =>
                                  val.length < 6 ? 'Password too short.' : null,
                              obscureText: hidePassword,
                              decoration: new InputDecoration(
                                  // hintText: "Password",
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.brown,
                                        style: BorderStyle.solid),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.brown,
                                        style: BorderStyle.solid),
                                  ),
                                  icon: Icon(
                                    Icons.lock,
                                    color: Colors.brown,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        hidePassword = !hidePassword;
                                      });
                                    },
                                    color: Colors.brown.withOpacity(0.4),
                                    icon: Icon(hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                  hintText: 'Your password',
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.brown)),
                            ),
                            SizedBox(height: 30),
                            loginButon,
                            SizedBox(height: 15),
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    // alignment: Alignment.bottomLeft,
                                    // margin: EdgeInsets.only(left: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        // firebaseAuth.sendPasswordResetEmail(
                                        //     email: emailAddress);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PasswordReset()));
                                      },
                                      child: Text(
                                        'FORGOT PASSWORD?',
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 13.0),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Signup_Screen()));
                                      },
                                      child: Text(
                                        'SIGNUP',
                                        style: TextStyle(
                                            color: Colors.brown,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

String _validateName(String value) {
  // _formWasEdited = true;
  if (value.isEmpty) return 'Name is required.';
  final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
  if (!nameExp.hasMatch(value))
    return 'Please enter only alphabetical characters.';
  return null;
}

// String validateMobile(String value) {
// // Indian Mobile number are of 10 digit only
//   if (value.length != 10)
//     return 'Mobile Number must be of 10 digit';
//   else
//     return null;
// }
