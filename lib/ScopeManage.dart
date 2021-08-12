import 'dart:io';

import 'package:scoped_model/scoped_model.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:localstorage/localstorage.dart';

var data = [
  {
    "name": "Vodaka",
    "price": 125.0,
    "fav": true,
    "rating": 2.5,
    "image": "https://i.dlpng.com/static/png/6524376_preview.png"
  },
  {
    "name": "Red HAnded ",
    "price": 1200.0,
    "fav": true,
    "rating": 4.5,
    "image": "https://data.thefeedfeed.com/recommended/post_2566209.jpeg"
  },
  {
    "name": "Royal King's Brandy",
    "price": 1499.0,
    "fav": false,
    "rating": 4.5,
    "image":
        "https://images-na.ssl-images-amazon.com/images/I/71A-gHllnLL._AC_SX466_.jpg"
  },
  {
    "name": "St Remy Napoleon French Brandy",
    "price": 1300.0,
    "fav": true,
    "rating": 5.0,
    "image": "https://m.media-amazon.com/images/I/51QrQ3Pj0bL.jpg"
  },
  {
    "name": "Royal Liqur Trends 2018",
    "price": 2025.0,
    "fav": true,
    "rating": 4.5,
    "image":
        "https://bestbuyliquors.com/media/catalog/product/cache/f01a3066867b453895bc9726bf87b66d/j/a/jack-daniels-tennesse-honey-liqueur.jpg"
  },
  {
    "name": "Nordstrom",
    "price": 2164.0,
    "fav": false,
    "rating": 4.0,
    "image":
        "https://images-na.ssl-images-amazon.com/images/I/61aTy8gYgTL._AC_SX569_.jpg"
  },
  {
    "name": "Nordstrom",
    "price": 2050.0,
    "fav": true,
    "rating": 4.0,
    "image":
        "https://i.dlpng.com/static/png/5396566-whisky-buys-buy-whisky-online-scotch-whisky-and-whiskey-prices-whisky-png-400_300_preview.png"
  },
  {
    "name": "Nordstrom black",
    "price": 1200.0,
    "fav": false,
    "rating": 4.9,
    "image": "https://www.maltingpoint.com/wp-content/uploads/2020/04/JD.png"
  }
];

class AppModel extends Model {
  List<Item> _items = [];
  List<Data> _data = [];
  List<Data> _cart = [];
  String cartMsg = "";
  bool success = false;
  Database _db;
  Directory tempDir;
  String tempPath;
  final LocalStorage storage = new LocalStorage('app_data');

  AppModel() {
    // Create DB Instance & Create Table
    createDB();
  }

  deleteDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'cart.db');

    await deleteDatabase(path);
    if (storage.getItem("isFirst") != null) {
      await storage.deleteItem("isFirst");
    }
  }

  createDB() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, 'cart.db');

      print(path);
//      await storage.deleteItem("isFirst");
//      await this.deleteDB();

      var database =
          await openDatabase(path, version: 1, onOpen: (Database db) {
        this._db = db;
        print("OPEN DBV");
        this.createTable();
      }, onCreate: (Database db, int version) async {
        this._db = db;
        print("DB Crated");
      });
    } catch (e) {
      print("ERRR >>>>");
      print(e);
    }
  }

  createTable() async {
    try {
      var qry = "CREATE TABLE IF NOT EXISTS shopping ( "
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "image Text,"
          "price REAL,"
          "fav INTEGER,"
          "rating REAL,"
          "datetime DATETIME)";
      await this._db.execute(qry);
      qry = "CREATE TABLE IF NOT EXISTS cart_list ( "
          "id INTEGER PRIMARY KEY,"
          "shop_id INTEGER,"
          "name TEXT,"
          "image Text,"
          "price REAL,"
          "fav INTEGER,"
          "rating REAL,"
          "datetime DATETIME)";

      await this._db.execute(qry);

      var _flag = storage.getItem("isFirst");
      print("FLAG IS FIRST ${_flag}");
      if (_flag == "true") {
        this.FetchLocalData();
        this.FetchCartList();
      } else {
        this.InsertInLocal();
      }
    } catch (e) {
      print("ERRR ^^^");
      print(e);
    }
  }

  FetchLocalData() async {
    try {
      // Get the records
      List<Map> list = await this._db.rawQuery('SELECT * FROM shopping');
      list.map((dd) {
        Data d = new Data();
        d.id = dd["id"];
        d.name = dd["name"];
        d.image = dd["image"];
        d.price = dd["price"];
        d.fav = dd["fav"] == 1 ? true : false;
        d.rating = dd["rating"];
        _data.add(d);
      }).toList();
      notifyListeners();
    } catch (e) {
      print("ERRR %%%");
      print(e);
    }
  }

  InsertInLocal() async {
    try {
      await this._db.transaction((tx) async {
        for (var i = 0; i < data.length; i++) {
          print("Called insert ${i}");
          Data d = new Data();
          d.id = i + 1;
          d.name = data[i]["name"];
          d.image = data[i]["image"];
          d.price = data[i]["price"];
          d.fav = data[i]["fav"];
          d.rating = data[i]["rating"];
          try {
            var qry =
                'INSERT INTO shopping(name, price, image,rating,fav) VALUES("${d.name}",${d.price}, "${d.image}",${d.rating},${d.fav ? 1 : 0})';
            var _res = await tx.rawInsert(qry);
          } catch (e) {
            print("ERRR >>>");
            print(e);
          }
          _data.add(d);
          notifyListeners();
        }

        storage.setItem("isFirst", "true");
      });
    } catch (e) {
      print("ERRR ## > ");
      print(e);
    }
  }

  InsertInCart(Data d) async {
    await this._db.transaction((tx) async {
      try {
        var qry =
            'INSERT INTO cart_list(shop_id,name, price, image,rating,fav) VALUES(${d.id},"${d.name}",${d.price}, "${d.image}",${d.rating},${d.fav ? 1 : 0})';
        var _res = await tx.execute(qry);
        this.FetchCartList();
      } catch (e) {
        print("ERRR @@ @@");
        print(e);
      }
    });
  }

  FetchCartList() async {
    try {
      // Get the records
      _cart = [];
      List<Map> list = await this._db.rawQuery('SELECT * FROM cart_list');
      print("Cart len ${list.length.toString()}");
      list.map((dd) {
        Data d = new Data();
        d.id = dd["id"];
        d.name = dd["name"];
        d.image = dd["image"];
        d.price = dd["price"];
        d.shop_id = dd["shop_id"];
        d.fav = dd["fav"] == 1 ? true : false;
        d.rating = dd["rating"];
        _cart.add(d);
      }).toList();
      notifyListeners();
    } catch (e) {
      print("ERRR @##@");
      print(e);
    }
  }

  UpdateFavItem(Data data) async {
    try {
      var qry =
          "UPDATE shopping set fav = ${data.fav ? 1 : 0} where id = ${data.id}";
      this._db.rawUpdate(qry).then((res) {
        print("UPDATE RES ${res}");
      }).catchError((e) {
        print("UPDATE ERR ${e}");
      });
    } catch (e) {
      print("ERRR @@");
      print(e);
    }
  }

  // Add In fav list
  addToFav(Data data) {
    var _index = _data.indexWhere((d) => d.id == data.id);
    data.fav = !data.fav;
    _data.insert(_index, data);
    this.UpdateFavItem(data);
    notifyListeners();
  }

  // Item List
  List<Data> get itemListing => _data;

  // Item Add
  void addItem(Data dd) {
    Data d = new Data();
    d.id = _data.length + 1;
    d.name = "New";
    d.image = "https://www.maltingpoint.com/wp-content/uploads/2020/04/JD.png";
    d.price = 154.0;
    d.fav = false;
    d.rating = 4.0;
    _data.add(d);
    notifyListeners();
  }

  // Cart Listing
  List<Data> get cartListing => _cart;

  // Add Cart
  void addCart(Data dd) {
    print(dd);
    print(_cart);
    int _index = _cart.indexWhere((d) => d.shop_id == dd.id);
    if (_index > -1) {
      success = false;
      cartMsg = "${dd.name.toUpperCase()} already added in Cart list.";
    } else {
      this.InsertInCart(dd);
      success = true;
      cartMsg = "${dd.name.toUpperCase()} successfully added in cart list.";
    }
  }

  RemoveCartDB(Data d) async {
    try {
      var qry = "DELETE FROM cart_list where id = ${d.id}";
      this._db.rawDelete(qry).then((data) {
        print(data);
        int _index = _cart.indexWhere((dd) => dd.id == d.id);
        _cart.removeAt(_index);
        notifyListeners();
      }).catchError((e) {
        print(e);
      });
    } catch (e) {
      print("ERR rm cart${e}");
    }
  }

  // Remove Cart
  void removeCart(Data dd) {
    this.RemoveCartDB(dd);
  }
}

class Item {
  final String name;

  Item(this.name);
}

class Data {
  String name;
  int id;
  String image;
  double rating;
  double price;
  bool fav;
  int shop_id;
}
