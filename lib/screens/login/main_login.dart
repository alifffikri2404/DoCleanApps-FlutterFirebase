import 'package:do_clean_application/screens/cart/cart_page.dart';
import 'package:do_clean_application/screens/home/home_screen.dart';
import 'package:do_clean_application/screens/login/pages/auth/login_page.dart';
import 'package:do_clean_application/screens/login/pages/register_page.dart';
import 'package:do_clean_application/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:do_clean_application/screens/profile/about.dart';
import 'package:do_clean_application/screens/profile/activity_history_main.dart';
import 'package:do_clean_application/screens/profile/faq.dart';
import 'package:do_clean_application/screens/profile/settings.dart';
import 'package:do_clean_application/screens/login/Shared/constants.dart';
import 'package:do_clean_application/screens/login/helper/helper_function.dart';
import 'package:do_clean_application/screens/login/main_page.dart';
import 'package:do_clean_application/screens/login/pages/home_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51MQPsAI7tek1FXH7Y2BZiOhUSYC8AEM46Fx8WBVInRCdOqcQFPf9ZRqjJjdqxu6a2ycom6ylc1fx5J4c8tCE1RHp00j1CPoGhG';
  await dotenv.load(fileName: "asset/.env");
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appID,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    await Firebase.initializeApp(); //initializng andriod and ios app
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        _isSignedIn = value;
      }
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildThemeData(),
      title: 'DoClean!',
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => RegisterPage(),
        '/home': (context) => const HomeScreen(),
        '/history': (context) => const activityHistory(),
        '/settings': (context) => AccountSettings(),
        '/faq': (context) => faq(),
        '/abt': (context) => about(),
        '/cart': (context) => CartPage(),
      },
      // home: _isSignedIn ? const PageRouteFunction() : const MainPage(),
      // home: LoginPage(),
    );
  }
}
