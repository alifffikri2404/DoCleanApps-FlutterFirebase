// import 'package:do_clean_application/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class LoginPage extends StatefulWidget {
//   final VoidCallback showRegisterPage;
//   const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _emailController = TextEditingController();
//   final _passController = TextEditingController();
//   Future signIn() async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passController.text.trim());
//       final snackBar = SnackBar(
//         content: const Text(
//           'Login successful!',
//           style: TextStyle(fontFamily: 'SF Pro Text'),
//         ),
//         backgroundColor: kActiveColor,
//         action: SnackBarAction(
//           label: 'Logout',
//           textColor: kBgColor,
//           onPressed: () {
//             FirebaseAuth.instance.signOut();
//           },
//         ),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     } on FirebaseAuthException catch (error) {
//       Fluttertoast.showToast(msg: error.message!, gravity: ToastGravity.TOP);
//     }
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passController.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     final _formKey = GlobalKey<FormState>();
//     String email = '';
//     String password = '';

//     return Scaffold(
//       // appBar: PreferredSize(
//       //   preferredSize: Size.fromHeight(100),
//       //   child: AppBar(
//       //     backgroundColor: kActiveColor,
//       //   ),
//       // ),
//       backgroundColor: Colors.grey[300],
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 122,
//                 ),
//                 const Text(
//                   "Welcome to",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontWeight: FontWeight.w900,
//                     fontSize: 40,
//                     fontFamily: 'SF Pro Text',
//                   ),
//                 ),
//                 SizedBox(
//                   height: 160,
//                   child: Image.asset('asset/images/DoClean_Logo_8.png'),
//                 ),
//                 // SizedBox(
//                 //   height: 10,
//                 // ),
//                 // Text(
//                 //   "Welcome back, Sign In to see what's rolling!",
//                 //   style: TextStyle(
//                 //     fontWeight: FontWeight.bold,
//                 //     fontSize: 20,
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   height: 300,
//                 //   child: Image.asset('asset/images/cleaning_service.gif'),
//                 // ),
//                 //email text field
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 35),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 10.0),
//                       child: TextField(
//                         controller: _emailController,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Email',
//                           hintStyle: TextStyle(
//                             fontFamily: 'SF Pro Text',
//                           ),
//                           contentPadding: EdgeInsets.symmetric(vertical: 16),
//                           prefixIcon: Icon(Icons.email, color: Colors.black38),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 //password text field
//                 const SizedBox(
//                   height: 17,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 35),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 10.0),
//                       child: TextField(
//                         controller: _passController,
//                         obscureText: true,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Password',
//                           hintStyle: TextStyle(
//                             fontFamily: 'SF Pro Text',
//                           ),
//                           contentPadding: EdgeInsets.symmetric(vertical: 16),
//                           prefixIcon: Icon(Icons.lock, color: Colors.black38),
//                         ),
//                       ),
//                       //not a member
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 45,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 35.0),
//                   child: GestureDetector(
//                     onTap: signIn,
//                     child: Container(
//                       height: 60,
//                       width: 240,
//                       padding: const EdgeInsets.symmetric(horizontal: 50),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(25),
//                           color: kActiveColor),
//                       child: const Center(
//                         child: Padding(
//                           padding: EdgeInsets.all(10),
//                           child: Text(
//                             'Login',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 23,
//                               fontFamily: 'SF Pro Text',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Not a member? ',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'SF Pro Text',
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: widget.showRegisterPage,
//                       child: const Text(
//                         'Sign Up Here',
//                         style: TextStyle(
//                           color: kAccentColor,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'SF Pro Text',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// for 2nd option

import 'package:do_clean_application/constants.dart';
import 'package:do_clean_application/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:do_clean_application/screens/login/pages/register_page.dart';

// class LoginPage extends StatefulWidget {
//   final VoidCallback showRegisterPage;
//   const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

class LoginPage extends StatelessWidget {
  // final _emailController = TextEditingController();
  // final _passController = TextEditingController();

  late String _email, _password;
  static late String email;

  // Future signIn() async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: _emailController.text.trim(),
  //         password: _passController.text.trim());
  //     final snackBar = SnackBar(
  //       content: const Text(
  //         'Login successful!',
  //         style: TextStyle(fontFamily: 'SF Pro Text'),
  //       ),
  //       backgroundColor: kActiveColor,
  //       action: SnackBarAction(
  //         label: 'Logout',
  //         textColor: kBgColor,
  //         onPressed: () {
  //           FirebaseAuth.instance.signOut();
  //         },
  //       ),
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   } on FirebaseAuthException catch (error) {
  //     Fluttertoast.showToast(msg: error.message!, gravity: ToastGravity.TOP);
  //   }
  // }

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passController.dispose();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    // final _formKey = GlobalKey<FormState>();
    // String email = '';
    // String password = '';

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(100),
      //   child: AppBar(
      //     backgroundColor: kActiveColor,
      //   ),
      // ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 122,
                ),
                const Text(
                  "Welcome to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                    fontFamily: 'SF Pro Text',
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: Image.asset('asset/images/DoClean_Logo_8.png'),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   "Welcome back, Sign In to see what's rolling!",
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 20,
                //   ),
                // ),
                // SizedBox(
                //   height: 300,
                //   child: Image.asset('asset/images/cleaning_service.gif'),
                // ),
                //email text field
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        onChanged: (value) {
                          _email = value;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            fontFamily: 'SF Pro Text',
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //password text field
                const SizedBox(
                  height: 17,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        onChanged: (value) {
                          _password = value;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontFamily: 'SF Pro Text',
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      //not a member
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: GestureDetector(
                    onTap: () async {
                      UserCredential user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _email, password: _password);
                      if (user != null) {
                        email = _email;
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return HomeScreen();
                        //     },
                        //   ),
                        // );
                        Navigator.pushNamed(context, '/home');
                        final snackBar = SnackBar(
                          content: const Text(
                            'Login successful!',
                            style: TextStyle(fontFamily: 'SF Pro Text'),
                          ),
                          backgroundColor: kActiveColor,
                          action: SnackBarAction(
                            label: 'Logout',
                            textColor: kBgColor,
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pushNamed(context, '/');
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 240,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: kActiveColor),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              fontFamily: 'SF Pro Text',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SF Pro Text',
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => RegisterPage(),
                        //   ),
                        // );
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text(
                        'Sign Up Here',
                        style: TextStyle(
                          color: kAccentColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF Pro Text',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
