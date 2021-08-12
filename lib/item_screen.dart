// import 'package:bakery/Cart.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as rangeSlider;
import 'package:shared_preferences/shared_preferences.dart';

import 'Cart_Screen.dart';
// import 'item_details.dart';

SharedPreferences cartItem;

class Item_Screen extends StatefulWidget {
  final String toolbarname;

  Item_Screen({Key key, this.toolbarname}) : super(key: key);

  @override
  State<StatefulWidget> createState() => item(toolbarname);
}

class Item {
  final String itemname;
  final String imagename;
  final String itmprice;

  Item({this.itemname, this.imagename, this.itmprice});
}

class item extends State<Item_Screen> {
  List list = ['17', '11'];
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;
  VoidCallback _showBottomSheetCallback;
  List<Item> itemList = <Item>[
    Item(imagename: 'images/apple.jpg', itemname: 'Samosa', itmprice: '\₹ 10'),
    Item(
        imagename: 'images/tomato.jpg',
        itemname: 'Choclate Cake',
        itmprice: '\₹ 15'),
    Item(
        imagename: 'images/lemons.jpg',
        itemname: 'Panner Tikka',
        itmprice: '\₹ 25'),
    Item(
        imagename: 'images/kiwi.jpg',
        itemname: 'Veg. Moomos',
        itmprice: '\₹ 10'),
    Item(
        imagename: 'images/guava.jpg',
        itemname: 'Onion Tomato Pizza',
        itmprice: '\₹ 15'),
    Item(
        imagename: 'images/grapes.jpg',
        itemname: 'Manchurian',
        itmprice: '\₹ 25'),
    Item(
        imagename: 'images/pineapple.jpg',
        itemname: 'Grill Sandwich',
        itmprice: '\₹ 18'),
    Item(
        imagename: 'images/lemons.jpg',
        itemname: 'Panner Tikka',
        itmprice: '\₹ 25'),
    Item(
        imagename: 'images/tomato.jpg',
        itemname: 'Pine Apple Cake',
        itmprice: '\₹ 15'),
    Item(
        imagename: 'images/kiwi.jpg',
        itemname: 'Veg. Moomos',
        itmprice: '\₹ 10'),
    Item(
        imagename: 'images/apple.jpg',
        itemname: 'Samosa Chaat',
        itmprice: '\₹ 10'),
    Item(
        imagename: 'images/grapes.jpg',
        itemname: 'Chicken Moomos',
        itmprice: '\₹ 25'),
    Item(
        imagename: 'images/tomato.jpg',
        itemname: 'Choclate Cake',
        itmprice: '\₹ 15'),
  ];
  //////////for searchbar////////////////////
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;

  List<Item> items = [];
  String query = '';
  Timer debouncer;

  @override
  void initState() {
    super.initState();
    // init();
    items = itemList;
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer.cancel();
    }
    debouncer = Timer(duration, callback);
  }

  // Future init() async {
  //   final items = await ApiService.getEmployees(query);
  //   setState(() => this.items = items);
  // }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search Data...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: searchBook,
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return
        // IconButton(
        //   icon: const Icon(Icons.search),
        //   onPressed: _startSearch,
        // ),
        <Widget>[
      IconButton(
        tooltip: 'Search',
        icon: const Icon(Icons.search),
        onPressed: () async {
          // final int selected = await showSearch<int>(
          //   context: context,
          //   // delegate: _delegate,
          // );
          _startSearch();
        },
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 150.0,
          width: 30.0,
          child: GestureDetector(
            onTap: () {},
            child: Stack(
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Cart_screen()));
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
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
    });
  }

  void searchBook(String query) {
    final items = itemList.where((item) {
      final titleLower = item.itemname.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.items = items;
    });
  }

  Widget buildBook(Item item) => ListTile(
        leading: Image.network(
          item.imagename,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(item.itemname),
      );

  // String toolbarname = 'Fruiys & Vegetables';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String toolbarname;

  item(this.toolbarname);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: _isSearching
            ? const BackButton()
            : IconButton(
                icon: Icon(_backIcon()),
                alignment: Alignment.centerLeft,
                tooltip: 'Back',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
        title: _isSearching ? _buildSearchField() : Text(toolbarname),
        backgroundColor: Colors.brown, actions: _buildActions(),
        // actions: <Widget>[
        //   IconButton(
        //     tooltip: 'Search',
        //     icon: const Icon(Icons.search),
        //     onPressed: () async {
        //       final int selected = await showSearch<int>(
        //         context: context,
        //         // delegate: _delegate,
        //       );
        //     },
        //   ),
        //   // IconButton(
        //   //     tooltip: 'Sort',
        //   //     icon: const Icon(Icons.filter_list),
        //   //     onPressed: () {
        //   //       _showBottomSheet();
        //   //     }),
        //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Container(
        //       height: 150.0,
        //       width: 30.0,
        //       child: GestureDetector(
        //         onTap: () {
        //           /*Navigator.of(context).push(
        //            MaterialPageRoute(
        //               builder:(BuildContext context) =>
        //                CartItemsScreen()
        //           )
        //       );*/
        //         },
        //         child: Stack(
        //           children: <Widget>[
        //             IconButton(
        //                 icon: Icon(
        //                   Icons.shopping_cart,
        //                   color: Colors.white,
        //                 ),
        //                 onPressed: () {
        //                   Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => Cart_screen()));
        //                 }),
        //             list.length == 0
        //                 ? Container()
        //                 : Positioned(
        //                     child: Stack(
        //                     children: <Widget>[
        //                       Icon(Icons.brightness_1,
        //                           size: 20.0, color: Colors.orange.shade500),
        //                       Positioned(
        //                           top: 4.0,
        //                           right: 5.5,
        //                           child: Center(
        //                             child: Text(
        //                               list.length.toString(),
        //                               style: TextStyle(
        //                                   color: Colors.white,
        //                                   fontSize: 11.0,
        //                                   fontWeight: FontWeight.w500),
        //                             ),
        //                           )),
        //                     ],
        //                   )),
        //           ],
        //         ),
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            // height: 500.0,
            child: Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (1.3 / 2),
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(0.0),
                children: itemList.map((Item photo) {
                  return TravelDestinationItem(
                    destination: photo,
                  );
                  // return buildBook(item);
                }).toList(),
              ),
              ////////////////////////working with searchbar///////////

              // child: ListView.builder(
              //   itemCount: items.length,
              //   itemBuilder: (context, index) {
              //     final item = items[index];
              //     return buildBook(item);
              //   },
              // ),
            ),
          )
        ],
      ),

      /* return  GestureDetector(

                  onTap: (){},
                  child: Container(
                    height: 360.0,
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                       // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                           Container(

                         child: SizedBox(
                        height: 184.0,
                           child:Image.asset(
                                    itemList[index].imagename,
                                    fit: BoxFit.contain,
                                  ),
                          ),
                          ),
                           Container(

                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(itemList[index].itemname,style: TextStyle(color: Colors.black87,fontSize: 17.0,fontWeight: FontWeight.bold),),
                                Text(itemList[index].itemname,style: TextStyle(color: Colors.black38,fontSize: 17.0),)
                              ],
                            ),
                          )


                          // description and share/explore buttons

                        ],

                      ),

                    ),
                  ),
                );*/
    );
  }

  _verticalDivider() => Container(
        padding: EdgeInsets.all(0.0),
      );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
      );

  bool a = true;
  String mText = "Press to hide";
  double _lowerValue = 1.0;
  double _upperValue = 100.0;

  void _visibilitymethod() {
    setState(() {
      if (a) {
        a = false;
        mText = "Press to show";
      } else {
        a = true;
        mText = "Press to hide";
      }
    });
  }

  List<RangeSliderData> rangeSliders;
  List<Widget> _buildRangeSliders() {
    List<Widget> children = <Widget>[];
    for (int index = 0; index < rangeSliders.length; index++) {
      children
          .add(rangeSliders[index].build(context, (double lower, double upper) {
        // adapt the RangeSlider lowerValue and upperValue
        setState(() {
          rangeSliders[index].lowerValue = lower;
          rangeSliders[index].upperValue = upper;
        });
      }));
      // Add an extra padding at the bottom of each RangeSlider
      children.add(SizedBox(height: 8.0));
    }

    return children;
  }

  void _showBottomSheet() {
    setState(() {
      // disable the button
      _showBottomSheetCallback = null;
    });
    _scaffoldKey.currentState
        .showBottomSheet<Null>((BuildContext context) {
          final ThemeData themeData = Theme.of(context);
          return Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(color: themeData.disabledColor))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        'FILTER/SORTING',
                        style: TextStyle(fontSize: 12.0, color: Colors.black26),
                      ),
                      _verticalD(),
                      OutlineButton(
                          borderSide: BorderSide(color: Colors.amber.shade500),
                          child: const Text('CLEAR'),
                          textColor: Colors.amber.shade500,
                          onPressed: () {},
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                      _verticalD(),
                      OutlineButton(
                          borderSide: BorderSide(color: Colors.amber.shade500),
                          child: const Text('APPLY'),
                          textColor: Colors.amber.shade500,
                          onPressed: () {},
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                    ],
                  ),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Sort',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                  Container(
                      height: 115.0,
                      margin: EdgeInsets.only(left: 7.0, top: 5.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            child: Card(
                              elevation: 3.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'LOWEST',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'PRICE',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'FIRST',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
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
                            child: Card(
                              elevation: 3.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'HEGHEST',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'PRICE',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'FIRST',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
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
                            child: Card(
                              elevation: 3.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'POPULER',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'PRICE',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'FIRST',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
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
                            child: Card(
                              elevation: 3.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'EST',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'PRICE',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'FIRST',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
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
                            child: Card(
                              elevation: 3.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'BEST',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'PRICE',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'FIRST',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
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
                      )),
                  _verticalDivider(),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Filter',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      _verticalDivider(),
                      Text(
                        'PRICE',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),

                  /*  Container(
          padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
          child:  Column(
              children: <Widget>[]
                ..add(
                  //
                  // Simple example
                  //
                   RangeSlider(
                    min: 0.0,
                    max: 100.0,
                    lowerValue: _lowerValue,
                    upperValue: _upperValue,
                    divisions: 5,
                    showValueIndicator: true,
                    valueIndicatorMaxDecimals: 1,
                    onChanged: (double LowerValue, double UpperValue) {
                      setState(() {
                        _lowerValue = LowerValue;
                        _upperValue = UpperValue;
                      });
                    },
                    onChangeStart:
                        (double startLowerValue, double startUpperValue) {
                      print(
                          'Started with values: $startLowerValue and $startUpperValue');
                    },
                    onChangeEnd: (double LowerValue, double UpperValue) {
                      print(
                          'Ended with values: $LowerValue and $UpperValue');
                    },
                  ),
                )
              // Add some space
                ..add(
                   SizedBox(height: 24.0),
                )
              //
              // Add a series of RangeSliders, built as regular Widgets
              // each one having some specific customizations
              //
                ..addAll(_buildRangeSliders())),
        ),*/

                  _verticalDivider(),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _verticalDivider(),
                      Text(
                        'SELECT OFFER',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                  Container(
                      height: 80.0,
                      margin: EdgeInsets.only(left: 7.0, top: 5.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            height: 80.0,
                            width: 120.0,
                            child: Card(
                              color: Colors.pink.shade100,
                              elevation: 3.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        color: Colors.pink.shade100,
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Buy More,',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'Save More',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
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
                            height: 80.0,
                            width: 120.0,
                            child: Card(
                              color: Colors.indigo.shade500,
                              elevation: 3.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Special,',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'Price',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
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
                            height: 80.0,
                            width: 120.0,
                            child: Card(
                              color: Colors.teal.shade200,
                              elevation: 3.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Item of,',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'The Day',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
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
                            height: 80.0,
                            width: 120.0,
                            child: Card(
                              color: Colors.yellow.shade100,
                              elevation: 3.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Buy 1,,',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'GET 1 FREE',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
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
                      )),
                  _verticalDivider(),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _verticalDivider(),
                      Text(
                        'DISCOUNT',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                  Container(
                      height: 90.0,
                      margin: EdgeInsets.only(left: 7.0, top: 5.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            height: 80.0,
                            child: Card(
                              color: Colors.white,
                              elevation: 3.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '10%',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'OR LESS',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
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
                            height: 80.0,
                            child: Card(
                              color: Colors.white,
                              elevation: 3.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '20%',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'OR LESS',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
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
                            height: 80.0,
                            child: Card(
                              color: Colors.white,
                              elevation: 3.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '30%',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'OR LESS',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
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
                            height: 80.0,
                            child: Card(
                              color: Colors.white,
                              elevation: 3.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '40%',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            _verticalDivider(),
                                            Text(
                                              'OR LESS',
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.5),
                                            ),
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
                      )),
                  _verticalDivider(),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _verticalDivider(),
                      Text(
                        'AVAILIBILITY',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                  _verticalDivider(),
                  Container(
                      child: Align(
                          alignment: const Alignment(0.0, -0.2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              _verticalDivider(),
                              Radio<int>(
                                  value: 0,
                                  groupValue: radioValue,
                                  onChanged: handleRadioValueChanged),
                              Text(
                                'Available for this location',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ))),
                ]),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              // re-enable the button
              _showBottomSheetCallback = _showBottomSheet;
            });
          }
        });
  }

  int radioValue = 0;
  bool switchValue = false;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }
}

List itemSelectedForCart = ['to initiallize'];

class TravelDestinationItem extends StatelessWidget {
  TravelDestinationItem({Key key, @required this.destination, this.shape})
      : assert(destination != null),
        super(key: key);

  static const double height = 115.0;
  final Item destination;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return SafeArea(
        top: true,
        bottom: true,
        child: Container(
            padding: const EdgeInsets.all(4.0),
            height: height,
            child: GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Item_Details()));
              },
              child: Card(
                shape: shape,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // photo and title
                    SizedBox(
                      height: 220.0,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                destination.imagename,
                                width: 110.0,
                                height: 120.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.all(5.0),
                            child: ButtonTheme(
                              minWidth: 15.0,
                              child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0))),
                                  color: Color(0xFFD20E0E),
                                  focusColor: Colors.red,
                                  child: Text(destination.itmprice,
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    print("RaisedButton clicked");
                                  }),
                            ),
                          ),
                          //--------------adding item to cart from here ---------------
                          Container(
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.all(5.0),
                            child: ButtonTheme(
                              minWidth: 15.0,
                              child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0))),
                                  // color: Color(0xFFD20E0E),
                                  color: Colors.white,
                                  focusColor: Colors.red,
                                  // child: Text(destination.itmprice,
                                  //     style: TextStyle(color: Colors.white)),

                                  child: IconButton(
                                    icon: Icon(Icons.add_shopping_cart),
                                    color: Colors.pinkAccent,
                                  ),
                                  onPressed: () async {
                                    cartItem =
                                        await SharedPreferences.getInstance();
                                    var quantity = '1';

                                    if (itemSelectedForCart
                                        .contains(destination.itemname)) {
                                      print(itemSelectedForCart);
                                      Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Item already in Cart'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    } else {
                                      print(itemSelectedForCart);
                                      itemSelectedForCart
                                          .add(cartItem.getString('itemName'));
                                      saveInCart(
                                        destination.imagename,
                                        destination.itmprice,
                                        destination.itemname,
                                        // quantity,
                                      );
                                      print("RaisedButton clicked");
                                      addItemInCart(
                                          destination.itemname, context);
                                      Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Item added to Cart'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    Divider(
                      color: Colors.brown,
                    ),
                    Center(
                      child: Text(
                        destination.itemname,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    // share, explore buttons
                    // Container(
                    //   alignment: Alignment.center,
                    //   child: OutlineButton(
                    //       borderSide: BorderSide(color: Colors.amber.shade500),
                    //       child: const Text('Add'),
                    //       textColor: Colors.amber.shade500,
                    //       onPressed: () {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => Item_Details()));
                    //       },
                    //       shape: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(30.0),
                    //       )),
                    // ),
                  ],
                ),
              ),
            )));
  }

  /* List<RangeSliderData> _rangeSliderDefinitions() {
    return <RangeSliderData>[
      RangeSliderData(
          min: 0.0, max: 100.0, lowerValue: 10.0, upperValue: 100.0),
      RangeSliderData(
          min: 0.0,
          max: 100.0,
          lowerValue: 25.0,
          upperValue: 75.0,
          divisions: 20,
          overlayColor: Colors.red[100]),
      RangeSliderData(
          min: 0.0,
          max: 100.0,
          lowerValue: 10.0,
          upperValue: 30.0,
          showValueIndicator: false,
          valueIndicatorMaxDecimals: 0),
      RangeSliderData(
          min: 0.0,
          max: 100.0,
          lowerValue: 10.0,
          upperValue: 30.0,
          showValueIndicator: true,
          valueIndicatorMaxDecimals: 0,
          activeTrackColor: Colors.red,
          inactiveTrackColor: Colors.red[50],
          valueIndicatorColor: Colors.green),
      RangeSliderData(
          min: 0.0,
          max: 100.0,
          lowerValue: 25.0,
          upperValue: 75.0,
          divisions: 20,
          thumbColor: Colors.grey,
          valueIndicatorColor: Colors.grey),
    ];
  }*/
}

// ---------------------------------------------------
// Helper class aimed at simplifying the way to
// automate the creation of a series of RangeSliders,
// based on various parameters
//
// This class is to be used to demonstrate the appearance
// customization of the RangeSliders
// ---------------------------------------------------
class RangeSliderData {
  double min;
  double max;
  double lowerValue;
  double upperValue;
  int divisions;
  bool showValueIndicator;
  int valueIndicatorMaxDecimals;
  bool forceValueIndicator;
  Color overlayColor;
  Color activeTrackColor;
  Color inactiveTrackColor;
  Color thumbColor;
  Color valueIndicatorColor;
  Color activeTickMarkColor;

  static const Color defaultActiveTrackColor = const Color(0xFF0175c2);
  static const Color defaultInactiveTrackColor = const Color(0x3d0175c2);
  static const Color defaultActiveTickMarkColor = const Color(0x8a0175c2);
  static const Color defaultThumbColor = const Color(0xFF0175c2);
  static const Color defaultValueIndicatorColor = const Color(0xFF0175c2);
  static const Color defaultOverlayColor = const Color(0x290175c2);

  RangeSliderData({
    this.min,
    this.max,
    this.lowerValue,
    this.upperValue,
    this.divisions,
    this.showValueIndicator: true,
    this.valueIndicatorMaxDecimals: 1,
    this.forceValueIndicator: false,
    this.overlayColor: defaultOverlayColor,
    this.activeTrackColor: defaultActiveTrackColor,
    this.inactiveTrackColor: defaultInactiveTrackColor,
    this.thumbColor: defaultThumbColor,
    this.valueIndicatorColor: defaultValueIndicatorColor,
    this.activeTickMarkColor: defaultActiveTickMarkColor,
  });

  // Returns the values in text format, with the number
  // of decimals, limited to the valueIndicatedMaxDecimals
  //
  String get lowerValueText =>
      lowerValue.toStringAsFixed(valueIndicatorMaxDecimals);
  String get upperValueText =>
      upperValue.toStringAsFixed(valueIndicatorMaxDecimals);

  // Builds a RangeSlider and customizes the theme
  // based on parameters
  //
  Widget build(BuildContext context, rangeSlider.RangeSliderCallback callback) {
    return Container(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              minWidth: 40.0,
              maxWidth: 40.0,
            ),
            child: Text(lowerValueText),
          ),
          Expanded(
            child: SliderTheme(
              // Customization of the SliderTheme
              // based on individual definitions
              // (see rangeSliders in _RangeSliderSampleState)
              data: SliderTheme.of(context).copyWith(
                overlayColor: overlayColor,
                activeTickMarkColor: activeTickMarkColor,
                activeTrackColor: activeTrackColor,
                inactiveTrackColor: inactiveTrackColor,
                thumbColor: thumbColor,
                valueIndicatorColor: valueIndicatorColor,
                showValueIndicator: showValueIndicator
                    ? ShowValueIndicator.always
                    : ShowValueIndicator.onlyForDiscrete,
              ),
              child: rangeSlider.RangeSlider(
                min: min,
                max: max,
                lowerValue: lowerValue,
                upperValue: upperValue,
                divisions: divisions,
                showValueIndicator: showValueIndicator,
                valueIndicatorMaxDecimals: valueIndicatorMaxDecimals,
                onChanged: (double lower, double upper) {
                  // call
                  callback(lower, upper);
                },
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minWidth: 40.0,
              maxWidth: 40.0,
            ),
            child: Text(upperValueText),
          ),
        ],
      ),
    );
  }
}

saveInCart(
  String itemImage,
  String itemPrice,
  String itemName,
) async {
  cartItem.setString('itemName', itemName);
  cartItem.setString('itemImage', itemImage);
  cartItem.setString('itemPrice', itemPrice);
  // cartItem.setString('qauntity', quantity);
  // cartItem.setString('Password', passwordController.text.toString());
}
