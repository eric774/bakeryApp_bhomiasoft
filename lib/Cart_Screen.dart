import 'package:flutter/material.dart';

import 'checkout_screen.dart';
import 'item_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum DialogDemoAction {
  cancel,
  discard,
  disagree,
  agree,
}

class Cart_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Cart();
}

void addItemInCart(String itemname, BuildContext context) async {
  // SharedPreferences cartList = await SharedPreferences.getInstance();
  // List itemList = [cartItem.getString('itemName')];
  // List itemList = cartList
  // for (var i = 0; i < cartItem.getStringList('itemName').length; i++) {
  itemList.add(
    Item(
      // itemImage: 'images/grapes.jpg',
      itemImage: cartItem.getString('itemImage'),
      itemName: cartItem.getString('itemName'),
      // itemQun: 'Qty:1',
      itemQun: 1,
      // itemQun: cartItem.getString('quantity'),
      itemPrice: cartItem.getString('itemPrice'),
      countPrice: int.parse(cartItem
          .getString('itemPrice')
          .replaceAll(new RegExp(r'[^0-9]'), '')),
    ),
  );
  var sprice = cartItem.getString('itemPrice');
  // for (var i = 0; i < cartItem.getString('itemPrice').length; i++) {
  //   var aStr = a.replaceAll(new RegExp(r'[^0-9]'),'');
  // }
  var aStr = sprice.replaceAll(new RegExp(r'[^0-9]'), '');
  var aInt = int.parse(aStr);
  totalPrice = totalPrice + aInt;
  // print(totalPrice);
  // quantity = cartItem.getString('quantity');
}

var totalPrice = 0;

class Item {
  final String itemImage;
  final String itemName;
  int itemQun;
  final String itemPrice;
  int countPrice;

  Item(
      {this.itemImage,
      this.itemName,
      this.itemQun,
      this.itemPrice,
      this.countPrice});
}

List<Item> itemList = <Item>[
  // Item(),
  // for (int i = 0; i < cartItem.getStringList('itemName').length; i++)
  //   {

  // cartItem.getString('itemName') != null
  //     ? Item(
  //         itemImage: 'images/grapes.jpg',
  //         itemName: cartItem.getString('itemName'),
  //         itemQun: 'Qty:1',
  //         itemPrice: '\₹ 100',
  //       )
  //     : Item(),
  // }
];

class Cart extends State<Cart_screen> {
  // List<Item> itemList = <Item>[
  //   Item(
  //       itemImage: 'images/grapes.jpg',
  //       itemName: 'mancurian',
  //       itemQun: 'Qty:1',
  //       itemPrice: '\₹ 100',
  //       ),
  //   Item(
  //       itemImage: 'images/tomato.jpg',
  //       itemName: 'Chocolate Cake',
  //       itemQun: 'Qty:3',
  //       itemPrice: '\₹ 112'),
  //   Item(
  //       itemImage: 'images/guava.jpg',
  //       itemName: 'Yammy Pizza',
  //       itemQun: 'Qty:2',
  //       itemPrice: '\₹ 105'),
  //   Item(
  //       itemImage: 'images/kiwi.jpg',
  //       itemName: 'Mommos',
  //       itemQun: 'Qty:1',
  //       itemPrice: '\₹ 90'),
  //   Item(
  //       itemImage: 'images/lemons.jpg',
  //       itemName: 'Panner Tikka',
  //       itemQun: 'Qty:2',
  //       itemPrice: '\₹ 70'),
  //   Item(
  //       itemImage: 'images/apple.jpg',
  //       itemName: 'Samosa',
  //       itemQun: 'Qty:1',
  //       itemPrice: '\₹ 50'),
  // ];

  String toolbarname = 'My Cart (4)';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  String pincode;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    IconData _add_icon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.add_circle;
        case TargetPlatform.iOS:
          return Icons.add_circle;
      }
      assert(false);
      return null;
    }

    IconData _sub_icon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.remove_circle;
        case TargetPlatform.iOS:
          return Icons.remove_circle;
      }
      assert(false);
      return null;
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double dd = width * 0.77;
    double hh = height - 215.0;

    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle =
        theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
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
                child: Stack(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => BodyOTP()
                          //         )
                          //         );
                        }),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
              color: Colors.brown,
              margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 10.0),
              child: Card(
                  child: Container(
                      // color: Colors.brown,
                      padding:
                          const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: GestureDetector(
                          child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // three line description
                          Row(
                            children: <Widget>[
                              Text(
                                'Pincode : ',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black54,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 2.0),
                              ),
                              GestureDetector(
                                child: Text(
                                  '383310',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      color: Colors.black),
                                ),
                                onTap: () {
                                  showDemoDialog<DialogDemoAction>(
                                      context: context,
                                      child: AlertDialog(
                                          title: const Text(
                                              'Location/Area Pincode'),
                                          content: SizedBox(
                                            height: 24.0,
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .emailAddress, // Use email input type for emails.
                                                decoration: InputDecoration(
                                                    hintText: '******',
                                                    labelText: 'Pincode'),
                                                //  validator: this._validateEmail,
                                                onSaved: (String value) {
                                                  this.pincode = value;
                                                }),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                                child: const Text('CANCEL'),
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context,
                                                      DialogDemoAction
                                                          .disagree);
                                                }),
                                            FlatButton(
                                                child: const Text('SAVE'),
                                                onPressed: () {
                                                  Navigator.pop(context,
                                                      DialogDemoAction.agree);
                                                })
                                          ]));
                                },
                              )
                            ],
                          ),
                        ],
                      ))))),
          Container(
              // color: Colors.brown,
              margin: EdgeInsets.only(
                  left: 5.0, top: 5.0, right: 12.0, bottom: 10.0),
              height: hh,
              //---------------------------itembuilder---------------------------------------
              child: itemList.length == 0
                  ? Text(
                      'No item in the cart currently. Not Hungry?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  : ListView.builder(
                      itemCount: itemList.length,
                      itemBuilder: (BuildContext cont, int ind) {
                        // item = int.parse(itemList[ind].itemName);
                        return SafeArea(
                            child: Container(
                          // color: Colors.brown,
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  // color: Colors.brown,
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 120.0,
                                        width: dd,
                                        child: Expanded(
                                          child: Card(
                                            child: Row(
                                              children: <Widget>[
                                                SizedBox(
                                                    height: 200.0,
                                                    width: 100.0,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15.0)),
                                                          border: Border.all(
                                                            color: Colors.black,
                                                            width: 2,
                                                          )),
                                                      child: Image.asset(
                                                        itemList[ind].itemImage,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                SizedBox(
                                                    height: 200.0,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          _verticalD(),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Text(
                                                                itemList[ind]
                                                                    .itemName,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        18.0,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ],
                                                          ),
                                                          _verticalD(),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Text(
                                                                itemList[ind]
                                                                    .itemPrice,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15.0,
                                                                    color: Colors
                                                                        .brown),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              IconButton(
                                                                icon: Icon(
                                                                    _add_icon(),
                                                                    color: Colors
                                                                        .brown),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    // item =
                                                                    //     item + 1;
                                                                    itemList[ind]
                                                                            .itemQun =
                                                                        itemList[ind].itemQun +
                                                                            1;
                                                                    // print(item);
                                                                    itemList[
                                                                            ind]
                                                                        .countPrice = itemList[ind]
                                                                            .countPrice +
                                                                        int.parse(itemList[ind].itemPrice.replaceAll(
                                                                            new RegExp(r'[^0-9]'),
                                                                            ''));
                                                                    totalPrice = totalPrice +
                                                                        int.parse(itemList[ind].itemPrice.replaceAll(
                                                                            new RegExp(r'[^0-9]'),
                                                                            ''));
                                                                    // print(itemList[
                                                                    //         ind]
                                                                    //     .itemPrice);
                                                                  });
                                                                },
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            2.0),
                                                              ),
                                                              Text(
                                                                // item.toString(),
                                                                itemList[ind]
                                                                    .itemQun
                                                                    .toString(),
                                                                /*     style: descriptionStyle.copyWith(
                                                     fontSize: 20.0,
                                                     color: Colors.black87),*/
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            2.0),
                                                              ),
                                                              IconButton(
                                                                icon: Icon(
                                                                    _sub_icon(),
                                                                    color: Colors
                                                                        .brown),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    if (itemList[ind]
                                                                            .itemQun >
                                                                        1) {
                                                                      // item =
                                                                      //     item -
                                                                      //         1;
                                                                      itemList[ind]
                                                                              .itemQun =
                                                                          itemList[ind].itemQun -
                                                                              1;
                                                                      itemList[
                                                                              ind]
                                                                          .countPrice = itemList[ind]
                                                                              .countPrice -
                                                                          int.parse(itemList[ind].itemPrice.replaceAll(
                                                                              new RegExp(r'[^0-9]'),
                                                                              ''));
                                                                      totalPrice = totalPrice -
                                                                          int.parse(itemList[ind].itemPrice.replaceAll(
                                                                              new RegExp(r'[^0-9]'),
                                                                              ''));
                                                                    } else {
                                                                      itemSelectedForCart
                                                                          .remove(
                                                                              itemList[ind].itemName);
                                                                      itemList.remove(
                                                                          itemList[
                                                                              ind]);
                                                                      totalPrice = totalPrice -
                                                                          int.parse(itemList[ind].itemPrice.replaceAll(
                                                                              new RegExp(r'[^0-9]'),
                                                                              ''));
                                                                    }
                                                                  });
                                                                },
                                                              ),
                                                              //----delete card button----
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      itemSelectedForCart
                                                                          .remove(
                                                                              itemList[ind].itemName);
                                                                      itemList.remove(
                                                                          itemList[
                                                                              ind]);
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                      'Remove item'))
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: 110.0,
                                          width: 50.0,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              '\₹ ' +
                                                  itemList[ind]
                                                      .countPrice
                                                      .toString(),
                                            ),
                                          )),
                                    ],
                                  )),
                            ],
                          ),
                        ));
                      })),
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              height: 60.0,
              child: Card(
                color: Colors.brown[200],
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
                      style: TextStyle(fontSize: 17.0, color: Colors.brown),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: OutlineButton(
                            borderSide: BorderSide(color: Colors.brown),
                            child: const Text('CONFIRM ORDER'),
                            textColor: Colors.black,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Checkout()));
                            },
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  verticalDivider() => Container(
        padding: EdgeInsets.all(2.0),
      );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 07.0, bottom: 0.0),
      );

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
      if (value != null) {
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text('You selected: $value')));
      }
    });
  }
}
