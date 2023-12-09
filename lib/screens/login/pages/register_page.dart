// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:do_clean_application/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class RegisterPage extends StatefulWidget {
//   final VoidCallback showLoginPage;
//   const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passController = TextEditingController();
//   final _confirmpasswordController = TextEditingController();
//   bool passwordConfimed() {
//     if (_passController.text.trim() == _confirmpasswordController.text.trim()) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future signUp() async {
//     if (passwordConfimed()) {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: _emailController.text.trim(),
//               password: _passController.text.trim())
//           .then((value) {
//         FirebaseFirestore.instance
//             .collection('UserData')
//             .doc(value.user?.uid)
//             .set({'email': value.user?.email});
//       });
//       final snackBar = SnackBar(
//         content: const Text(
//           'Signup successful!',
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
//     }
//   }
//   //     if (passwordConfimed()) {
//   //   String uid = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
//   //       email: _emailController.text.trim(),
//   //       password: _passController.text.trim())) as String;

//   //   createUser(uid, username, email);
//   // }
//   //       .then((value) {
//   // FirebaseFirestore.instance
//   //     .collection('UserData')
//   //     .doc(value.user?.uid)
//   //     .set({'email': value.user?.email});

//   // Future<void> createUser(String uid, String username, String email) async {
//   //   FirebaseFirestore.instance
//   //       .collection("UserData")
//   //       .doc(uid)
//   //       .set({"email": email, "name": username});
//   // }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passController.dispose();
//     _confirmpasswordController.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Colors.orangeAccent[400],
//       // ),
//       backgroundColor: Colors.purple[50],
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               //hello text

//               children: [
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 SizedBox(
//                   height: 160,
//                   child: Image.asset('asset/images/DoClean_Logo_8.png'),
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 const Text(
//                   "Create Account",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w900,
//                     fontSize: 40,
//                     fontFamily: 'SF Pro Text',
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 // Text(
//                 //   "Register and join the party!",
//                 //   style: TextStyle(
//                 //     fontWeight: FontWeight.bold,
//                 //     fontSize: 20,
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   height: 460,
//                 //   child: Image.asset('asset/images/deer.gif'),
//                 // ),
//                 //name text field
//                 // Padding(
//                 //   padding: const EdgeInsets.symmetric(horizontal: 25),
//                 //   child: Container(
//                 //     decoration: BoxDecoration(
//                 //       color: Colors.grey[200],
//                 //       border: Border.all(color: Colors.white),
//                 //       borderRadius: BorderRadius.circular(12),
//                 //     ),
//                 //     child: Padding(
//                 //       padding: const EdgeInsets.only(left: 20.0),
//                 //       child: TextField(
//                 //         controller: _nameController,
//                 //         decoration: InputDecoration(
//                 //           border: InputBorder.none,
//                 //           hintText: 'Name',
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 //email text field
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
//                             border: InputBorder.none,
//                             hintText: 'Email',
//                             hintStyle: TextStyle(
//                               fontFamily: 'SF Pro Text',
//                             ),
//                             contentPadding: EdgeInsets.symmetric(vertical: 16),
//                             prefixIcon:
//                                 Icon(Icons.email, color: Colors.black38)),
//                       ),
//                     ),
//                   ),
//                 ),
//                 //password text field
//                 const SizedBox(
//                   height: 23,
//                 ),
//                 const Text(
//                   'Your password must be at least 6 characters!',
//                   style: TextStyle(
//                       color: kAccentColor,
//                       fontFamily: 'SF Pro Text',
//                       fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 13,
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
//                       child: TextFormField(
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
//                         // validator: (value) {
//                         //   if (value == null || value.isEmpty) {
//                         //     return 'Password must be at least 6 characters';
//                         //   }
//                         //   return null;
//                         // },
//                       ),
//                     ),
//                   ),
//                 ),
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
//                         controller: _confirmpasswordController,
//                         obscureText: true,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Confirm Password',
//                           hintStyle: TextStyle(
//                             fontFamily: 'SF Pro Text',
//                           ),
//                           contentPadding: EdgeInsets.symmetric(vertical: 16),
//                           prefixIcon: Icon(Icons.lock_person_rounded,
//                               color: Colors.black38),
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
//                     onTap: signUp,
//                     child: Container(
//                       height: 60,
//                       width: 240,
//                       padding: const EdgeInsets.symmetric(horizontal: 50),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25),
//                         color: kActiveColor,
//                       ),
//                       child: const Center(
//                         child: Padding(
//                           padding: EdgeInsets.all(10),
//                           child: Text(
//                             'Sign Up',
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
//                       'Already a member? ',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'SF Pro Text',
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: widget.showLoginPage,
//                       child: const Text(
//                         'Login Now',
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

// For 2nd option

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_clean_application/constants.dart';
import 'package:do_clean_application/screens/login/pages/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:do_clean_application/screens/home/home_screen.dart';

// class RegisterPage extends StatefulWidget {
//   final VoidCallback showLoginPage;
//   const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

class RegisterPage extends StatelessWidget {
  // final _nameController = TextEditingController();
  // final _phoneNumController = TextEditingController();
  // final _emailController = TextEditingController();
  // final _locationController = TextEditingController();
  // final _passController = TextEditingController();
  // final _confirmpasswordController = TextEditingController();

  late String _email, _password, _confirmPass, _name, _location, _phoneNum;

  bool passwordConfimed() {
    if (_password == _confirmPass) {
      return true;
    } else {
      return false;
    }
  }

  // Future signUp() async {
  //   if (passwordConfimed()) {
  //     await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //             email: _emailController.text.trim(),
  //             password: _passController.text.trim())
  //         .then((value) {
  //       FirebaseFirestore.instance
  //           .collection('UserData')
  //           .doc(value.user?.uid)
  //           .set({'email': value.user?.email});
  //     });
  //     final snackBar = SnackBar(
  //       content: const Text(
  //         'Signup successful!',
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
  //   }
  // }

  //     if (passwordConfimed()) {
  //   String uid = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passController.text.trim())) as String;

  //   createUser(uid, username, email);
  // }
  //       .then((value) {
  // FirebaseFirestore.instance
  //     .collection('UserData')
  //     .doc(value.user?.uid)
  //     .set({'email': value.user?.email});

  // Future<void> createUser(String uid, String username, String email) async {
  //   FirebaseFirestore.instance
  //       .collection("UserData")
  //       .doc(uid)
  //       .set({"email": email, "name": username});
  // }

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passController.dispose();
  //   _confirmpasswordController.dispose();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.orangeAccent[400],
      // ),
      backgroundColor: Colors.purple[50],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //hello text

              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 160,
                  child: Image.asset('asset/images/DoClean_Logo_8.png'),
                ),
                // const SizedBox(
                //   height: 40,
                // ),
                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                    fontFamily: 'SF Pro Text',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Text(
                //   "Register and join the party!",
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 20,
                //   ),
                // ),
                // SizedBox(
                //   height: 460,
                //   child: Image.asset('asset/images/deer.gif'),
                // ),
                //name text field
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.grey[200],
                //       border: Border.all(color: Colors.white),
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.only(left: 20.0),
                //       child: TextField(
                //         controller: _nameController,
                //         decoration: InputDecoration(
                //           border: InputBorder.none,
                //           hintText: 'Name',
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 40,
                ),
                // name text field
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
                      child: TextFormField(
                        onChanged: (value) {
                          _name = value;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            fontFamily: 'SF Pro Text',
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                //email text field
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
                const SizedBox(
                  height: 17,
                ),
                // phone number text
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
                      child: TextFormField(
                        onChanged: (value) {
                          _phoneNum = value;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                            fontFamily: 'SF Pro Text',
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          prefixIcon: Icon(
                            Icons.call_sharp,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                // location text
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
                      child: TextFormField(
                        onChanged: (value) {
                          _location = value;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Current Location',
                          hintStyle: TextStyle(
                            fontFamily: 'SF Pro Text',
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          prefixIcon: Icon(
                            Icons.location_on_sharp,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //password text field
                const SizedBox(
                  height: 23,
                ),
                const Text(
                  'Your password must be at least 6 characters!',
                  style: TextStyle(
                      color: kAccentColor,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 13,
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
                      child: TextFormField(
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
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Password must be at least 6 characters';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                  ),
                ),
                // confirm paswword text
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
                          _confirmPass = value;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            fontFamily: 'SF Pro Text',
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          prefixIcon: Icon(Icons.lock_person_rounded,
                              color: Colors.black38),
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
                          .createUserWithEmailAndPassword(
                        email: _email,
                        password: _password,
                      );
                      if (user != null) {
                        await FirebaseFirestore.instance
                            .collection('UserData')
                            .doc(_email)
                            .set(
                          {
                            'Name': _name,
                            'PhoneNumber': _phoneNum,
                            'Email': _email,
                            'Location': _location
                          },
                        );
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
                            'Signup successful!',
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
                        color: kActiveColor,
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Sign Up',
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
                      'Already a member? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SF Pro Text',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => LoginPage(),
                        //   ),
                        // ),
                        Navigator.pushNamed(context, '/'),
                      },
                      child: const Text(
                        'Login Now',
                        style: TextStyle(
                          color: kAccentColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF Pro Text',
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
