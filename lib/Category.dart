import 'package:bakery/Home.dart';
import 'package:bakery/item_details.dart';
import 'package:bakery/item_screen.dart';
import 'package:bakery/rest_api.dart';
import 'package:flutter/material.dart';

import 'item_list.dart';

class Firstlist extends StatefulWidget {
  @override
  _FirstlistState createState() => _FirstlistState();
}

class _FirstlistState extends State<Firstlist> {
  // var name = [
  //   "assets/toys_and_babby.png",
  //   "assets/cacique_positve.png",
  //   "assets/applinces.png",
  //   "assets/beauty.png",
  //   "assets/electronic.png",
  //   "assets/fashion.png",
  //   "assets/grocery.png",
  //   "assets/mobiles.png",
  //   "assets/sports_and_more.png",
  //   // "assets/shui-jing-fang-positive.png"
  // ];
  // var title = [
  //   "Bread",
  //   "Cakes",
  //   "Bun",
  //   "Pastries",
  //   "Biscuits",
  //   "Cookies",
  //   "Doughnuts",
  //   "Crackers",
  //   "Pizza",
  //   // "XXXXXXXXXXXXXXX"
  // ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: ApiService.getCategory_list(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final prod_category = snapshot.data;
          return Container(
              height: 70,
              child: ListView.builder(
                itemCount: prod_category.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // onTap: () => Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => Home())),

                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Item_Screen(
                                toolbarname: prod_category[index]
                                    ['product_name']))),
                    // ){},
                    child: Column(
                      children: [
                        Container(
                          // color: Colors.cyan,
                          width: 70,
                          height: 70,
                          child: Column(
                            children: [
                              Container(
                                // color: Colors.red,
                                child: Image.network(
                                  prod_category[index]['Product_image'],
                                  height: 50,
                                  width: 70,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  prod_category[index]['product_name'],
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ));
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
