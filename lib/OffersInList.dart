import 'package:bakery/rest_api.dart';
import 'package:flutter/material.dart';

class Secondlist extends StatefulWidget {
  @override
  _SecondlistState createState() => _SecondlistState();
}

class _SecondlistState extends State<Secondlist> {
  // var name = [
  //   "https://bhomiasoft.com/bakery_images/banner_images/banner_three.png",
  //   "https://bhomiasoft.com/bakery_images/banner_images/banner_four.png",
  //   "https://bhomiasoft.com/bakery_images/banner_images/banner_three.png",
  //   "https://bhomiasoft.com/bakery_images/banner_images/banner_four.png",
  //   "https://bhomiasoft.com/bakery_images/banner_images/banner_one.png",
  //   "https://bhomiasoft.com/bakery_images/banner_images/banner_three.png",
  //   "https://bhomiasoft.com/bakery_images/banner_images/banner_four.png",
  //   "https://bhomiasoft.com/bakery_images/banner_images/banner_four.png",
  // ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // future: ApiService.get_banner(),
        builder: (context, snapshot) {
      final banners = snapshot.data;
      return Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          child: ListView.builder(
            itemCount: banners.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      banners[index]['banner_image'],
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
