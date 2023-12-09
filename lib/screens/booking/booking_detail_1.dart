// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_clean_application/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class bookingDetail extends StatefulWidget {
  final String totalPrice;
  final double discount;
  const bookingDetail({
    Key? key,
    required this.totalPrice,
    required this.discount,
  }) : super(key: key);
  @override
  _bookingDetailState createState() => _bookingDetailState();
}

class _bookingDetailState extends State<bookingDetail> {
  String? name = '';
  String? email = '';
  String? phoneNum = '';
  String? location = '';

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const BackButton(color: Colors.white,),
        leading: InkWell(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            ),
          },
          child: const Icon(
            Icons.arrow_back,
            size: 23,
          ),
        ),
        title: const Text(
          'Booking Detail',
          style: TextStyle(
            fontFamily: 'SF Pro Text',
            fontSize: 23,
          ),
        ),
        centerTitle: true,
        backgroundColor: kActiveColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Center(
            // child: Text('Payment Successful!',
            //   style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.green
            //   ),
            // ),
            // ),
            //       Divider(color: Colors.grey,),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Service 1',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'SF Pro Text',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Company Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Washee Washee',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kAccentColor,
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Date',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '19 January, 2023',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kAccentColor,
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Time',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '14.00 PM - 17.00 PM',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kAccentColor,
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Hours',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '3 Hours',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kAccentColor,
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Address',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Lot 2768 Kampung Budiman Meru Petaling, Klang 40170 Shah Alam, Selangor',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kAccentColor,
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Contact Number:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    phoneNum!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kAccentColor,
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Booking ID',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const <Widget>[
                                      Text(
                                        '12345',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kAccentColor,
                                          fontFamily: 'SF Pro Text',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Service Fee',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: const [
                                          Text(
                                            'PRICE',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kAccentColor,
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 115,
                                          // ),
                                          Spacer(),
                                          Text(
                                            '3  x  RM 28.00',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kAccentColor,
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Divider(
                                        thickness: 2,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'TOTAL(MYR)',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kAccentColor,
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 100,
                                          // ),
                                          Spacer(),
                                          Text(
                                            'RM 84.00',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kAccentColor,
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Service 2',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'SF Pro Text',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Company Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Dust & Dash Ent.',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kAccentColor,
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Date',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '20 January, 2023',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kAccentColor,
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Hours',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '4 Hours',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kAccentColor,
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Address',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'No 5 Jalan Kenyalang, Taman Sri Serdang 43400 Serdang, Selangor',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kAccentColor,
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Contact Number:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'SF Pro Text'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    phoneNum!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: kAccentColor,
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Booking ID',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const <Widget>[
                                      Text(
                                        '43512',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kAccentColor,
                                          fontFamily: 'SF Pro Text',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Service Fee',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: const [
                                          Text(
                                            'PRICE',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kAccentColor,
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 90,
                                          // ),
                                          Spacer(),
                                          Text(
                                            '4  x  RM 27.00',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kAccentColor,
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Divider(
                                        thickness: 2,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'TOTAL(MYR)',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kAccentColor,
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 70,
                                          // ),
                                          Spacer(),
                                          Text(
                                            'RM 108.00',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kAccentColor,
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Order Total',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: 'SF Pro Text',
                          ),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: const [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Service 1',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kActiveColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: 120,
                                    // ),
                                    Spacer(),
                                    Text(
                                      'RM 84.00',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kActiveColor,
                                        fontSize: 20,
                                        fontFamily: 'SF Pro Text',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Service 2',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kActiveColor,
                                        fontSize: 20,
                                        fontFamily: 'SF Pro Text',
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      'RM 108.00',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kActiveColor,
                                        fontFamily: 'SF Pro Text',
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Discount',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kOthColor,
                                        fontSize: 20,
                                        fontFamily: 'SF Pro Text',
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '-   RM ${widget.discount.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kOthColor,
                                        fontSize: 20,
                                        fontFamily: 'SF Pro Text',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Total',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kActiveColor,
                                        fontSize: 20,
                                        fontFamily: 'SF Pro Text',
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'RM ${widget.totalPrice}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kActiveColor,
                                        fontSize: 20,
                                        fontFamily: 'SF Pro Text',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
