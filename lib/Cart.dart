import 'package:bakery/item_screen.dart';
import 'package:bakery/main.dart';
import 'package:flutter/material.dart';
import "package:scoped_model/scoped_model.dart";
import "ScopeManage.dart";
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  static final String route = "Cart-route";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CartState();
  }
}

class CartState extends State<Cart> {
  Widget generateCart(Data d) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white12,
            border: Border(
              bottom: BorderSide(color: Colors.grey[100], width: 1.0),
              top: BorderSide(color: Colors.grey[100], width: 1.0),
            )),
        height: 100.0,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 5.0)
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  image: DecorationImage(
                      image: NetworkImage(d.image), fit: BoxFit.fill)),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          d.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15.0),
                        ),
                      ),
                      Container(
                          alignment: Alignment.bottomRight,
                          child: ScopedModelDescendant<AppModel>(
                            builder: (cotext, child, model) {
                              return InkResponse(
                                  onTap: () {
                                    model.removeCart(d);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                    ),
                                  ));
                            },
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text("Price ₹ ${d.price.toString()}"),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var totalPriceSum = 0.0;

    @override
    void initState() {
      super.initState();
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Cart List"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: Colors.grey[300], width: 1.0))),
        child: ScopedModelDescendant<AppModel>(
          builder: (context, child, model) {
            for (var i = 0; i < model.cartListing.length; i++) {
              totalPriceSum = model.cartListing[i].price + totalPriceSum;
            }
            print(totalPriceSum);
            //
            return ListView(
              shrinkWrap: true,
              children: model.cartListing.map((d) => generateCart(d)).toList(),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 1.0),
          height: 60.0,
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(color: Colors.grey[300], width: 1.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    // Container(
                    //   width: 60.0,
                    //   child: Text(
                    //     "Total Amount",
                    //     style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    //   ),
                    // ),
                    // Text("\₹ $totalPriceSum",
                    //     style: TextStyle(
                    //         fontSize: 25.0, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              ScopedModelDescendant<AppModel>(
                builder: (context, child, model) {
                  return ButtonTheme(
                    minWidth: 300,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.red[300],
                      onPressed: () {
                        print(totalPriceSum);
                        // model.addCart(widget.detail);
                        // Timer(Duration(milliseconds: 500), () {
                        //   showCartSnak(model.cartMsg, model.success);
                        // });
                      },
                      child: Container(
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: Text(
                              "Check Out",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                            )),
                            SizedBox(
                              width: 50,
                            ),
                            // Text("Total Amount",
                            //     style: TextStyle(
                            //         fontSize: 15.0, fontWeight: FontWeight.w600)),
                            SizedBox(
                              width: 50,
                            ),
                            Text("\₹ $totalPriceSum",
                                style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          )),
    );
  }
}

// void checkItemInCart(String itemname, BuildContext context) {
//   item.sharedPreferences
// }
