import 'package:flutter/material.dart';

import 'myreward.dart';

class Patment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => payment();
}

class Item {
  final String itemName;
  final String itemQun;
  final String itemPrice;

  Item({this.itemName, this.itemQun, this.itemPrice});
}

class payment extends State<Patment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;

  IconData _backIcon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }

  int _radioValue = 0;
  void handleRadioValueChanged(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
        case 3:
          break;
        case 4:
          break;
        case 5:
          break;
        case 6:
          break;
        case 7:
          break;
        case 8:
          break;
      }
    });
  }

  List<Item> itemList = <Item>[
    Item(itemName: 'Black Grape', itemQun: 'Qty:1', itemPrice: '\₹ 100'),
    Item(itemName: 'Tomato', itemQun: 'Qty:3', itemPrice: '\₹ 112'),
    Item(itemName: 'Mango', itemQun: 'Qty:2', itemPrice: '\₹ 105'),
    Item(itemName: 'Capsicum', itemQun: 'Qty:1', itemPrice: '\₹ 90'),
    Item(itemName: 'Lemon', itemQun: 'Qty:2', itemPrice: '\₹ 70'),
    Item(itemName: 'Apple', itemQun: 'Qty:1', itemPrice: '\₹ 50'),
  ];
  String toolbarname = 'CheckOut';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final double height = MediaQuery.of(context).size.height;

    AppBar appBar = AppBar(
      leading: IconButton(
        icon: Icon(_backIcon()),
        alignment: Alignment.centerLeft,
        tooltip: 'Back',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(toolbarname),
      backgroundColor: Colors.brown,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 150.0,
            width: 30.0,
            child: GestureDetector(
              onTap: () {
                /*Navigator.of(context).push(
                   MaterialPageRoute(
                      builder:(BuildContext context) =>
                       CartItemsScreen()
                  )
              );*/
              },
            ),
          ),
        )
      ],
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar,
      bottomNavigationBar: BottomAppBar(
        child: Container(
            alignment: Alignment.bottomLeft,
            height: 50.0,
            child: Card(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.info), onPressed: null),
                  Text(
                    'Total :',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\₹ 524',
                    style: TextStyle(fontSize: 17.0, color: Colors.black54),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: OutlineButton(
                          borderSide: BorderSide(color: Colors.green),
                          child: const Text('PROCEED TO PAY'),
                          textColor: Colors.green,
                          onPressed: () {
                            if (_radioValue == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyRewards()),
                              );
                            }
                          },
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                    ),
                  ),
                ],
              ),
            )),
      ),
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(5.0),
              child: Card(
                  child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // three line description
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Delivery',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black38),
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              Icons.play_circle_outline,
                                              color: Colors.black38,
                                            ),
                                            onPressed: null)
                                      ],
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Payment',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              Icons.check_circle,
                                              color: Colors.blue,
                                            ),
                                            onPressed: null)
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ],
                      )))),
          _verticalDivider(),
          Container(
              margin: EdgeInsets.all(10.0),
              child: Card(
                child: Container(
                  color: Colors.green.shade100,
                  child: Container(
                      padding:
                          const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                      child: Text(
                          "GET EXTRA 5% OFF* with MONEY bank Simply Save Credit card. T&C.",
                          maxLines: 10,
                          style: TextStyle(
                              fontSize: 13.0, color: Colors.black87))),
                ),
              )),
          Container(
            alignment: Alignment.topLeft,
            margin:
                EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
            child: Text(
              'Payment Method',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ),
          _verticalDivider(),
          Expanded(
              child: Container(
            margin: EdgeInsets.all(10.0),
            child: Card(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              child: Row(
                            children: [
                              ImageIcon(
                                AssetImage("assets/wallet.png"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Wallet / UPI",
                                  maxLines: 10,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black)),
                            ],
                          )),
                          Radio<int>(
                              value: 0,
                              groupValue: _radioValue,
                              onChanged: handleRadioValueChanged),
                        ],
                      ),
                    ),
                    Divider(),
                    _verticalD(),
                    Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                child: Row(
                              children: [
                                ImageIcon(
                                  AssetImage("assets/online-payment.png"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Net Banking",
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black)),
                              ],
                            )),
                            Radio<int>(
                                value: 1,
                                groupValue: _radioValue,
                                onChanged: handleRadioValueChanged),
                          ],
                        )),
                    Divider(),
                    _verticalD(),
                    Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                child: Row(
                              children: [
                                ImageIcon(
                                  AssetImage("assets/credit-card.png"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Credit / Debit / ATM Card",
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black)),
                              ],
                            )),
                            Radio<int>(
                                value: 2,
                                groupValue: _radioValue,
                                onChanged: handleRadioValueChanged),
                          ],
                        )),
                    Divider(),
                    _verticalD(),
                    Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                child: Row(
                              children: [
                                ImageIcon(
                                  AssetImage("assets/paytm.png"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Paytm",
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black)),
                              ],
                            )),
                            Radio<int>(
                                value: 3,
                                groupValue: _radioValue,
                                onChanged: handleRadioValueChanged),
                          ],
                        )),
                    Divider(),
                    _verticalD(),
                    Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                child: Row(
                              children: [
                                ImageIcon(
                                  AssetImage("assets/paypal.png"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Paypal",
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black)),
                              ],
                            )),
                            Radio<int>(
                                value: 4,
                                groupValue: _radioValue,
                                onChanged: handleRadioValueChanged),
                          ],
                        )),
                    Divider(),
                    _verticalD(),
                    Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                child: Row(
                              children: [
                                ImageIcon(
                                  AssetImage("assets/rayzorpay.png"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Rayzorpay",
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black)),
                              ],
                            )),
                            Radio<int>(
                                value: 5,
                                groupValue: _radioValue,
                                onChanged: handleRadioValueChanged),
                          ],
                        )),
                    Divider(),
                    _verticalD(),
                    Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                child: Row(
                              children: [
                                ImageIcon(
                                  AssetImage("assets/googlepay.png"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("googlepay",
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black)),
                              ],
                            )),
                            Radio<int>(
                                value: 6,
                                groupValue: _radioValue,
                                onChanged: handleRadioValueChanged),
                          ],
                        )),
                    Divider(),
                    _verticalD(),
                    Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                child: Row(
                              children: [
                                ImageIcon(
                                  AssetImage("assets/stripepay.png"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("stripe payment",
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black)),
                              ],
                            )),
                            Radio<int>(
                                value: 7,
                                groupValue: _radioValue,
                                onChanged: handleRadioValueChanged),
                          ],
                        )),
                    Divider(),
                    _verticalD(),
                    Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                child: Row(
                              children: [
                                ImageIcon(
                                  AssetImage("assets/phone-pe.png"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("phone-pay",
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black)),
                              ],
                            )),
                            Radio<int>(
                                value: 8,
                                groupValue: _radioValue,
                                onChanged: handleRadioValueChanged),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  _verticalDivider() => Container(
        color: Colors.brown,
        padding: EdgeInsets.all(1.0),
      );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 5.0),
      );
}
