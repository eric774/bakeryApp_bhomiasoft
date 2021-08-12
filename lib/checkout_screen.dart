import 'package:flutter/material.dart';
import 'Cart_Screen.dart';
import 'Payment_Screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'Deliver_address.dart';
import 'Cart_Screen.dart';

class Checkout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => check_out();
}

class Item {
  final String itemName;
  final String itemQun;
  final String itemPrice;

  Item({this.itemName, this.itemQun, this.itemPrice});
}

class check_out extends State<Checkout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;
  //---razorpay instance--
  final _razorpay = Razorpay();
  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear(); // Removes all listeners
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_USqORzNNxRtN3h",
      // "amount": num.parse(textEditingController.text) * 100,
      "amount": num.parse(totalPrice.toString()) * 100,
      "name": "Bakery App",
      "description": "Payment for the some random product",
      'timeout': 60, // in seconds
      "prefill": {"contact": "2121212121", "email": "gaurav.kumar@example.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("something when payment succeeds");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("something when payment fails");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("something when an external wallet is selected");
  }

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

  List itemBill = itemList;
  // List<Item> itemBill =
  // <Item>[
  //   // Item(itemName: 'Black Grape', itemQun: 'Qty:1', itemPrice: '\₹ 100'),
  //   // Item(itemName: 'Tomato', itemQun: 'Qty:3', itemPrice: '\₹ 112'),
  //   // Item(itemName: 'Mango', itemQun: 'Qty:2', itemPrice: '\₹ 105'),
  //   // Item(itemName: 'Capsicum', itemQun: 'Qty:1', itemPrice: '\₹ 90'),
  //   // Item(itemName: 'Lemon', itemQun: 'Qty:2', itemPrice: '\₹ 70'),
  //   // Item(itemName: 'Apple', itemQun: 'Qty:1', itemPrice: '\₹ 50'),
  // ];
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              color: Colors.black),
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              Icons.play_circle_outline,
                                              color: Colors.blue,
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
                                              color: Colors.black38),
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              Icons.check_circle,
                                              color: Colors.black38,
                                            ),
                                            onPressed: null)
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ],
                      )))),
          // _verticalDivider(),
          // Container(
          //   alignment: Alignment.topLeft,
          //   margin:
          //       EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
          //   child: Text(
          //     'Delivery Address',
          //     style: TextStyle(
          //         color: Colors.black87,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 18.0),
          //   ),
          // ),
          // //---moved to new page---
          // DeliveryAddress(),
          // _verticalDivider(),
          Container(
            alignment: Alignment.topLeft,
            margin:
                EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
            child: Text(
              'Order Summary',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  left: 12.0, top: 5.0, right: 12.0, bottom: 5.0),
              height: 223.0,
              child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext cont, int ind) {
                    return SafeArea(
                        child: Column(
                      children: <Widget>[
                        Divider(color: Colors.brown, height: 15.0),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(itemList[ind].itemName,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold)),
                              Text(itemBill[ind].itemQun.toString(),
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold)),
                              Text(itemList[ind].itemPrice,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ));
                  })),
          Container(
              color: Colors.red,
              // alignment: Alignment.bottomLeft,
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
                      '\₹ ' + totalPrice.toString(),
                      style: TextStyle(fontSize: 17.0, color: Colors.black54),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: OutlineButton(
                            borderSide: BorderSide(color: Colors.brown),
                            child: const Text('CONFIRM ORDER'),
                            textColor: Colors.brown,
                            onPressed: () {
                              print('Pressed');
                              openCheckout();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Patment()));
                            },
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  IconData _add_icon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.add;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }

  IconData _sub_icon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.remove;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }

  _verticalDivider() => Container(
        color: Colors.brown,
        padding: EdgeInsets.all(1.0),
      );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 0.0, bottom: 0.0),
      );
}
