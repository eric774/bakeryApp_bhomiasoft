import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final String mobileNumber;
  final String name;
  final String emailID;
  final Key fieldKey;

  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  EditProfile(
      {Key key,
      this.fieldKey,
      @required this.name,
      @required this.mobileNumber,
      @required this.emailID,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted})
      : super(key: key);
  @override
  _EditProfileState createState() => _EditProfileState();
}

ThemeData buildTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    hintColor: Colors.red,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.yellow, fontSize: 24.0),
    ),
  );
}

class _EditProfileState extends State<EditProfile> {
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

  // _EditProfileState(String name, String emailID, String mobileNumber);

  @override
  Widget build(BuildContext context) {
    // final Firstgetname = "";
    // final FSecondgetname = "";
    final split = widget.name.split(' ');
    final Map<int, String> values = {
      for (int i = 0; i < split.length; i++) i: split[i]
    };

    final Firstgetname = values[0];
    final FSecondgetname = values[1];

    print(Firstgetname);
    bool _obscureText = true;
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.brown,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _submit();
        },
        child: Text("Edit",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Edit Profile'),
          backgroundColor: Colors.brown,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 100,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 7.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Image.asset("assets/playstore-icon.png")),
                    SizedBox(
                      height: 100,
                    ),
                    //     _verticalD(),
                    //     GestureDetector(
                    //       onTap: () {
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Login_Screen()));
                    //       },
                    //       child: Text(
                    //         'Login',
                    //         style: TextStyle(
                    //             fontSize: 20.0,
                    //             color: Colors.black26,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //     _verticalD(),
                    //     GestureDetector(
                    //       onTap: () {
                    //         /*Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => signup_screen()));*/
                    //       },
                    //       child: Text(
                    //         'Signup',
                    //         style: TextStyle(
                    //             fontSize: 20.0,
                    //             color: Colors.black87,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
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
                                    initialValue: Firstgetname,
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
                                    initialValue: FSecondgetname,
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
                                    initialValue: widget.emailID,
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
                                    initialValue: widget.mobileNumber,
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
                                        labelText: 'Phone',
                                        labelStyle:
                                            TextStyle(color: Colors.brown)),
                                    keyboardType: TextInputType.phone,
                                    validator: validateMobile,
                                    onSaved: (String val) {
                                      _phone = val;
                                    },
                                  ),
                                  // const SizedBox(height: 14.0),
                                  // TextFormField(
                                  //   obscureText: true,
                                  //   decoration: const InputDecoration(
                                  //       border: UnderlineInputBorder(
                                  //         borderSide: BorderSide(
                                  //             color: Colors.brown,
                                  //             style: BorderStyle.solid),
                                  //       ),
                                  //       focusedBorder: UnderlineInputBorder(
                                  //         borderSide: BorderSide(
                                  //             color: Colors.brown,
                                  //             style: BorderStyle.solid),
                                  //       ),
                                  //       icon: Icon(
                                  //         Icons.lock,
                                  //         color: Colors.brown,
                                  //       ),
                                  //       hintText: 'Your password',
                                  //       labelText: 'Password',
                                  //       labelStyle:
                                  //           TextStyle(color: Colors.brown)),
                                  //   validator: (val) => val.length < 6
                                  //       ? 'Password too short.'
                                  //       : null,
                                  //   onSaved: (val) => _password = val,
                                  // ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  loginButon,
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  // Container(
                                  //   child: Row(
                                  //     mainAxisSize: MainAxisSize.max,
                                  //     mainAxisAlignment: MainAxisAlignment.end,
                                  //     children: <Widget>[
                                  //       Text(
                                  //         "Already Account ?",
                                  //         style:
                                  //             TextStyle(color: Colors.orange),
                                  //       ),
                                  //       SizedBox(
                                  //         width: 5,
                                  //       ),
                                  //       Container(
                                  //         alignment: Alignment.bottomRight,
                                  //         child: GestureDetector(
                                  //           onTap: () {
                                  //             // Navigator.pushReplacement(
                                  //             //     context,
                                  //             //     MaterialPageRoute(
                                  //             //         builder: (context) =>
                                  //             //             Login_Screen()));
                                  //           },
                                  //           child: Text(
                                  //             'SIGNIN',
                                  //             style: TextStyle(
                                  //                 color: Colors.brown,
                                  //                 fontSize: 20.0,
                                  //                 fontWeight: FontWeight.bold),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),

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

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performLogin();
    } else {
      showInSnackBar('Please fix the errors in red before submitting.');
    }
  }

  void showInSnackBar(String value) {
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  void _performLogin() {
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
