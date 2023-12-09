import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  // the values we need
  final String text;
  final IconData icon;
  Function onPressed;

  //var shape;
  dynamic data;
  Future<dynamic> getData() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection('UserData').doc('Email');

    await document.get().then<dynamic>(
      (DocumentSnapshot snapshot) async {
        data = snapshot.data;
      },
    );
  }

  InfoCard({required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: Text(
            data,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'SF Pro Text',
            ),
          ),
        ),
      ),
    );
  }
}
