// import 'package:bakery/login/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'body.dart';
import 'login/login_page.dart';
import 'logind_signup.dart';
import 'otp.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

TextEditingController firstNameController = new TextEditingController();
TextEditingController lastNameController = new TextEditingController();
TextEditingController emailController = new TextEditingController();
TextEditingController phoneController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
bool circular = false;
firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

class Signup_Screen extends StatefulWidget {
  // firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  Signup_Screen(
      {Key key,
      this.fieldKey,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted})
      : super(key: key);

  ThemeData buildTheme() {
    final ThemeData base = ThemeData();
    return base.copyWith(
      hintColor: Colors.red,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.yellow, fontSize: 24.0),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => signup();
}

class signup extends State<Signup_Screen> {
  ShapeBorder shape;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _email;
  String _password;
  String _firstname;
  String _lastname;
  String _phone;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _autovalidate = false;
  bool _formWasEdited = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bool _obscureText = true;
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.brown,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          // _submit();
          final form = formKey.currentState;

          if (form.validate()) {
            form.save();

            // Email & password matched our validation rules
            // and are saved to _email and _password fields.
            // _performLogin();
            setState(() {
              circular = true;
            });
            try {
              firebase_auth.UserCredential userCredential =
                  await firebaseAuth.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text);
              print(userCredential.user.email);
              setState(() {
                circular = false;
              });
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
            }
          } else {
            showInSnackBar('Please fix the errors in red before submitting.');
          }
        },
        child: circular
            ? CircularProgressIndicator()
            : Text("Sign Up",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('SIGNUP'),
          backgroundColor: Colors.brown,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 7.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Image.asset("assets/playstore-icon.png"))
                  ],
                ),
              ),
              SafeArea(
                  top: false,
                  bottom: false,
                  child: Card(
                      elevation: 5.0,
                      child: Form(
                          key: formKey,
                          autovalidate: _autovalidate,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  const SizedBox(height: 24.0),
                                  TextFormField(
                                    controller: firstNameController,
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
                                          Icons.person,
                                          color: Colors.brown,
                                        ),
                                        hintText: 'Enter first name',
                                        labelText: 'First Name',
                                        labelStyle:
                                            TextStyle(color: Colors.brown)),
                                    keyboardType: TextInputType.text,
                                    validator: (val) => val.length < 1
                                        ? 'Enter first name'
                                        : null,
                                    onSaved: (val) => _firstname = val,
                                  ),
                                  const SizedBox(height: 14.0),
                                  TextFormField(
                                    controller: lastNameController,
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
                                          Icons.perm_identity,
                                          color: Colors.brown,
                                        ),
                                        hintText: 'Enter last name',
                                        labelText: 'Last Name',
                                        labelStyle:
                                            TextStyle(color: Colors.brown)),
                                    keyboardType: TextInputType.text,
                                    validator: (val) => val.length < 1
                                        ? 'Enter last name'
                                        : null,
                                    onSaved: (val) => _lastname = val,
                                  ),
                                  const SizedBox(height: 14.0),
                                  TextFormField(
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
                                        hintText: 'Your email address',
                                        labelText: 'E-mail',
                                        labelStyle:
                                            TextStyle(color: Colors.brown)),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: validateEmail,
                                    onSaved: (String val) {
                                      _email = val;
                                    },
                                  ),
                                  const SizedBox(height: 14.0),
                                  TextFormField(
                                    controller: phoneController,
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
                                          Icons.phone_android,
                                          color: Colors.brown,
                                        ),
                                        hintText: 'Your phone number',
                                        labelText: 'Phone (Optional)',
                                        labelStyle:
                                            TextStyle(color: Colors.brown)),
                                    keyboardType: TextInputType.phone,
                                    validator: validateMobile,
                                    onSaved: (String val) {
                                      _phone = val;
                                    },
                                  ),
                                  const SizedBox(height: 14.0),
                                  TextFormField(
                                    controller: passwordController,
                                    obscureText: true,
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
                                          Icons.lock,
                                          color: Colors.brown,
                                        ),
                                        hintText: 'Your password',
                                        labelText: 'Password',
                                        labelStyle:
                                            TextStyle(color: Colors.brown)),
                                    validator: (val) => val.length < 6
                                        ? 'Password too short.'
                                        : null,
                                    onSaved: (val) => _password = val,
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  loginButon,
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          "Already Account ?",
                                          style:
                                              TextStyle(color: Colors.orange),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          alignment: Alignment.bottomRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginPage()
                                                      // Login_Screen()
                                                      ));
                                            },
                                            child: Text(
                                              'SIGNIN',
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

                                  /*   const SizedBox(height:24.0),

                             Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[

                                 GestureDetector(
                                  onTap: (){

                                  },
                                  child: Text('FORGOT PASSWORD?',style: TextStyle(
                                    color: Colors.blueAccent,fontSize: 13.0
                                  ),),
                                ),

                                 GestureDetector(
                                  onTap: (){

                                  },
                                  child: Text('LOGIN',style: TextStyle(
                                      color: Colors.orange,fontSize: 15.0
                                  ),),
                                ),

                              ],
                            )


*/
                                ]),
                          )) //login,
                      ))
            ],
          ),
        )));
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  // void _submit() {
  //   final form = formKey.currentState;

  //   if (form.validate()) {
  //     form.save();

  //     // Email & password matched our validation rules
  //     // and are saved to _email and _password fields.
  //     _performLogin();
  //   } else {
  //     showInSnackBar('Please fix the errors in red before submitting.');
  //   }
  // }

  void showInSnackBar(String value) {
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  void _performLogin() {
    // try {
    //       firebase_auth.UserCredential userCredential =
    //           await firebaseAuth.createUserWithEmailAndPassword(
    //               email: _emailController.text, password: _pwdController.text);
    //       print(userCredential.user.email);
    //       setState(() {
    //         circular = false;
    //       });
    //       Navigator.pushAndRemoveUntil(
    //           context,
    //           MaterialPageRoute(builder: (builder) => HomePage()),
    //           (route) => false);
    //     } catch (e) {
    //       final snackbar = SnackBar(content: Text(e.toString()));
    //       ScaffoldMessenger.of(context).showSnackBar(snackbar);
    //       setState(() {
    //         circular = false;
    //       });
    //     }
    // This is just a demo, so no actual login here.
    /* final snackbar = SnackBar(
      content: Text('Email: $_email, password: $_password'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);*/

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => OtpVerificationScreenState('9352530180')));
  }

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
      );
}
