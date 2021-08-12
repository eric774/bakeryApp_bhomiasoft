import 'package:bakery/dealspage.dart';
import 'package:bakery/item_details.dart';
import 'package:flutter/material.dart';
import 'Details.dart';
import 'deals.dart';
import 'item_details.dart';
import 'item_screen.dart';

class Fourthlist extends StatefulWidget {
  @override
  _FourthlistState createState() => _FourthlistState();
}

class _FourthlistState extends State<Fourthlist> {
  List<deals> deal;

  get title => null;

  @override
  void initState() {
    super.initState();
    addDealItem();
  }

  addDealItem() {
    deal = List<deals>();
    deal.add(deals("assets/female.png", 'small cheeze', 'From 99'));
    deal.add(deals("assets/watch.png", 'Butter Cake', 'Upto 70% Off'));
    deal.add(deals("assets/male_modle.png", 'Yammy Cracker', 'Starting @99'));
    deal.add(
        deals("assets/shirt_modle.png", 'Chatpati Namkeen', 'Extra 100 Off'));
  }

  buildItem(BuildContext context, int index) {
    return Container(
        height: 100,
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            print("Touch Value =  ${deal[index].name}");
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => Item_Details()));
          },
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width / 4,
                child: Image.asset(
                  deal[index].imageUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                '${deal[index].name}',
                style: TextStyle(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  '${deal[index].discount}',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 400,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height / 1,
            color: Colors.red[100],
          ),
          Container(
            height: size.height / 1,
            width: size.width,
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/banner_mid.png",
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 65,
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
                            'Deals of the Day',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                color: Colors.white,
                              ),
                              Text(
                                '19h 18m Remaining',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )
                            ],
                          )
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
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('View All'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  width: size.width,
                ),
                Container(
                  height: size.height / 1.0,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  width: size.width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: GridView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: 4,
                      shrinkWrap: true,
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
