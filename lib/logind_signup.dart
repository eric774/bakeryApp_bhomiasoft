// import 'package:bakery/body.dart';
// import 'package:flutter/material.dart';

// import 'otp.dart';
// import 'signup_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'rest_api.dart';

// TextEditingController phoneController = new TextEditingController();
// TextEditingController passwordController = new TextEditingController();

// SharedPreferences localStorage;

// class Login_Screen extends StatefulWidget {
//   final Key fieldKey;
//   final String hintText;
//   final String labelText;
//   final String helperText;
//   final FormFieldSetter<String> onSaved;
//   final FormFieldValidator<String> validator;
//   final ValueChanged<String> onFieldSubmitted;

//   const Login_Screen(
//       {Key key,
//       this.fieldKey,
//       this.hintText,
//       this.labelText,
//       this.helperText,
//       this.onSaved,
//       this.validator,
//       this.onFieldSubmitted})
//       : super(key: key);

//   ThemeData buildTheme() {
//     final ThemeData base = ThemeData();
//     return base.copyWith(
//       hintColor: Colors.red,
//       inputDecorationTheme: InputDecorationTheme(
//         labelStyle: TextStyle(color: Colors.yellow, fontSize: 24.0),
//       ),
//     );
//   }

//   @override
//   State<StatefulWidget> createState() => login();
// }

// class login extends State<Login_Screen> {
//   ShapeBorder shape;
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   final formKey = GlobalKey<FormState>();
//   TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
//   String _email;
//   String _password;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   bool _autovalidate = false;
//   bool _formWasEdited = false;

//   String _validateName(String value) {
//     _formWasEdited = true;
//     if (value.isEmpty) return 'Name is required.';
//     final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
//     if (!nameExp.hasMatch(value))
//       return 'Please enter only alphabetical characters.';
//     return null;
//   }

//   String validateMobile(String value) {
// // Indian Mobile number are of 10 digit only
//     if (value.length != 10)
//       return 'Mobile Number must be of 10 digit';
//     else
//       return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // localStorage = getSharedPreferences("pref_file_name",MODE_PRIVATE);
//     // TODO: implement build
//     bool _obscureText = true;
//     final loginButon = Material(
//       elevation: 5.0,
//       borderRadius: BorderRadius.circular(30.0),
//       color: Colors.brown,
//       child: MaterialButton(
//         minWidth: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//         onPressed: () async {
//           localStorage = await SharedPreferences.getInstance();
//           // localStorage.setString('email', 'useremail@gmail.com');
//           save();
//           _submit();
//         },
//         child: Text("LOGIN",
//             textAlign: TextAlign.center,
//             style: style.copyWith(
//                 color: Colors.white, fontWeight: FontWeight.bold)),
//       ),
//     );
//     return Scaffold(
//         key: scaffoldKey,
//         appBar: AppBar(
//           title: Text('Login'),
//           backgroundColor: Colors.brown,
//         ),
//         body: SafeArea(
//             child: Container(
//           // color: Colors.red,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Container(
//                   // color: Colors.orange,
//                   height: MediaQuery.of(context).size.height / 3,
//                   //alignment: Alignment.topLeft,
//                   // margin: EdgeInsets.only(top: 7.0),
//                   child: Row(
//                     children: <Widget>[
//                       Expanded(child: Image.asset("assets/playstore-icon.png"))
//                       //   _verticalD(),
//                       //   GestureDetector(
//                       //     onTap: () {
//                       //       /* Navigator.push(
//                       //           context,
//                       //           MaterialPageRoute(
//                       //               builder: (context) => login_screen()));*/
//                       //     },
//                       //     child: Text(
//                       //       'Login',
//                       //       style: TextStyle(
//                       //           fontSize: 20.0,
//                       //           color: Colors.white,
//                       //           fontWeight: FontWeight.bold),
//                       //     ),
//                       //   ),
//                       //   _verticalD(),
//                       //   GestureDetector(
//                       //     onTap: () {
//                       // Navigator.pushReplacement(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (context) => Signup_Screen()));
//                       //     },
//                       //     child: Text(
//                       //       'Signup',
//                       //       style: TextStyle(
//                       //           fontSize: 20.0,
//                       //           color: Colors.black,
//                       //           fontWeight: FontWeight.bold),
//                       //     ),
//                       //   ),
//                     ],
//                   ),
//                 ),
//                 SafeArea(
//                     top: false,
//                     bottom: false,
//                     child: Card(
//                         elevation: 5.0,
//                         child: Form(
//                             key: formKey,
//                             autovalidate: _autovalidate,
//                             child: SingleChildScrollView(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.stretch,
//                                   children: <Widget>[
//                                     const SizedBox(height: 14.0),
//                                     TextFormField(
//                                       controller: phoneController,
//                                       decoration: const InputDecoration(
//                                           border: UnderlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.brown,
//                                                 style: BorderStyle.solid),
//                                           ),
//                                           focusedBorder: UnderlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.brown,
//                                                 style: BorderStyle.solid),
//                                           ),
//                                           // icon: Icon(
//                                           //   Icons.email,
//                                           //   color: Colors.brown,
//                                           // ),
//                                           icon: Icon(
//                                             Icons.phone,
//                                             color: Colors.brown,
//                                           ),
//                                           // hintText: 'Your email address',
//                                           // labelText: 'E-mail',
//                                           hintText: 'Your contact number',
//                                           labelText: 'Phone No.',
//                                           labelStyle:
//                                               TextStyle(color: Colors.brown)),
//                                       // keyboardType: TextInputType.emailAddress,
//                                       // validator: (val) => !val.contains('@')
//                                       //     ? 'Not a valid email.'
//                                       //     : null,
//                                       keyboardType: TextInputType.phone,
//                                       validator: validateMobile,
//                                       onSaved: (val) => _email = val,
//                                     ),
//                                     const SizedBox(height: 14.0),
//                                     TextFormField(
//                                       controller: passwordController,
//                                       obscureText: true,
//                                       decoration: const InputDecoration(
//                                           border: UnderlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.brown,
//                                                 style: BorderStyle.solid),
//                                           ),
//                                           focusedBorder: UnderlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.brown,
//                                                 style: BorderStyle.solid),
//                                           ),
//                                           icon: Icon(
//                                             Icons.lock,
//                                             color: Colors.brown,
//                                           ),
//                                           hintText: 'Your password',
//                                           labelText: 'Password',
//                                           labelStyle:
//                                               TextStyle(color: Colors.brown)),
//                                       validator: (val) => val.length < 6
//                                           ? 'Password too short.'
//                                           : null,
//                                       onSaved: (val) => _password = val,
//                                     ),
//                                     SizedBox(
//                                       height: 35.0,
//                                     ),
//                                     loginButon,
//                                     SizedBox(
//                                       height: 15.0,
//                                     ),
//                                     Container(
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: <Widget>[
//                                           Container(
//                                             // alignment: Alignment.bottomLeft,
//                                             // margin: EdgeInsets.only(left: 10.0),
//                                             child: GestureDetector(
//                                               onTap: () {},
//                                               child: Text(
//                                                 'FORGOT PASSWORD?',
//                                                 style: TextStyle(
//                                                     color: Colors.blueAccent,
//                                                     fontSize: 13.0),
//                                               ),
//                                             ),
//                                           ),
//                                           // Container(
//                                           //   // alignment: Alignment.center,
//                                           //   margin: EdgeInsets.only(left: 20.0),
//                                           //   child: GestureDetector(
//                                           //     onTap: () {},
//                                           //     child: Text(
//                                           //       'New User?',
//                                           //       style: TextStyle(
//                                           //           color: Colors.blueAccent,
//                                           //           fontSize: 13.0),
//                                           //     ),
//                                           //   ),
//                                           // ),
//                                           Container(
//                                             alignment: Alignment.bottomRight,
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 Navigator.pushReplacement(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             Signup_Screen()));
//                                               },
//                                               child: Text(
//                                                 'SIGNUP',
//                                                 style: TextStyle(
//                                                     color: Colors.brown,
//                                                     fontSize: 20.0,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),

//                                     /*   const SizedBox(height:24.0),

//                                Row(
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: <Widget>[

//                                    GestureDetector(
//                                     onTap: (){

//                                     },
//                                     child: Text('FORGOT PASSWORD?',style: TextStyle(
//                                       color: Colors.blueAccent,fontSize: 13.0
//                                     ),),
//                                   ),

//                                    GestureDetector(
//                                     onTap: (){

//                                     },
//                                     child: Text('LOGIN',style: TextStyle(
//                                         color: Colors.orange,fontSize: 15.0
//                                     ),),
//                                   ),

//                                 ],
//                               )

// */
//                                   ]),
//                             )) //login,
//                         ))
//               ],
//             ),
//           ),
//         )));
//   }

//   void _submit() {
//     final form = formKey.currentState;

//     if (form.validate()) {
//       form.save();
//       //------------calling API--------------
//       final body = {
//         "password": passwordController.text,
//         "username": "adgxcsvs",
//         // "phone": phoneController.text,
//         "otp": "13245",
//       };
//       ApiService.loginCustomer(body).then((success) {
//         if (success) {
//           showDialog(
//             builder: (context) => AlertDialog(
//               title: Text('Customer has been added!!!'),
//               actions: <Widget>[
//                 FlatButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     phoneController.text = '';
//                     // _employeeAge.text = '';
//                   },
//                   child: Text('OK'),
//                 )
//               ],
//             ),
//             context: context,
//           );
//           return;
//         } else {
//           showDialog(
//             builder: (context) => AlertDialog(
//               title: Text('Error Adding Employee!!!'),
//               actions: <Widget>[
//                 FlatButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('OK'),
//                 )
//               ],
//             ),
//             context: context,
//           );
//           return;
//         }
//       });

//       // Email & password matched our validation rules
//       // and are saved to _email and _password fields.
//       _performLogin();
//     } else {
//       showInSnackBar('Please fix the errors in red before submitting.');
//     }
//   }

//   void showInSnackBar(String value) {
//     scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
//   }

//   void _performLogin() {
//     // This is just a demo, so no actual login here.
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => OtpVerificationScreenState('9352530180')));
//   }

//   _verticalD() => Container(
//         margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
//       );
// }

// save() async {
//   localStorage.setString('Phone No.', phoneController.text.toString());
//   localStorage.setString('Password', passwordController.text.toString());
// }
