import 'package:do_clean_application/constants.dart';
import 'package:flutter/material.dart';
import 'package:do_clean_application/screens/profile/components/info_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//const username = "nimiki";
const name = "Pewter Parker Griffin";
//const lastname = "Mira";
const phone = "012-3456789";
const location = "Malaysia";

// DocumentSnapshot snapshot;

class AccountSettings extends StatefulWidget {
  AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  final user = FirebaseAuth.instance.currentUser!;

  // void getData() async {
  String? name = '';
  String? email = '';
  String? phoneNum = '';
  String? location = '';

  // TextEditingController _nameFieldController = TextEditingController();
  // TextEditingController _emailFieldController = TextEditingController();
  // TextEditingController _phoneNumFieldController = TextEditingController();
  // TextEditingController _FieldController = TextEditingController();

  Future getData() async {
    await FirebaseFirestore.instance
        .collection('UserData')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get()
        .then(
      (snapshot) async {
        if (snapshot.exists) {
          setState(
            () {
              name = snapshot.data()!["Name"];
              email = snapshot.data()!["Email"];
              phoneNum = snapshot.data()!["PhoneNumber"];
              location = snapshot.data()!["Location"];
            },
          );
        }
      },
    );
  }

  void initState() {
    super.initState();
    getData();
  }

  // Future getUserList() async {
  //   List itemList = [];
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('UserData')
  //         .get()
  //         .then((QuerySnapshot) {
  //       QuerySnapshot.docs.forEach((element) {
  //         itemList.add(element.data);
  //       });
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Setting',
          style: TextStyle(
            fontFamily: 'SF Pro Text',
            fontSize: 23,
          ),
        ),
        centerTitle: true,
        backgroundColor: kActiveColor,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('asset/images/latte.jpg'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              name!,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro Text',
              ),
            ),
            const SizedBox(
              height: 20,
              width: 200,
              child: Divider(color: Colors.white),
            ),
            // InfoCard(
            //   text: data['Name'],
            //   icon: Icons.account_circle_outlined,
            //   onPressed: () async {},
            // ),
            // InfoCard(
            //   text: data['PhoneNumber'],
            //   icon: Icons.phone,
            //   onPressed: () async {},
            // ),
            // InfoCard(
            //   text: data['Location'],
            //   icon: Icons.location_city,
            //   onPressed: () async {},
            // ),
            // InfoCard(
            //   text: user.email!,
            //   icon: Icons.email,
            //   onPressed: () async {},
            // ),

            // Name
            GestureDetector(
              onTap: () {},
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: const Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                  ),
                  title: Text(
                    name!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'SF Pro Text',
                    ),
                  ),
                ),
              ),
            ),

            // Email
            GestureDetector(
              onTap: () {},
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: const Icon(
                    Icons.email_rounded,
                    color: Colors.black,
                  ),
                  title: Text(
                    email!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'SF Pro Text',
                    ),
                  ),
                ),
              ),
            ),

            // Phone Number
            GestureDetector(
              onTap: () {},
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: const Icon(
                    Icons.call,
                    color: Colors.black,
                  ),
                  title: Text(
                    phoneNum!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'SF Pro Text',
                    ),
                  ),
                ),
              ),
            ),

            // Location
            GestureDetector(
              onTap: () {},
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: const Icon(
                    Icons.location_on_sharp,
                    color: Colors.black,
                  ),
                  title: Text(
                    location!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'SF Pro Text',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
