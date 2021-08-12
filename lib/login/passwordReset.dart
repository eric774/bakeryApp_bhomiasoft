import 'package:bakery/login/ProgressHUD.dart';
import 'package:bakery/login/login_page.dart';
import 'package:bakery/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

TextEditingController emailController = new TextEditingController();
bool circular = false;
firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
bool resetpass = false;

class PasswordReset extends StatefulWidget {
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        backgroundColor: Colors.brown,
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Image.asset("assets/playstore-icon.png"))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: SafeArea(
                  top: false,
                  bottom: false,
                  child: Card(
                    elevation: 2,
                    child: Form(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 25),
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
                                  hintText: 'Your email address',
                                  labelText: 'E-mail',
                                  labelStyle: TextStyle(color: Colors.brown)),
                              // keyboardType: TextInputType.emailAddress,
                              validator: (val) => !val.contains('@')
                                  ? 'Not a valid email.'
                                  : null,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 20),
                            TextButton(
                                onPressed: () {
                                  firebaseAuth.sendPasswordResetEmail(
                                      email: emailController.text);
                                  resetpass = true;
                                  final snackbar = SnackBar(
                                      content: Text(
                                          'email sent for password reset request'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                  Future.delayed(
                                      const Duration(milliseconds: 500));
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => LoginPage()),
                                      (route) => false);
                                  // Navigator.of(context).pop();
                                },
                                child: Text('Change Password'))
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
}
