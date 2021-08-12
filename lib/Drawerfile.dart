// import 'package:flipkart_flutter_ui/Cart.dart';
// import 'package:flipkart_flutter_ui/Home.dart';
// import 'package:flipkart_flutter_ui/myreward.dart';
// import 'package:flipkart_flutter_ui/src/ui/widgets/Notificationscreen.dart';
// import 'package:flipkart_flutter_ui/src/ui/widgets/account.dart';
// import 'package:flipkart_flutter_ui/src/ui/widgets/orderspage.dart';
// import 'package:bakery/login/pages/login_page.dart';
import 'package:bakery/services/Auth_Service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Account_screen.dart';
import 'Drawerfile.dart';
import 'authentication_service.dart';
import 'help_screen.dart';
import 'login/login_page.dart';
import 'logind_signup.dart';
import 'main.dart';
import 'orderhistory_screen.dart';
import 'setting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Drawerfile extends StatefulWidget {
  @override
  _DrawerfileState createState() => _DrawerfileState();
}

class _DrawerfileState extends State<Drawerfile> {
  List<DrawerItemModel> drawerItemModel;

  @override
  void initState() {
    super.initState();
    // addDrawerItem();
  }

  // addDrawerItem() {
  //   drawerItemModel = List<DrawerItemModel>();
  //   drawerItemModel.add(DrawerItemModel("Ashish BHomia",
  //       "https://rukminim1.flixcart.com/www/50/50/promos/11/07/2018/70e5346e-fce4-4718-8e56-27be8492faa5.png?q=80"));
  //   drawerItemModel.add(DrawerItemModel("Vodka",
  //       "https://spng.pngfind.com/pngs/s/25-259403_absolut-vodka-bottle-absolut-vodka-bottle-png-transparent.png"));
  //   drawerItemModel.add(DrawerItemModel("Whiskey",
  //       "https://p.kindpng.com/picc/s/162-1622840_drink-liqueur-alcoholic-beverage-distilled-beverage-tennessee-jack.png"));
  //   drawerItemModel.add(DrawerItemModel("Brandy",
  //       "https://www.distillersdirect.com/images/products/3493/Hennessy%20xo-gallery_blowup.jpg"));
  //   drawerItemModel.add(DrawerItemModel("Vermouth",
  //       "https://w7.pngwing.com/pngs/445/181/png-transparent-liqueur-vermouth-distilled-beverage-wine-beer-wine.png"));
  //   drawerItemModel.add(DrawerItemModel(
  //       "Cognac", "https://pngimg.com/uploads/cognac/cognac_PNG15135.png"));
  //   drawerItemModel.add(DrawerItemModel("Beer",
  //       "https://png.pngtree.com/png-vector/20190116/ourmid/pngtree-beer-beer-bottle-liqueur-drink-png-image_381172.jpg"));
  //   drawerItemModel.add(DrawerItemModel(
  //       "Port wine", "https://freepngimg.com/thumb/categories/2300.png"));
  //   drawerItemModel.add(DrawerItemModel("Rum",
  //       "https://www.clipartkey.com/mpngs/m/121-1215722_whiskey-bottle-png-whiskey-and-glass-png.png"));
  //   drawerItemModel.add(DrawerItemModel("Offer Zone",
  //       "https://cdn1.vectorstock.com/i/1000x1000/85/60/special-offer-label-icon-flat-style-vector-13578560.jpg"));
  //   drawerItemModel.add(DrawerItemModel("My Orders",
  //       "https://www.pngitem.com/pimgs/m/280-2801487_track-my-order-png-transparent-png.png"));
  //   drawerItemModel.add(DrawerItemModel("My Rewards",
  //       "https://media-dmg.assets-cdk.com/websites/content/b3803124ac014a769a5272715ebe3f60_871x186.PNG"));
  //   drawerItemModel.add(DrawerItemModel("My Cart",
  //       "https://www.vhv.rs/dpng/d/567-5678810_big-sale-market-my-cart-logo-png-transparent.png"));
  //   drawerItemModel.add(DrawerItemModel("My Wishlist",
  //       "https://www.pinclipart.com/picdir/middle/573-5732586_red-wishlist-icon-png-clipart.png"));
  //   drawerItemModel.add(DrawerItemModel("My Account",
  //       "https://icon-library.com/images/my-account-icon-png/my-account-icon-png-15.jpg"));
  //   // drawerItemModel.add(DrawerItemModel("Notification Preferences",
  //   //     'https://banner2.cleanpng.com/20191013/tat/transparent-ui-icon-notification-icon-bell-icon-5da3d1f3d32951.3009239215710172038649.jpg'));
  //   // drawerItemModel.add(DrawerItemModel("Gift Card",
  //   //     "https://cdn.iconscout.com/icon/free/png-256/gift-card-1817226-1538096.png"));

  //   // drawerItemModel.add(DrawerItemModel("Help Centre",
  //   //     'https://png.pngtree.com/element_our/20190528/ourmid/pngtree-cartoon-female-customer-service-professional-female-png-free-material-image_1133464.jpg'));
  //   // drawerItemModel.add(DrawerItemModel("Legal",
  //   //     'https://e7.pngegg.com/pngimages/340/45/png-clipart-judge-hammer-legal-court.png'));
  // }

  // buildItem(BuildContext context, int index) {
  //   if (drawerItemModel[index].imageRes != null) {
  //     return GestureDetector(
  //       onTap: () {
  //         // Update the state of the app
  //         // ...
  //         // Then close the drawer
  //         // Navigator.pop(context);
  //         print(index);
  //         if (index == 10) {
  //           // Navigator.push(
  //           //   context,
  //           //   MaterialPageRoute(builder: (context) => OdersPage()),
  //           // );
  //         } else if (index == 11) {
  //           // Navigator.push(
  //           //   context,
  //           //   MaterialPageRoute(builder: (context) => MyRewards()),
  //           // );
  //         } else if (index == 12) {
  //           // Navigator.push(
  //           //   context,
  //           //   MaterialPageRoute(builder: (context) => Cart()),
  //           // );
  //         } else if (index == 14 || index == 0) {
  //           // Navigator.push(
  //           //   context,
  //           //   MaterialPageRoute(builder: (context) => MyAccount()),
  //           // );
  //         } else if (index == 15) {
  //           // Navigator.push(
  //           //   context,
  //           //   MaterialPageRoute(builder: (context) => NotificationScreen()),
  //           // );
  //         } else {
  //           // Navigator.push(
  //           //   context,
  //           //   MaterialPageRoute(builder: (context) => Home()),
  //           // );
  //         }
  //       },
  //       child: Column(
  //         children: <Widget>[
  //           Padding(
  //             padding: const EdgeInsets.only(bottom: 10, top: 10),
  //             child: Row(
  //               children: <Widget>[
  //                 Expanded(
  //                   flex: 2,
  //                   child: Image.network(
  //                     drawerItemModel[index].imageRes,
  //                     height: 23,
  //                     width: 23,
  //                   ),
  //                 ),
  //                 Expanded(
  //                   flex: 10,
  //                   child: Text(
  //                     drawerItemModel[index].name,
  //                     style: TextStyle(fontSize: 15),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           index == 0 || index == 8 || index == 10 || index == 15
  //               ? Container(
  //                   color: Colors.grey,
  //                   height: 1,
  //                 )
  //               : SizedBox(
  //                   height: 0,
  //                 ),
  //           index == 1 ||
  //                   index == 2 ||
  //                   index == 3 ||
  //                   index == 5 ||
  //                   index == 4 ||
  //                   index == 6 ||
  //                   index == 7 ||
  //                   index == 9 ||
  //                   index == 11 ||
  //                   index == 12 ||
  //                   index == 13 ||
  //                   index == 14
  //               ? Container(
  //                   color: Colors.grey,
  //                   height: 0.1,
  //                 )
  //               : SizedBox(
  //                   height: 0,
  //                 )
  //         ],
  //       ),
  //     );
  //   } else {
  //     return Padding(
  //       padding: const EdgeInsets.only(bottom: 10, top: 10, left: 20),
  //       child: Text(
  //         drawerItemModel[index].name,
  //         style: TextStyle(fontSize: 15),
  //       ),
  //     );
  //   }
  // }
  AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: Colors.brown,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 1,
          ),
          // if (localStorage != null)
          //   {
          //..............only after login..................
          isLoggedInSuccessfully != false
              ? Card(
                  child: UserAccountsDrawerHeader(
                    accountName: Text(
                      "Ashish Bhomia",
                      style: TextStyle(color: Colors.black),
                    ),
                    accountEmail: Text(
                      "aashish.bhomia@gmail.com",
                      style: TextStyle(color: Colors.black),
                    ),
                    onDetailsPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Account_Screen()));
                    },
                    decoration: BoxDecoration(
                      // backgroundBlendMode: BlendMode.difference,
                      color: Colors.white30,

                      /* image:  DecorationImage(
                   //   image:  ExactAssetImage('assets/images/lake.jpeg'),
                      fit: BoxFit.cover,
                    ),*/
                    ),
                    currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage("assets/user.jpeg")),
                  ),
                )
              : Card(),
          isLoggedInSuccessfully != false
              ? Card(
                  elevation: 4.0,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                          leading: Icon(Icons.favorite),
                          title: Text("Wish List"),
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Item_Screen(
                            //               toolbarname: name,
                            //             )));
                          }),
                      Divider(
                        color: Colors.brown,
                      ),
                      ListTile(
                          leading: Icon(Icons.history),
                          title: Text("Order History "),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Oder_History(
                                          toolbarname: ' Order History',
                                        )));
                          }),
                    ],
                  ),
                )
              : Card(),
          // },
          Card(
            elevation: 4.0,
            child: Column(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Setting"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Setting_Screen(
                                    toolbarname: 'Setting',
                                  )));
                    }),
                Divider(
                  color: Colors.brown,
                ),
                ListTile(
                    leading: Icon(Icons.help),
                    title: Text("Help"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Help_Screen(
                                    toolbarname: 'Help',
                                  )));
                    }),
                // Divider(
                //   color: Colors.brown,
                // ),
                // ListTile(
                //     leading: Icon(Icons.book),
                //     title: Text("About"),
                //     onTap: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => Help_Screen(
                //                     toolbarname: 'Help',
                //                   )));
                //     }),
              ],
            ),
          ),
          Card(
            elevation: 4.0,
            child: Column(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.assignment),
                    title: Text("Terms Use"),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Item_Screen(
                      //               toolbarname: name,
                      //             )));
                    }),
                Divider(
                  color: Colors.brown,
                ),
                ListTile(
                    leading: Icon(Icons.lock_open_outlined),
                    title: Text("Privacy Policy "),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Oder_History(
                                    toolbarname: ' Privacy Policy',
                                  )));
                    }),
              ],
            ),
          ),
          //..............only after login..................
          isLoggedInSuccessfully != false
              ? Card(
                  elevation: 4.0,
                  child: ListTile(
                      leading: Icon(Icons.power_settings_new),
                      title: Text(
                        "Logout",
                        style:
                            TextStyle(color: Colors.redAccent, fontSize: 17.0),
                      ),
                      onTap: () async {
                        // localStorage.clear();
                        //   context.read<AuthenticationService>().signOut();
                        //   Navigator.of(context).pushNamedAndRemoveUntil(
                        //       '/', (Route<dynamic> route) => false);
                        //   // Navigator.pushReplacement(
                        //   //     context,
                        //   //     MaterialPageRoute(builder: (context) => LoginPage()
                        //   //         // Login_Screen()
                        //   //         ));
                        await authClass.signOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (builder) => MyApp()),
                            (route) => false);
                      }),
                )
              :

              //..............only before login..................
              Card(
                  elevation: 5.0,
                  color: Colors.red,
                  child: ListTile(
                      leading: Icon(Icons.power_settings_new),
                      title: Text(
                        "LogIn",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()
                                // Login_Screen()
                                ));
                      }),
                )
        ],
      ),
    ));
  }
}

class DrawerItemModel {
  String _name;
  String _imageRes;

  DrawerItemModel(this._name, this._imageRes);

  String get imageRes => _imageRes;

  String get name => _name;
}
