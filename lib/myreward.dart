import 'package:flutter/material.dart';

class MyRewards extends StatefulWidget {
  @override
  _MyRewardsState createState() => _MyRewardsState();
}

class _MyRewardsState extends State<MyRewards> {
  List<Color> _backgroundColor;
  Color _iconColor;
  Color _textColor;
  List<Color> _actionContainerColor;
  Color _borderContainer;
  bool colorSwitched = true;
  var logoImage;
  void changeTheme() async {
    if (colorSwitched) {
      setState(() {
        logoImage = 'assets/wallet_dark_logo.png';
        _backgroundColor = [
          Color.fromRGBO(252, 214, 0, 1),
          Color.fromRGBO(251, 207, 6, 1),
          Color.fromRGBO(250, 197, 16, 1),
          Color.fromRGBO(249, 161, 28, 1),
        ];
        _iconColor = Colors.white;
        _textColor = Color.fromRGBO(253, 211, 4, 1);
        _borderContainer = Color.fromRGBO(34, 58, 90, 0.2);
        _actionContainerColor = [
          Color.fromRGBO(47, 75, 110, 1),
          Color.fromRGBO(43, 71, 105, 1),
          Color.fromRGBO(39, 64, 97, 1),
          Color.fromRGBO(34, 58, 90, 1),
        ];
      });
    } else {
      setState(() {
        logoImage = 'assets/wallet_logo.png';
        _borderContainer = Color.fromRGBO(252, 233, 187, 1);
        _backgroundColor = [
          Color.fromRGBO(249, 249, 249, 1),
          Color.fromRGBO(241, 241, 241, 1),
          Color.fromRGBO(233, 233, 233, 1),
          Color.fromRGBO(222, 222, 222, 1),
        ];
        _iconColor = Colors.black;
        _textColor = Colors.black;
        _actionContainerColor = [
          Color.fromRGBO(255, 212, 61, 1),
          Color.fromRGBO(255, 212, 55, 1),
          Color.fromRGBO(255, 211, 48, 1),
          Color.fromRGBO(255, 211, 43, 1),
        ];
      });
    }
  }

  @override
  void initState() {
    changeTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Rewards", style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            alignment: Alignment.bottomLeft,
            height: 50.0,
            child: Card(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.info), onPressed: null),
                  Text(
                    'Total :',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\₹ 524',
                    style: TextStyle(fontSize: 17.0, color: Colors.black54),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: OutlineButton(
                          borderSide: BorderSide(color: Colors.green),
                          child: const Text('PROCEED TO PAY'),
                          textColor: Colors.green,
                          onPressed: () {
                            // if (_radioValue == 0) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MyRewards()),
                            //   );
                            // }
                          },
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                    ),
                  ),
                ],
              ),
            )),
      ),
      body: SafeArea(
        child: GestureDetector(
          onLongPress: () {
            if (colorSwitched) {
              colorSwitched = false;
            } else {
              colorSwitched = true;
            }
            changeTheme();
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.2, 0.3, 0.5, 0.8],
                    colors: _backgroundColor)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  logoImage,
                  fit: BoxFit.contain,
                  height: 200.0,
                  width: 200.0,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Hello',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      'Ashish Bhomia',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  height: 300.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: _borderContainer,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0.2, 0.4, 0.6, 0.8],
                              colors: _actionContainerColor)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 70,
                            child: Center(
                              child: ListView(
                                children: <Widget>[
                                  Text(
                                    '790',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: _textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                  Text(
                                    'Available Cash',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: _iconColor, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 0.5,
                            color: Colors.grey,
                          ),
                          Table(
                            border: TableBorder.symmetric(
                              inside: BorderSide(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 0.5),
                            ),
                            children: [
                              TableRow(children: [
                                _actionList('assets/ic_send.png', 'Send Money'),
                                _actionList('assets/ic_money.png', 'Request'),
                              ]),
                              TableRow(children: [
                                _actionList(
                                    'assets/ic_transact.png', 'Transactions'),
                                _actionList(
                                    'assets/ic_reward.png', 'Reward Points'),
                              ])
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

// custom action widget
  Widget _actionList(String iconPath, String desc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            iconPath,
            fit: BoxFit.contain,
            height: 45.0,
            width: 45.0,
            color: _iconColor,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            desc,
            style: TextStyle(color: _iconColor),
          )
        ],
      ),
    );
  }
}
