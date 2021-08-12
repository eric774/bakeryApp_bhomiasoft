import 'package:flutter/material.dart';
import 'Cart_Screen.dart';
import 'Payment_Screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'checkout_screen.dart';

bool checkboxValueA = true;
bool checkboxValueB = false;
bool checkboxValueC = false;

class DeliveryAddress extends StatefulWidget {
  // const DeliveryAddress({
  //   Key key,
  // }) : super(key: key);

  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   alignment: Alignment.topLeft,
    //   margin: EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
    //   child: Text(
    //     'Delivery Address',
    //     style: TextStyle(
    //         color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18.0),
    //   ),
    // );
    return Container(
        height: 165.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              height: 165.0,
              width: 56.0,
              child: Card(
                elevation: 3.0,
                child: Row(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        child:
                            IconButton(icon: Icon(Icons.add), onPressed: null)),
                  ],
                ),
              ),
            ),
            Container(
              height: 165.0,
              width: 200.0,
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
                              left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Naomi A. Schultz',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15.0,
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
                                'MD 21801',
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
                                    bottom: 2.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                  ],
                ),
              ),
            ),
            Container(
              height: 130.0,
              width: 200.0,
              margin: EdgeInsets.all(7.0),
              child: Card(
                elevation: 3.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 12.0, top: 5.0, right: 0.0, bottom: 2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Lisa J. Cunningham',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                _verticalDivider(),
                                Text(
                                  '49 Bagwell Avenue',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 13.0,
                                      letterSpacing: 0.5),
                                ),
                                _verticalDivider(),
                                Text(
                                  'Ocala',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 13.0,
                                      letterSpacing: 0.5),
                                ),
                                _verticalDivider(),
                                Text(
                                  ' FL 34471',
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
                                      bottom: 2.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 130.0,
              width: 200.0,
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
                              left: 12.0, top: 5.0, right: 0.0, bottom: 2.0),
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
                                ' CA 90802',
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

_verticalDivider() => Container(
      color: Colors.brown,
      padding: EdgeInsets.all(1.0),
    );
_verticalD() => Container(
      margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 0.0, bottom: 0.0),
    );
