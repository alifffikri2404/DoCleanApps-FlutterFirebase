// import 'login_page.dart.';
// import 'package:do_clean_application/screens/login/pages/register_page.dart';
// import 'package:flutter/material.dart';

// class AuthPage extends StatefulWidget {
//   const AuthPage({Key? key}) : super(key: key);

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   //show login page first
//   bool showLoginPage = true;
//   void toggleScreens() {
//     setState(() {
//       showLoginPage = !showLoginPage;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showLoginPage) {
//       return LoginPage(showRegisterPage: toggleScreens);
//     } else {
//       return RegisterPage(
//           showLoginPage:
//               toggleScreens); //allows us to toggle between the two screens
//     }
//   }
// }
