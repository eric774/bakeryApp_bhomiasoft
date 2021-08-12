import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:scoped_model/scoped_model.dart';

import 'ScopeManage.dart';
import 'discount_banner.dart';
import 'size_config.dart';

class Categaoty_home extends StatefulWidget {
  @override
  _Categaoty_homeState createState() => _Categaoty_homeState();
}

class _Categaoty_homeState extends State<Categaoty_home> {
  Widget GridGenerate(List<Data> data, aspectRadtio) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xff700b15), // navigation bar color
      statusBarColor: Colors.pink,

      statusBarBrightness: Brightness.light, //status bar brigtness
      statusBarIconBrightness: Brightness.light, //status barIcon Brightness
      systemNavigationBarDividerColor:
          Colors.black, //Navigation bar divider color
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: aspectRadtio),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Details(detail: data[index])));
                },
                child: Container(
                    height: 350.0,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 8.0)
                        ]),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 130.0,
                          child: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: Image.network(
                                      data[index].image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: data[index].fav
                                      ? Icon(
                                          Icons.favorite,
                                          size: 20.0,
                                          color: Colors.red,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          size: 20.0,
                                        ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "${data[index].name}",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 17.0),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new StarRating(
                                  size: 15.0,
                                  rating: data[index].rating,
                                  color: Colors.orange,
                                  borderColor: Colors.grey,
                                  starCount: 5),
                              Padding(
                                padding: EdgeInsets.only(right: 2.0),
                                child: Text(
                                  "\₹${data[index].price.toString()}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ));
        },
        itemCount: data.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        elevation: 0.0,
        actions: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: InkResponse(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Cart()));
                  },
                  child: Icon(Icons.shopping_cart),
                ),
              ),
              Positioned(
                child: ScopedModelDescendant<AppModel>(
                  builder: (context, child, model) {
                    return Container(
                      child: Text(
                        (model.cartListing.length > 0)
                            ? model.cartListing.length.toString()
                            : "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
      body: ScopedModelDescendant<AppModel>(builder: (context, child, model) {
        return GridGenerate(model.itemListing, (itemWidth / itemHeight));
      }),
    );
  }
}
