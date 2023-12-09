// import 'package:do_clean_application/screens/login/pages/auth/login_page.dart';

// import 'pages/auth/auth_page.dart';
// import 'pages/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:do_clean_application/screens/home/home_screen.dart';
// //this page checks if the user signed in or not

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return PageRouteFunction();
//           } else {
//             return LoginPage();
//           }
//         },
//       ),
//     );
//   }
// }
