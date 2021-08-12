import 'package:flutter/material.dart';

import 'item_screen.dart';

class SimilarItems extends StatefulWidget {
  @override
  _SimilarItemsState createState() => _SimilarItemsState();
}

class _SimilarItemsState extends State<SimilarItems> {
  var name = [
    "assets/toys_and_babby.png",
    "assets/cacique_positve.png",
    "assets/applinces.png",
    "assets/beauty.png",
    "assets/electronic.png",
    "assets/fashion.png",
    "assets/grocery.png",
    "assets/mobiles.png",
    "assets/sports_and_more.png",
    // "assets/shui-jing-fang-positive.png"
  ];
  var title = [
    "Bread",
    "Cakes",
    "Bun",
    "Pastries",
    "Biscuits",
    "Cookies",
    "Doughnuts",
    "Crackers",
    "Pizza",
    // "XXXXXXXXXXXXXXX"
  ];
  buildItem(BuildContext context, int index) {
    print(index);
    return GestureDetector(
      // onTap: () => Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Home())),

      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Item_Screen(toolbarname: title[index]))),
      // ){},
      child: Column(
        children: [
          Container(
            // color: Colors.cyan,
            width: 200,
            height: 220,
            child: Column(
              children: [
                Container(
                  // color: Colors.red,
                  child: Image.asset(
                    name[index],
                    height: 180,
                    width: 200,
                  ),
                ),
                Expanded(
                  child: Text(
                    title[index],
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 250,
      child: ListView.builder(
        itemCount: 9,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return buildItem(context, index);
        },
      ),
    );
  }
}
