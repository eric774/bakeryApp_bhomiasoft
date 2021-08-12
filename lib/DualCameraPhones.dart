import 'package:flutter/material.dart';

import 'deals.dart';
import 'dealspage.dart';
import 'item_details.dart';

class Seventhlist extends StatefulWidget {
  @override
  _SeventhlistState createState() => _SeventhlistState();
}

class _SeventhlistState extends State<Seventhlist> {
  List<deals> deal;

  @override
  void initState() {
    super.initState();
    addDealItem();
  }

  addDealItem() {
    deal = List<deals>();
    deal.add(deals("assets/phone.png", '₹ 40', 'Grill Sandwich'));
    deal.add(deals("assets/phone_two.png", '₹ 60', 'PavBhajji'));
    deal.add(deals("assets/phone_three.png", '₹ 80', 'Veg. Fry Momoos'));
    deal.add(deals("assets/nokia.png", '₹ 100', 'manchurian'));
  }

  buildItem(BuildContext context, int index) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      child: GestureDetector(
        onTap: () {
          print("Touch Value =  ${deal[index].name}");
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => Item_Details()));
        },
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 3,
              child: Image.asset(
                deal[index].imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Text(
                '${deal[index].name}',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                '${deal[index].discount}',
                style: TextStyle(color: Colors.green),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 450,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height / 1,
            color: Color(0xffF5E4D2),
          ),
          Container(
            height: size.height / 1,
            width: size.width,
            alignment: Alignment.topCenter,
            child: Image.asset("assets/banner_two.png"),
          ),
          Positioned(
            top: 15,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Evening Snacks',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DealsPage(
                                          toolbarname: "Hello",
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff2874F0)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'View All',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  width: size.width,
                ),
                Container(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                  width: size.width,
                  height: size.height / 1.75,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: GridView.builder(
                      padding: EdgeInsets.all(10),
                      shrinkWrap: true,
                      itemCount: 4,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return buildItem(context, index);
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
