import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

import 'package:do_clean_application/screens/booking/booking_detail_2.dart';
import 'package:do_clean_application/screens/servicepage/components/company_data_service.dart';
import 'package:do_clean_application/constants.dart';
import 'package:do_clean_application/screens/servicepage/service_detail_page.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentPage extends StatefulWidget {
  final Company? company;
  final int index;
  final String? value;
  final int counter;
  final String Date;

  const PaymentPage(
      {Key? key,
      this.company,
      required this.index,
      required this.value,
      required this.counter,
      required this.Date})
      : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late double totalPrice =
      widget.counter.toDouble() * companies[widget.index].price;
  // initialize total price
  int i = 0;
  double discount = 0;
  List<String> vouchers = ["10OFF", "", "5DEALS"]; // list of valid vouchers

  double getDiscount(String voucherCode) {
    if (voucherCode == "10OFF") {
      return discount = 10;
    } else if (voucherCode == "5DEALS") {
      return discount = 5;
    } else {
      return discount = 0;
    }
  }

  Map<String, dynamic>? paymentIntent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Payment Method",
          style: TextStyle(
            fontFamily: 'SF Pro Text',
            fontSize: 23,
          ),
          //style: TextStyle(fontSize: 40),
        ),
        centerTitle: true,
        backgroundColor: kActiveColor,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: kAccentColor,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(50),
                      child: Image.asset(
                        companies[widget.index].image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    //padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: Text(
                      companies[widget.index].title,
                      // textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 20,
                        color: kAccentColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        companies[widget.index].rating,
                        style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.monetization_on,
                        color: kAccentColor,
                        size: 20,
                      ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      Text(
                        ' RM${companies[widget.index].price}/hour',
                        //textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          const SizedBox(
            child: Divider(
              thickness: 8,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Reservation Details',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      'Time',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: "SF Pro Text",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      '${widget.value}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: "SF Pro Text",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '-',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "SF Pro Text",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    if (int.parse(widget.value!.substring(0, 2)) +
                            widget.counter <
                        12)
                      Text(
                        '${int.parse(widget.value!.substring(0, 2)) + widget.counter}:00 AM',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.6),
                          fontFamily: "SF Pro Text",
                        ),
                      ),
                    if (int.parse(widget.value!.substring(0, 2)) +
                            widget.counter >=
                        12)
                      Text(
                        '${int.parse(widget.value!.substring(0, 2)) + widget.counter}:00 PM',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.6),
                          fontFamily: "SF Pro Text",
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    Text(
                      'Date',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: "SF Pro Text",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      widget.Date,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: "SF Pro Text",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const SizedBox(
            child: Divider(
              thickness: 8,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Price Details',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      'RM${(companies[widget.index].price).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: "SF Pro Text",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'X',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SF Pro Text",
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${widget.counter}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.6),
                        fontFamily: "SF Pro Text",
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'RM${(widget.counter.toDouble() * companies[widget.index].price).toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: "SF Pro Text"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'Discount',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.6),
                          fontFamily: "SF Pro Text"),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          '-   RM ${discount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: "SF Pro Text"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 100,
                      child: TextField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 5),
                            hintText: ("Enter code"),
                            hintStyle: TextStyle(
                              color: Colors.black26,
                              fontFamily: 'SF Pro Text',
                            ),
                            // prefixIcon: Icon(Icons.discount_outlined),
                            border: OutlineInputBorder()),
                        onSubmitted: (value) {
                          setState(
                            () {
                              if (vouchers.contains(value) && i < 1) {
                                i++;
                                getDiscount(value);
                                totalPrice = totalPrice - discount;
                                Fluttertoast.showToast(
                                    msg: "Voucher Applied",
                                    fontSize: 15.0,
                                    textColor: Colors.white,
                                    backgroundColor:
                                        Colors.green.withOpacity(0.8),
                                    gravity: ToastGravity.TOP,
                                    toastLength: Toast.LENGTH_LONG);
                              } else if (i > 0) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                        "Already Used",
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                        ),
                                      ),
                                      content: const Text(
                                        "You can only use one discount voucher for each payment",
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                        ),
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: const Text(
                                            "OK",
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                        "Invalid Voucher Code",
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                        ),
                                      ),
                                      content: const Text(
                                        "The voucher code you entered is invalid",
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                        ),
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: const Text(
                                            "OK",
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Text',
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text(
                      'Total (RM)',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SF Pro Text',
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'RM${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SF Pro Text',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 35),
          const SizedBox(
            child: Divider(
              thickness: 8,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  // final paymentMethod = await Stripe.instance.createPaymentMethod(
                  //     params: const PaymentMethodParams.card(
                  //         paymentMethodData: PaymentMethodData()));

                  await makePayment().then((_) {});
                },
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: kActiveColor,
                  ),
                  child: const Center(
                    child: Text(
                      'Confirm Payment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      //STEP 1: Create Payment Intent
      paymentIntent = await createPaymentIntent('${totalPrice.round()}', 'MYR');

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Azman'))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      throw Exception(err);
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        //Clear paymentIntent variable after successful payment
        paymentIntent = null;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => bookingDetail2(
                index: widget.index,
                value: widget.value,
                counter: widget.counter,
                Date: widget.Date,
                discount: discount,
                totalPrice: totalPrice.toStringAsFixed(2)),
          ),
        );
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        //'customer': 'azman'
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
