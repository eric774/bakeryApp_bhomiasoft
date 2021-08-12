// import 'package:flutter/material.dart';
// import 'package:carousel_pro/carousel_pro.dart';
// import 'Cart_Screen.dart';
// import 'Category.dart';
// import 'checkout_screen.dart';
// import 'similar_items.dart';
// import 'package:flutter_rating/flutter_rating.dart';

// class Item_Details extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => item_details();
// }

// class item_details extends State<Item_Details> {
//   String toolbarname = 'Fruiys & Vegetables';
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   List list = ['12', '11'];

//   String itemname = 'Apple';
//   int item = 0;
//   String itemprice = '\₹ 15';

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     final ThemeData theme = Theme.of(context);
//     final TextStyle titleStyle =
//         theme.textTheme.headline.copyWith(color: Colors.white);
//     final TextStyle descriptionStyle = theme.textTheme.subhead;
//     IconData _backIcon() {
//       switch (Theme.of(context).platform) {
//         case TargetPlatform.android:
//         case TargetPlatform.fuchsia:
//           return Icons.arrow_back;
//         case TargetPlatform.iOS:
//           return Icons.arrow_back_ios;
//       }
//       assert(false);
//       return null;
//     }

//     IconData _add_icon() {
//       switch (Theme.of(context).platform) {
//         case TargetPlatform.android:
//         case TargetPlatform.fuchsia:
//           return Icons.add_circle;
//         case TargetPlatform.iOS:
//           return Icons.add_circle;
//       }
//       assert(false);
//       return null;
//     }

//     IconData _sub_icon() {
//       switch (Theme.of(context).platform) {
//         case TargetPlatform.android:
//         case TargetPlatform.fuchsia:
//           return Icons.remove_circle;
//         case TargetPlatform.iOS:
//           return Icons.remove_circle;
//       }
//       assert(false);
//       return null;
//     }

//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(_backIcon()),
//           alignment: Alignment.centerLeft,
//           tooltip: 'Back',
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(toolbarname),
//         backgroundColor: Colors.brown,
//         actions: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               height: 150.0,
//               width: 30.0,
//               child: GestureDetector(
//                 onTap: () {
//                   /*Navigator.of(context).push(
//                    MaterialPageRoute(
//                       builder:(BuildContext context) =>
//                        CartItemsScreen()
//                   )
//               );*/
//                 },
//                 child: Stack(
//                   children: <Widget>[
//                     IconButton(
//                         icon: Icon(
//                           Icons.shopping_cart,
//                           color: Colors.white,
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Checkout()));
//                         }),
//                     list.length == 0
//                         ? Container()
//                         : Positioned(
//                             child: Stack(
//                             children: <Widget>[
//                               Icon(Icons.brightness_1,
//                                   size: 20.0, color: Colors.orange.shade500),
//                               Positioned(
//                                   top: 4.0,
//                                   right: 5.5,
//                                   child: Center(
//                                     child: Text(
//                                       list.length.toString(),
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 11.0,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   )),
//                             ],
//                           )),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//           child: Container(
//         color: Colors.white,
//         height: 60,
//         width: double.maxFinite,
//         // decoration: BoxDecoration(
//         //     color: Colors.transparent,
//         //     borderRadius: BorderRadius.vertical(top: Radius.circular(0.0))),
//         child: Container(
//             margin: EdgeInsets.all(0.0),
//             child: Card(
//                 child: Container(
//                     color: Colors.brown[100],
//                     padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
//                     child: DefaultTextStyle(
//                         style: descriptionStyle,
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             // three line description
//                             Container(
//                               decoration: BoxDecoration(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(15.0))),
//                               child: Row(
//                                 children: <Widget>[
//                                   IconButton(
//                                     icon:
//                                         Icon(_add_icon(), color: Colors.brown),
//                                     onPressed: () {
//                                       item = item + 1;
//                                     },
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(left: 2.0),
//                                   ),
//                                   Text(
//                                     item.toString(),
//                                     style: descriptionStyle.copyWith(
//                                         fontSize: 20.0, color: Colors.black87),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(right: 2.0),
//                                   ),
//                                   IconButton(
//                                     icon:
//                                         Icon(_sub_icon(), color: Colors.brown),
//                                     onPressed: () {
//                                       if (item < 0) {
//                                       } else {
//                                         item = item - 1;
//                                       }
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),

//                             Padding(
//                               padding: const EdgeInsets.only(bottom: 0.0),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.all(
//                                         Radius.circular(15.0))),
//                                 alignment: Alignment.center,
//                                 child: OutlineButton(
//                                     borderSide: BorderSide(color: Colors.brown),
//                                     child: const Text(
//                                       'Buy Now',
//                                       style: TextStyle(
//                                           // fontSize: 14,
//                                           // fontWeight: FontWeight.w700,
//                                           ),
//                                     ),
//                                     textColor: Colors.grey,
//                                     onPressed: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   Cart_screen()));
//                                     },
//                                     shape: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                     )),
//                               ),
//                             ),
//                           ],
//                         ))))),
//       )),
//       body: Container(
//           color: Colors.brown,
//           padding: const EdgeInsets.all(0.0),
//           child: SingleChildScrollView(
//               child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 color: Colors.brown,
//                 child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       // photo and title
//                       SizedBox(
//                         height: 250.0,
//                         width: MediaQuery.of(context).size.width / 1.5,
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: <Widget>[
//                             Container(
//                               decoration: BoxDecoration(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(15.0)),
//                                   border: Border.all(
//                                     color: Colors.black,
//                                     width: 5,
//                                   )),
//                               child: Carousel(
//                                 images: [
//                                   AssetImage(
//                                     'images/apple.jpg',

//                                     // package: destination.assetPackage,
//                                   ),
//                                   AssetImage(
//                                     'images/tomato.jpg',
//                                     // package: destination.assetPackage,
//                                   ),
//                                   AssetImage(
//                                     'images/lemons.jpg',
//                                     // package: destination.assetPackage,
//                                   ),
//                                   AssetImage(
//                                     'images/kiwi.jpg',
//                                     // package: destination.assetPackage,
//                                   ),
//                                   AssetImage(
//                                     'images/guava.jpg',
//                                     // package: destination.assetPackage,
//                                   ),
//                                   AssetImage(
//                                     'images/grapes.jpg',
//                                     // package: destination.assetPackage,
//                                     // width: 250
//                                   ),
//                                 ],
//                                 boxFit: BoxFit.cover,
//                                 showIndicator: false,
//                                 autoplay: false,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                           padding:
//                               const EdgeInsets.fromLTRB(5.0, 16.0, 15.0, 0.0),
//                           child: DefaultTextStyle(
//                               style: descriptionStyle,
//                               child: Column(
//                                 // mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: <Widget>[
//                                   SizedBox(
//                                     height: 80,
//                                   ),
//                                   // three line description
//                                   Container(
//                                     width: 55,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(8),
//                                         color: Colors.green),
//                                     child: Center(
//                                       child: Text(
//                                         itemprice,
//                                         style: descriptionStyle.copyWith(
//                                             fontSize: 20.0,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     child: new StarRating(
//                                         size: 20.0,
//                                         rating: 4,
//                                         // rating: data[index].rating,
//                                         color: Colors.yellow,
//                                         borderColor: Colors.white,
//                                         starCount: 5),
//                                   ),
//                                 ],
//                               ))),
//                     ]),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 0.0, left: 0, right: 0),
//                 child: Container(
//                     height: 80,
//                     width: double.maxFinite,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius:
//                             BorderRadius.vertical(top: Radius.circular(50.0))),
//                     padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
//                     child: DefaultTextStyle(
//                         style: descriptionStyle,
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             // three line description
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   top: 20.0, left: 10, right: 10, bottom: 10),
//                               child: Text(
//                                 'Details',
//                                 style: descriptionStyle.copyWith(
//                                     fontSize: 20.0,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black87),
//                               ),
//                             ),
//                           ],
//                         ))),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 0.0, left: 0, right: 0),
//                 child: Container(
//                   color: Colors.white,
//                   padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0.0),
//                   child: Text(
//                       "Grocery stores also offer non-perishable foods that are packaged in bottles, boxes, and cans; some also have bakeries, butchers, delis, and fresh produce. Large grocery stores that stock significant amounts of non-food products, such as clothing and household items, are called supermarkets.",
//                       maxLines: 10,
//                       style: TextStyle(fontSize: 13.0, color: Colors.black)),
//                 ),
//               ),
//               // SizedBox(
//               //   height: 20,
//               // ),
//               Divider(
//                 height: 0.0,
//                 color: Colors.white,
//               ),
//               Container(
//                   height: 10,
//                   width: double.maxFinite,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius:
//                           BorderRadius.vertical(top: Radius.circular(0.0))),
//                   padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
//                   child: DefaultTextStyle(
//                       style: descriptionStyle,
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           // three line description
//                           Padding(
//                             padding: const EdgeInsets.only(
//                                 top: 20.0, left: 10, right: 10, bottom: 10),
//                             child: Text(
//                               '',
//                               style: descriptionStyle.copyWith(
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black87),
//                             ),
//                           ),
//                         ],
//                       ))),

//               SimilarItems(),
//             ],
//           ))),
//     );
//   }
// }
