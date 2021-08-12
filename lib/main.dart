import 'package:bakery/Constant.dart';
import 'package:bakery/Home.dart';
import 'package:bakery/ScopeManage.dart';
import 'package:bakery/body.dart';
import 'package:bakery/login/login_page.dart';
import 'package:bakery/logind_signup.dart';
import 'package:bakery/services/Auth_Service.dart';
import 'package:bakery/splash_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
// as firebase_auth;
import 'package:firebase_core/firebase_core.dart';

import 'authentication_service.dart';
import 'package:provider/provider.dart';

Widget currentPage = LoginPage();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferences localStorage = await SharedPreferences.getInstance();
  // var phone = localStorage.getString('email');
  // if (await Permission.contacts.request().isGranted) {
  //   // Either the permission was already granted before or the user just granted it.
  // }
  // print(phone);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppModel appModel = AppModel();
  AuthClass authClass = AuthClass();
  // Widget currentPage = LoginPage();

  @override
  void initState() {
    super.initState();
    // authClass.signOut();
    checkLogin();
  }

  checkLogin() async {
    String tokne = await authClass.getToken();
    print("tokne");
    if (tokne != null) {
      setState(() {
        currentPage = BodyOTP();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.deepOrange, // navigation bar color
      statusBarColor: Colors.deepOrange,

      statusBarBrightness: Brightness.light, //status bar brigtness
      statusBarIconBrightness: Brightness.light, //status barIcon Brightness
      systemNavigationBarDividerColor:
          Colors.black, //Navigation bar divider color
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    return ScopedModel<AppModel>(
      model: appModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BhomiaSoft',
        theme: ThemeData(
          primaryColor: Colors.brown,
        ),
        routes: <String, WidgetBuilder>{
          SPLASH_SCREEN: (BuildContext context) => AnimatedSplashScreen(),
          // HOME_SCREEN: (BuildContext context) => HomePage(),
          // Home.route: (BuildContext context) => Home(),
          // Details.route: (BuildContext context) => Details(),
          // Cart.route: (BuildContext context) => Cart()
        },
        home:
            // AuthenticationWrapper()
            AnimatedSplashScreen(),
      ),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var email = prefs.toString('email');
//   runApp(MaterialApp(
//     home: email == null ? Login() : Home(),
//   ));
// }
// class AuthenticationWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User>();

//     if (firebaseUser != null) {
//       return BodyOTP();
//     } else {
//       // isLoggedInSuccessfully = false;
//       return LoginPage();
//     }
//   }
// }

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         Provider<AuthenticationService>(
//           create: (_) => AuthenticationService(FirebaseAuth.instance),
//         ),
//         StreamProvider(
//           create: (context) => context.read<AuthenticationService>().authStateChanges,
//         )
//       ],
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: AuthenticationWrapper(),
//       ),
//     );
//   }
// }
