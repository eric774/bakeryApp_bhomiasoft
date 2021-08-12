// import 'package:bakery/login/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'Category.dart';
import 'DealsOfTheDay.dart';
import 'Drawerfile.dart';
import 'DualCameraPhones.dart';
import 'FeaturedBrand.dart';
import 'Offers.dart';
import 'OffersInList.dart';
import 'discount_banner.dart';
import 'login/login_page.dart';
import 'size_config.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'Cart_Screen.dart';

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class BodyOTP extends StatefulWidget {
  @override
  _BodyOTPState createState() => _BodyOTPState();
}

class Photo {
  Photo({
    this.assetName,
    this.assetPackage,
    this.title,
    this.caption,
  });

  final String assetName;
  final String assetPackage;
  final String title;
  final String caption;
}

class _BodyOTPState extends State<BodyOTP> {
  List list = ['12', '11'];

  List<Photo> photos = <Photo>[
    Photo(
      assetName: 'images/veg.jpg',
      title: 'Fruits & Vegetables',
    ),
    Photo(
      assetName: 'images/frozen.jpg',
      title: 'Frozen Veg',
    ),
    Photo(
      assetName: 'images/bev.jpg',
      title: 'Beverages',
    ),
    Photo(
      assetName: 'images/brand_f.jpg',
      title: 'Brannded Food',
    ),
    Photo(
      assetName: 'images/be.jpg',
      title: 'Beauty & Personal Care',
    ),
    Photo(
      assetName: 'images/home.jpg',
      title: 'Home Care & Fashion',
    ),
    Photo(
      assetName: 'images/nonveg.jpg',
      title: 'Non Veg',
    ),
    Photo(
      assetName: 'images/eggs.jpg',
      title: 'Dairy, Bakery & Eggs',
    ),
  ];
  final List<String> items_new = ['Balbhadra', 'Maulik', 'Roshi'];
  static const double height = 366.0;
  String name = 'My Wishlist';
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.headline.copyWith(color: Colors.black54);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    ShapeBorder shapeBorder;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Transform(
          // you can forcefully translate values left side using Transform
          transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
          child: Row(
            children: [
              Container(
                child: Image.network(
                  'https://thumbs.gfycat.com/GrandThreadbareGreatargus-max-1mb.gif',
                  // height: MediaQuery.of(context).size.height / 2,
                  // width: MediaQuery.of(context).size.width / 4,
                  height: 40,
                  width: 60,
                ),
              ),
              Container(
                child: Text(
                  "Bakery Shop",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () async {
              final int selected = await showSearch<int>(
                context: context,
                //delegate: _delegate,
              );
            },
          ),
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
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          if (isLoggedInSuccessfully) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cart_screen()));
                          } else {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  new AlertDialog(
                                title: new Text("You are not Signed In yet !"),
                                content: new Text("Plase sign in first"),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: new Text("Sign In"),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => LoginPage()
                                              // Login_Screen()
                                              ));
                                    },
                                  ),
                                  new FlatButton(
                                    child: new Text("Skip > >"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          }
                        }),
                    list.length == 0
                        ? Container()
                        : Positioned(
                            child: Stack(
                            children: <Widget>[
                              Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.orange.shade500),
                              Positioned(
                                  top: 4.0,
                                  right: 5.5,
                                  child: Center(
                                    child: Text(
                                      list.length.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ],
                          )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Drawerfile(),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                  // mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _verticalD(),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Item_Screen(
                        //               toolbarname: 'Fruits & Vegetables',
                        //             )));
                      },
                      child: Text(
                        'Best value',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // _verticalD(),
                    // GestureDetector(
                    //   onTap: () {
                    //     // Navigator.push(
                    //     //     context,
                    //     //     MaterialPageRoute(
                    //     //         builder: (context) => Item_Screen(
                    //     //               toolbarname: 'Fruits & Vegetables',
                    //     //             )));
                    //   },
                    //   child: Text(
                    //     'Top sellers',
                    //     style: TextStyle(
                    //         fontSize: 20.0,
                    //         color: Colors.black26,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // _verticalD(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: <Widget>[
                    //     GestureDetector(
                    //       onTap: () {
                    //         // Navigator.push(
                    //         //     context,
                    //         //     MaterialPageRoute(
                    //         //         builder: (context) => Item_Screen(
                    //         //               toolbarname: 'Fruits & Vegetables',
                    //         //             )));
                    //       },
                    //       child: Text(
                    //         'All',
                    //         style: TextStyle(
                    //             fontSize: 20.0,
                    //             color: Colors.black26,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //     _verticalD(),
                    //     IconButton(
                    //       icon: keyloch,
                    //       color: Colors.black26,
                    //     )
                    //  ],
                    // )
                  ]),
              Container(
                  height: 349.0,
                  margin: EdgeInsets.only(left: 5.0),
                  child: Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Secondlist(),
                        SizedBox(
                          height: 20,
                        ),
                        _verticalD(),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Item_Screen(
                            //               toolbarname: 'Fruits & Vegetables',
                            //             )));
                          },
                          child: Row(
                            children: [
                              Text(
                                'Categories',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Firstlist(),
                      ],
                    ),
                  )

                  // child:
                  //     ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                  //   SafeArea(
                  //     top: true,
                  //     bottom: true,
                  //     child: Container(
                  //       width: 270.0,

                  //       child: Card(
                  //         shape: shapeBorder,
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: <Widget>[
                  //             SizedBox(
                  //               height: 180.0,
                  //               child: Stack(
                  //                 children: <Widget>[
                  //                   Positioned.fill(
                  //                     child: Image.asset(
                  //                       'images/grthre.jpg',
                  //                       fit: BoxFit.cover,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             )

                  //             /*Positioned(
                  //             bottom: 16.0,
                  //             left: 16.0,
                  //             right: 16.0,
                  //             child: FittedBox(
                  //               fit: BoxFit.scaleDown,
                  //               alignment: Alignment.centerLeft,
                  //               child: Text('',
                  //                 style: titleStyle,
                  //               ),
                  //             ),
                  //           ),*/
                  //           ],
                  //         ),
                  //       ),
                  //       // description and share/explore buttons
                  //       // share, explore buttons
                  //     ),
                  //   ),
                  //   SafeArea(
                  //     top: true,
                  //     bottom: true,
                  //     child: Container(
                  //       width: 270.0,

                  //       child: Card(
                  //         shape: shapeBorder,
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: <Widget>[
                  //             SizedBox(
                  //               height: 180.0,
                  //               child: Stack(
                  //                 children: <Widget>[
                  //                   Positioned.fill(
                  //                     child: Image.asset(
                  //                       'images/grtwo.jpg',
                  //                       fit: BoxFit.cover,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             )

                  //             /*Positioned(
                  //             bottom: 16.0,
                  //             left: 16.0,
                  //             right: 16.0,
                  //             child: FittedBox(
                  //               fit: BoxFit.scaleDown,
                  //               alignment: Alignment.centerLeft,
                  //               child: Text('',
                  //                 style: titleStyle,
                  //               ),
                  //             ),
                  //           ),*/
                  //           ],
                  //         ),
                  //       ),
                  //       // description and share/explore buttons
                  //       // share, explore buttons
                  //     ),
                  //   ),
                  //   SafeArea(
                  //     top: true,
                  //     bottom: true,
                  //     child: Container(
                  //       width: 270.0,

                  //       child: Card(
                  //         shape: shapeBorder,
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: <Widget>[
                  //             SizedBox(
                  //               height: 180.0,
                  //               child: Stack(
                  //                 children: <Widget>[
                  //                   Positioned.fill(
                  //                     child: Image.asset(
                  //                       'images/groceries.jpg',
                  //                       fit: BoxFit.cover,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             )

                  //             /*Positioned(
                  //             bottom: 16.0,
                  //             left: 16.0,
                  //             right: 16.0,
                  //             child: FittedBox(
                  //               fit: BoxFit.scaleDown,
                  //               alignment: Alignment.centerLeft,
                  //               child: Text('',
                  //                 style: titleStyle,
                  //               ),
                  //             ),
                  //           ),*/
                  //           ],
                  //         ),
                  //       ),
                  //       // description and share/explore buttons
                  //       // share, explore buttons
                  //     ),
                  //   ),
                  //   SafeArea(
                  //     top: true,
                  //     bottom: true,
                  //     child: Container(
                  //       width: 270.0,

                  //       child: Card(
                  //         shape: shapeBorder,
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: <Widget>[
                  //             SizedBox(
                  //               height: 180.0,
                  //               child: Stack(
                  //                 children: <Widget>[
                  //                   Positioned.fill(
                  //                     child: Image.asset(
                  //                       'images/back.jpg',
                  //                       fit: BoxFit.cover,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             )

                  //             /*Positioned(
                  //             bottom: 16.0,
                  //             left: 16.0,
                  //             right: 16.0,
                  //             child: FittedBox(
                  //               fit: BoxFit.scaleDown,
                  //               alignment: Alignment.centerLeft,
                  //               child: Text('',
                  //                 style: titleStyle,
                  //               ),
                  //             ),
                  //           ),*/
                  //           ],
                  //         ),
                  //       ),
                  //       // description and share/explore buttons
                  //       // share, explore buttons
                  //     ),
                  //   ),
                  // ]),
                  ),
              Container(
                margin: EdgeInsets.only(top: 7.0),
                child: Row(
                    // mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // _verticalD(),
                      // GestureDetector(
                      //   onTap: () {
                      //     // Navigator.push(
                      //     //     context,
                      //     //     MaterialPageRoute(
                      //     //         builder: (context) => Item_Screen(
                      //     //               toolbarname: 'Fruits & Vegetables',
                      //     //             )));
                      //   },
                      //   child: Text(
                      //     'Fresh Cook Items',
                      //     style: TextStyle(
                      //         fontSize: 20.0,
                      //         color: Colors.black87,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      // _verticalD(),
                      // GestureDetector(
                      //   onTap: () {
                      //     // Navigator.push(
                      //     //     context,
                      //     //     MaterialPageRoute(
                      //     //         builder: (context) => Item_Screen(
                      //     //               toolbarname: 'Fruits & Vegetables',
                      //     //             )));
                      //   },
                      //   child: Text(
                      //     'Popular',
                      //     style: TextStyle(
                      //         fontSize: 20.0,
                      //         color: Colors.black26,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      // _verticalD(),
                      // Row(
                      //   children: <Widget>[
                      //     GestureDetector(
                      //       onTap: () {
                      //         // Navigator.push(
                      //         //     context,
                      //         //     MaterialPageRoute(
                      //         //         builder: (context) => Item_Screen(
                      //         //               toolbarname: 'Fruits & Vegetables',
                      //         //             )));
                      //       },
                      //       child: Text(
                      //         'Whats ',
                      //         style: TextStyle(
                      //             fontSize: 20.0,
                      //             color: Colors.black26,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //   ],
                      // )
                    ]),
              ),
              // SizedBox(height: 20,),
              // _verticalD(),
              // GestureDetector(
              //   onTap: () {
              //     // Navigator.push(
              //     //     context,
              //     //     MaterialPageRoute(
              //     //         builder: (context) => Item_Screen(
              //     //               toolbarname: 'Fruits & Vegetables',
              //     //             )));
              //   },
              //   child: Row(
              //     children: [
              //       Text(
              //         'Categories',
              //         style: TextStyle(
              //             fontSize: 20.0,
              //             color: Colors.black87,
              //             fontWeight: FontWeight.bold),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Thirdlist(),
              SizedBox(
                height: 20,
              ),
              Fourthlist(),
              Fifthlist(),
              Seventhlist(),
              // Container(
              //   alignment: Alignment.topCenter,
              //   height: 700.0,
              //   child: GridView.builder(
              //       itemCount: photos.length,
              //       primary: false,
              //       physics: NeverScrollableScrollPhysics(),
              //       padding: const EdgeInsets.all(10.0),
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 2),
              //       itemBuilder: (BuildContext context, int index) {
              //         return GestureDetector(
              //             onTap: () {
              //               // Navigator.push(
              //               //     context,
              //               //     MaterialPageRoute(
              //               //         builder: (context) => Item_Screen(
              //               //               toolbarname: 'Fruits & Vegetables',
              //               //             )));
              //             },
              //             child: Container(
              //                 margin: EdgeInsets.all(5.0),
              //                 child: Card(
              //                   shape: shapeBorder,
              //                   elevation: 3.0,
              //                   child: Container(
              //                     //  mainAxisSize: MainAxisSize.max,
              //                     child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.center,
              //                       children: <Widget>[
              //                         SizedBox(
              //                           height: 152.0,
              //                           child: Stack(
              //                             children: <Widget>[
              //                               Positioned.fill(
              //                                   child: Image.asset(
              //                                 photos[index].assetName,
              //                                 fit: BoxFit.cover,
              //                               )),
              //                               Container(
              //                                 color: Colors.black38,
              //                               ),
              //                               Container(
              //                                 //margin: EdgeInsets.only(left: 10.0),
              //                                 padding: EdgeInsets.only(
              //                                     left: 3.0, bottom: 3.0),
              //                                 alignment: Alignment.bottomLeft,
              //                                 child: GestureDetector(
              //                                   onTap: () {
              //                                     // Navigator.push(
              //                                     //     context,
              //                                     //     MaterialPageRoute(
              //                                     //         builder: (context) =>
              //                                     //             Item_Screen(
              //                                     //               toolbarname:
              //                                     //                   'Fruits & Vegetables',
              //                                     //             )));
              //                                   },
              //                                   child: Text(
              //                                     photos[index].title,
              //                                     style: TextStyle(
              //                                         fontSize: 18.0,
              //                                         color: Colors.white,
              //                                         fontWeight:
              //                                             FontWeight.bold),
              //                                   ),
              //                                 ),
              //                               ),

              //                               /*Positioned(
              //                         child: FittedBox(

              //                          fit: BoxFit.fill,
              //                           alignment: Alignment.centerLeft,
              //                           child: Text(photos[index].title,
              //                             style: TextStyle(color: Colors.black87,fontSize: 15.0),
              //                           ),

              //                       )
              //                       )*/
              //                             ],
              //                           ),
              //                         ),

              //                         //  Text(photos[index].title.toString()),
              //                       ],
              //                     ),
              //                   ),
              //                 )));
              //       }),
              // )
            ]),
          ),
        ),
      ),
    );
  }

/*
   Container(
  alignment: Alignment.topCenter,
  child: GridView.count(
  primary: true,
  crossAxisCount: 2,
  childAspectRatio: 0.80,
  children: List.generate(photos.length, (index) {
  return getStructuredGridCell(photos[index]);
  }),
  ))*/
  Icon keyloch = Icon(
    Icons.arrow_forward,
    color: Colors.black26,
  );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 5.0, right: 0.0, top: 5.0, bottom: 0.0),
      );
}
