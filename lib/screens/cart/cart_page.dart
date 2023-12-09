import 'package:do_clean_application/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:do_clean_application/screens/payment/payment_page.dart';
import 'package:do_clean_application/screens/cart/custom_text_style.dart';
import 'package:do_clean_application/screens/cart/custom_utils.dart';
import 'package:do_clean_application/screens/servicepage/components/company_data_service.dart';
import 'package:do_clean_application/screens/booking/booking_detail_1.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double discount = 0;
  double totalPrice = 192.00; // initialize total price
  int i = 0;
  List<String> vouchers = ["10OFF", "", "5DEALS"]; // list of valid vouchers
  Map<String, dynamic>? paymentIntent;

  double getDiscount(String voucherCode) {
    if (voucherCode == "10OFF") {
      return 10;
    } else if (voucherCode == "5DEALS") {
      return 5;
    } else {
      return 0;
    }
  }

  List<Details> details = [
    Details(
      price: "RM 108.00",
      hours: 4,
      date: "20 Jan, 2023",
      time: "08:00",
    ),
    Details(
      price: "RM 84.00",
      hours: 3,
      date: "19 Jan, 2023",
      time: "14:00 PM",
    ),
    Details(
      price: "RM 108.00",
      hours: 4,
      date: "20 Jan, 2023",
      time: "10:00 AM",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            setState(() {
              Navigator.pushNamed(context, '/home');
            });
          },
        ),
        title: const Text(
          'Shopping Cart',
          style: TextStyle(
            fontFamily: 'SF Pro Text',
            fontSize: 23,
          ),
        ),
        centerTitle: true,
        backgroundColor: kActiveColor,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) {
          return ListView(
            children: <Widget>[
              //createHeader(),
              createSubTitle(),

              createCartList(),
              footer(context)
            ],
          );
        },
      ),
    );
  }

  Widget footer(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Total",
                  style: CustomTextStyle.textFormFieldMedium.copyWith(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: 'SF Pro Text',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "RM${totalPrice.toStringAsFixed(2)}",
                  style: CustomTextStyle.textFormFieldBlack.copyWith(
                    color: kActiveColor,
                    fontSize: 22,
                    fontFamily: 'SF Pro Text',
                  ),
                ),
              ),
            ],
          ),
          Utils.getSizedBox(
            height: 8,
          ),
          TextField(
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(
                    left: defaultPadding, right: defaultPadding),
                hintText: ("Enter voucher code"),
                hintStyle: TextStyle(
                  fontFamily: 'SF Pro Text',
                ),
                prefixIcon: Icon(Icons.discount_outlined),
                border: OutlineInputBorder()),
            onSubmitted: (value) {
              setState(
                () {
                  if (vouchers.contains(value) && i < 1) {
                    i++;
                    discount = getDiscount(value);
                    totalPrice -= discount;
                    Fluttertoast.showToast(
                        msg: "Voucher Applied",
                        fontSize: 15.0,
                        textColor: Colors.white,
                        backgroundColor: Colors.green.withOpacity(0.8),
                        gravity: ToastGravity.TOP,
                        toastLength: Toast.LENGTH_LONG);
                  } else if (i > 0) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            "Voucher Already Used!",
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.bold,
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
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kActiveColor,
                              ),
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
                            "Invalid Voucher Code!",
                            style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.bold,
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
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kActiveColor,
                              ),
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
          Utils.getSizedBox(
            height: 18,
          ),
          ElevatedButton(
            onPressed: () async {
              await makePayment();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => bookingDetail(
              //       totalPrice: '',
              //     ),
              //   ),
              // );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  kActiveColor, // MaterialStateProperty.all(kActiveColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              padding: const EdgeInsets.all(20.0),
              elevation: 6,
              minimumSize: const Size(20, 40),
              enabledMouseCursor: SystemMouseCursors.click,
            ),
            child: Text(
              "Checkout",
              style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                color: Colors.white,
                fontFamily: 'SF Pro Text',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Utils.getSizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  createSubTitle() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 12, top: 4),
      child: Text(
        "\nTotal(${details.length - 1}) Items",
        style: CustomTextStyle.textFormFieldBold.copyWith(
          fontSize: 12,
          color: Colors.grey,
          fontFamily: 'SF Pro Text',
        ),
      ),
    );
  }

  createCartList() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return createCartListItem(index + 1);
      },
      itemCount: details.length - 1,
    );
  }

  createCartListItem(int index) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentPage(
                  index: index,
                  value: details[index].time,
                  counter: details[index].hours,
                  Date: details[index].date,
                ),
              ),
            ); //bookingDetail tukar jadi azman punya page
          },
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    color: Colors.blue.shade200,
                    image: DecorationImage(
                      image: AssetImage(companies[index].image),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          companies[index].title,
                          maxLines: 2,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                            fontSize: 16,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Utils.getSizedBox(height: 6),
                      Text(
                        details[index].date,
                        style: CustomTextStyle.textFormFieldRegular.copyWith(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: 'SF Pro Text',
                        ),
                      ),
                      Text(
                        '${details[index].time} - ${int.parse(details[index].time.substring(0, 2)) + details[index].hours}:00 PM',
                        style: CustomTextStyle.textFormFieldRegular.copyWith(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: 'SF Pro Text',
                        ),
                      ),
                      Text(
                        '${details[index].hours} hours',
                        style: CustomTextStyle.textFormFieldRegular.copyWith(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: 'SF Pro Text',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            details[index].price,
                            style: CustomTextStyle.textFormFieldBlack.copyWith(
                              color: kAccentColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ), //ni
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10, top: 8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: kActiveColor,
            ),
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 23,
            ),
          ),
        ),
      ], //ni
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
            builder: (context) => bookingDetail(
                totalPrice: totalPrice.toStringAsFixed(2), discount: discount),
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

class Details {
  String price, date, time;
  int hours;
  Details({
    this.price = '',
    this.hours = 0,
    this.date = '',
    this.time = '',
  });
}
