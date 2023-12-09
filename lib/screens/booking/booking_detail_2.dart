import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_clean_application/constants.dart';
import 'package:do_clean_application/screens/servicepage/components/company_data_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:do_clean_application/screens/servicepage/components/time_display.dart';

import '../home/home_screen.dart';

class bookingDetail2 extends StatefulWidget {
  final Company? company;
  final int index;
  final String? value;
  final int counter;
  final String Date;
  final String totalPrice;
  final double discount;

  const bookingDetail2(
      {Key? key,
      this.company,
      required this.index,
      required this.value,
      required this.counter,
      required this.Date,
      required this.totalPrice,
      required this.discount})
      : super(key: key);
  @override
  _bookingDetailState2 createState() => _bookingDetailState2();
}

class _bookingDetailState2 extends State<bookingDetail2> {
  @override
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
              fontSize: 23,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF Pro Text',
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
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'RECEIPT',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SF Pro Text',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
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
                                        Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    '${companies[widget.index].title} Sdn Bhd',
                                    style: const TextStyle(
                                      color: kAccentColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
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
                              const SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    widget.Date,
                                    style: const TextStyle(
                                      color: kAccentColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
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
                              const SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${widget.value}',
                                        style: const TextStyle(
                                          color: kAccentColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'SF Pro Text',
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        '-',
                                        style: TextStyle(
                                          color: kAccentColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'SF Pro Text',
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      if (int.parse(widget.value!
                                                  .substring(0, 2)) +
                                              widget.counter <
                                          12)
                                        Text(
                                          '${int.parse(widget.value!.substring(0, 2)) + widget.counter}:00 AM',
                                          style: const TextStyle(
                                            color: kAccentColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'SF Pro Text',
                                          ),
                                        ),
                                      if (int.parse(widget.value!
                                                  .substring(0, 2)) +
                                              widget.counter >=
                                          12)
                                        Text(
                                          '${int.parse(widget.value!.substring(0, 2)) + widget.counter}:00 PM',
                                          style: const TextStyle(
                                            color: kAccentColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'SF Pro Text',
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
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
                              const SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    '${widget.counter} Hours',
                                    style: const TextStyle(
                                      color: kAccentColor,
                                      fontWeight: FontWeight.bold,
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
                              const SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Lot 2768 Kampung Budiman Meru Petaling, Klang',
                                    style: TextStyle(
                                      color: kAccentColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
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
                              const SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    phoneNum!,
                                    style: const TextStyle(
                                      color: kAccentColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
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
                              const SizedBox(height: 10),
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
                                          color: kAccentColor,
                                          fontWeight: FontWeight.bold,
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
                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Text(
                                            '${widget.counter}',
                                            style: const TextStyle(
                                              color: kAccentColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                          const Text(
                                            '  x  ',
                                            style: TextStyle(
                                              color: kAccentColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                          Text(
                                            'RM ${companies[widget.index].price.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              color: kAccentColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            'RM ${(widget.counter.toDouble() * companies[widget.index].price).toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              color: kAccentColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Discount',
                                            style: TextStyle(
                                              color: kAccentColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '-  RM ${widget.discount.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              color: kAccentColor,
                                              fontWeight: FontWeight.bold,
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
                                        children: [
                                          const Text(
                                            'TOTAL(MYR)',
                                            style: TextStyle(
                                              color: kAccentColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            'RM ${widget.totalPrice}',
                                            style: const TextStyle(
                                              color: kAccentColor,
                                              fontWeight: FontWeight.bold,
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
                ],
              ),
            )
          ],
        )));
  }
}
