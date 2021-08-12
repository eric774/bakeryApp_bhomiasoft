import 'dart:io';
import 'package:bakery/changepassword.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:bakery/editprofile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'dart:ffi';

class Account_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => account();
}

class account extends State<Account_Screen> {
  File _image;
  String username = 'Naomi A. Schultz';
  String mobilenumber = '410-422-9171';
  String eid = 'NaomiASchultz@armyspy.com';

  Future getCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    Navigator.of(context).pop();

    setState(() {
      _image = image;
    });
  }

  Widget bottomsheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            "Choose pic",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: getCamera,
                label: Text('Camera'),
              ),
              FlatButton.icon(
                icon: Icon(Icons.folder),
                onPressed: getGallerypic,
                label: Text('Gallery'),
              )
            ],
          )
        ],
      ),
    );
  }

  Future getPic() async {
    // var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      showModalBottomSheet(
        context: context,
        builder: ((builder) => bottomsheet()),
      );
      // _image = image;
    });
  }

  Future getGallerypic() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    Navigator.of(context).pop();

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Icon ofericon = Icon(
      Icons.edit,
      color: Colors.black38,
    );
    Icon keyloch = Icon(
      Icons.vpn_key,
      color: Colors.black38,
    );
    Icon clear = Icon(
      Icons.history,
      color: Colors.black38,
    );
    Icon logout = Icon(
      Icons.do_not_disturb_on,
      color: Colors.black38,
    );

    Icon menu = Icon(
      Icons.more_vert,
      color: Colors.black38,
    );
    bool checkboxValueA = true;
    bool checkboxValueB = false;
    bool checkboxValueC = false;

    //List<address> addresLst = loadAddress() as List<address> ;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
        ),
      ),
      body: Container(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(7.0),
            alignment: Alignment.topCenter,
            height: 260.0,
            child: Card(
              elevation: 3.0,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    child:
                        // Container(
                        //     width: 100.0,
                        //     height: 100.0,
                        //     margin: const EdgeInsets.all(10.0),
                        //     // padding: const EdgeInsets.all(3.0),
                        //     child: Center(
                        //       child: _image == null
                        //           ? Text('Upload Profile Pic.')
                        //           // : Image.file(_image)),
                        //           : ClipRRect(
                        //               borderRadius: new BorderRadius.circular(200),
                        //               child: Container(
                        //                 margin: EdgeInsets.all(8),
                        //                 width: 86,
                        //                 height: 86,
                        //                 decoration: BoxDecoration(shape: BoxShape.circle,
                        //                 ),
                        //                 child: Image.file(
                        //                   _image,
                        //                   // width: 100.0,
                        //                   // height: 100.0,
                        //                 ),
                        //               ),
                        //             ),
                        //     )
                        //     ),
                        Container(
                      margin: EdgeInsets.all(8),
                      width: 86,
                      height: 86,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: _image == null
                                ? AssetImage('assets/user.jpeg')
                                : FileImage(File(_image.path)),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),

                  FlatButton(
                    onPressed: getPic,
                    child: Text(
                      'Update pic',
                      style:
                          TextStyle(fontSize: 13.0, color: Colors.blueAccent),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.blueAccent)),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: 10.0, top: 20.0, right: 5.0, bottom: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              username,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            _verticalDivider(),
                            Text(
                              mobilenumber,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5),
                            ),
                            _verticalDivider(),
                            Text(
                              eid,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5),
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            icon: ofericon,
                            color: Colors.blueAccent,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfile(
                                            name: username,
                                            emailID: eid,
                                            mobileNumber: mobilenumber,
                                          )));
                            }),
                      )
                    ],
                  ),
                  // VerticalDivider(),
                ],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
            child: Text(
              'Addresses',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ),
          Container(
              height: 165.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    height: 165.0,
                    width: 230.0,
                    margin: EdgeInsets.all(4.0),
                    child: Card(
                      elevation: 3.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12.0,
                                    top: 5.0,
                                    right: 0.0,
                                    bottom: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Naomi A. Schultz',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    _verticalDivider(),
                                    Text(
                                      '2585 Columbia Boulevard',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    _verticalDivider(),
                                    Text(
                                      'Salisbury',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    _verticalDivider(),
                                    Text(
                                      ' MD 21801',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 00.0,
                                          top: 05.0,
                                          right: 0.0,
                                          bottom: 5.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Delivery Address',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black26,
                                            ),
                                          ),
                                          _verticalD(),
                                          Checkbox(
                                            value: checkboxValueA,
                                            onChanged: (bool value) {
                                              setState(() {
                                                checkboxValueA = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                  icon: menu,
                                  color: Colors.black38,
                                  onPressed: null),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 130.0,
                    width: 230.0,
                    margin: EdgeInsets.all(7.0),
                    child: Card(
                      elevation: 3.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12.0,
                                    top: 5.0,
                                    right: 0.0,
                                    bottom: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Bradford R. Butler',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    _verticalDivider(),
                                    Text(
                                      '4528 Filbert Street',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    _verticalDivider(),
                                    Text(
                                      'Philadelphia',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    _verticalDivider(),
                                    Text(
                                      ' PA 19103',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 00.0,
                                          top: 05.0,
                                          right: 0.0,
                                          bottom: 5.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Delivery Address',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black12,
                                            ),
                                          ),
                                          _verticalD(),
                                          Checkbox(
                                            value: checkboxValueB,
                                            onChanged: (bool value) {
                                              setState(() {
                                                checkboxValueB = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                  icon: menu,
                                  color: Colors.black38,
                                  onPressed: null),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 130.0,
                    width: 230.0,
                    margin: EdgeInsets.all(7.0),
                    child: Card(
                      elevation: 3.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: 12.0,
                                    top: 5.0,
                                    right: 0.0,
                                    bottom: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Elizabeth J. Schmidt',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    _verticalDivider(),
                                    Text(
                                      '3674 Oakway Lane',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    _verticalDivider(),
                                    Text(
                                      'Long Beach',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    _verticalDivider(),
                                    Text(
                                      'CA 90802',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 00.0,
                                          top: 05.0,
                                          right: 0.0,
                                          bottom: 5.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Delivery Address',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black12,
                                            ),
                                          ),
                                          _verticalD(),
                                          Checkbox(
                                            value: checkboxValueC,
                                            onChanged: (bool value) {
                                              setState(() {
                                                checkboxValueC = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                  icon: menu,
                                  color: Colors.black38,
                                  onPressed: null),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.all(7.0),
            child: Card(
              elevation: 1.0,
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: keyloch,
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ChangePassword()));
                      }),
                  _verticalD(),
                  Text(
                    'Change Password',
                    style: TextStyle(fontSize: 15.0, color: Colors.black87),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(7.0),
            child: Card(
              elevation: 1.0,
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: clear,
                      onPressed: () {
                        // Show a basic widget
                        Alert(
                          context: context,
                          image: Image.asset("assets/warning.png"),
                          title: "RFLUTTER ALERT",
                          desc: "Flutter is more awesome with RFlutter Alert.",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Proceed",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              onPressed: () => Navigator.pop(context),
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                            ),
                            DialogButton(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              onPressed: () => Navigator.pop(context),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(116, 116, 191, 1.0),
                                Color.fromRGBO(52, 138, 199, 1.0),
                              ]),
                            )
                          ],
                        ).show();
                      }),
                  _verticalD(),
                  Text(
                    'Clear History',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(7.0),
            child: Card(
              elevation: 1.0,
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: logout,
                      onPressed: () {
                        // Show a basic widget
                        Alert(
                          context: context,
                          image: Image.asset("assets/warning.png"),
                          title: "RFLUTTER ALERT",
                          desc: "Flutter is more awesome with RFlutter Alert.",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Proceed",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              onPressed: () => Navigator.pop(context),
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                            ),
                            DialogButton(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              onPressed: () => Navigator.pop(context),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(116, 116, 191, 1.0),
                                Color.fromRGBO(52, 138, 199, 1.0),
                              ]),
                            )
                          ],
                        ).show();
                      }),
                  _verticalD(),
                  Text(
                    'Deactivate Account',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.redAccent,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ))),
    );
  }

  _verticalDivider() => Container(
        padding: EdgeInsets.all(2.0),
      );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 0.0, bottom: 0.0),
      );
}
