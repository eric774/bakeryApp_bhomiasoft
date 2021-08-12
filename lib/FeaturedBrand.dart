import 'package:flutter/material.dart';

class Fifthlist extends StatefulWidget {
  @override
  _FifthlistState createState() => _FifthlistState();
}

class _FifthlistState extends State<Fifthlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.0,
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 8, top: 8),
              child: Text(
                'Exclusive Offer',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 8),
              child: Text(
                'Sponsored',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Expanded(
              child: Image.asset(
                "assets/power_bank.png",
                // height: MediaQuery.of(context).size.height / 4.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            )
          ],
        ),
      ),
    );
  }
}
