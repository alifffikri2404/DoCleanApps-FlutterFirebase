import 'package:do_clean_application/constants.dart';
import 'package:flutter/material.dart';
import 'package:do_clean_application/screens/servicepage/components/company_data_service.dart';
import 'package:intl/intl.dart';
import 'package:do_clean_application/screens/home/home_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:math';

import '../payment/payment_page.dart';
import 'components/time_display.dart';

ValueNotifier<int> counter = ValueNotifier(0);

class ServiceDetailPage extends StatefulWidget {
  final Company? company;
  final int index;

  const ServiceDetailPage({Key? key, this.company, required this.index})
      : super(key: key);

  @override
  State<ServiceDetailPage> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<ServiceDetailPage> {
  bool _isPressed = false;
  int counterfinal = 0;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = false;
  late final ValueNotifier<int> counter =
      ValueNotifier(companies[widget.index].hour);
  final List<String> time = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
  ];
  late final List<String> items = [
    '${time[7]}:00 AM',
    '${time[8]}:00 AM',
    '${time[9]}:00 AM',
    '${time[10]}:00 AM',
    '${time[11]}:00 PM',
    '${time[12]}:00 PM',
    '${time[13]}:00 PM',
  ];

  String? selectedValue;

  void _incrementCounter() {
    if (counter.value < 8) {
      counter.value++;
    }
  }

  void _decrementCounter() {
    if (counter.value > companies[widget.index].hour) {
      counter.value--;
    }
  }

  void _resetCounter() {
    counter.value = companies[widget.index].hour;
  }

  // Select for Date
  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: kAccentColor, // header background color
              onPrimary: kBgColor, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: kAccentColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (selected != null && selected != selectedDate) {
      setState(
        () {
          selectedDate = selected;
        },
      );
    }
    return selectedDate;
  }

  // select date time picker

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // Wrap the eleveated button at the center of the screen body
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                  height: max(1700, constraints.maxHeight)),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: 400,
                      //height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          image: AssetImage(
                            companies[widget.index].image,
                          ),
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.topCenter,
                        ),
                        //backgroundBlendMode: BlendMode.darken,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 50,
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        ),
                        _resetCounter()
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                        size: 35,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 370,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      height: 1480,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.5),
                            offset: const Offset(0, -5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 12, 0, 0),
                                        child: Text(
                                          companies[widget.index].title,
                                          style: const TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  //mainAxisSize: MainAxisSize.values(10),
                                  children: [
                                    Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 25,
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
                                              fontSize: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_pin,
                                      size: 25,
                                      color: kAccentColor,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      companies[widget.index].location,
                                      style: const TextStyle(
                                        fontFamily: 'SF Pro Text',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 70,
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'About Us',
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
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                  companies[widget.index].aboutus,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 70,
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'Price and Details',
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
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              const Icon(
                                Icons.monetization_on,
                                color: kAccentColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  'RM${companies[widget.index].price}/hour',
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              const Icon(
                                Icons.access_time,
                                color: kAccentColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  'Minimum ${companies[widget.index].hour} hour',
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 70,
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'Recommendation',
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
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 18),
                                child: Icon(
                                  Icons.thumb_up,
                                  color: kAccentColor,
                                  size: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                  companies[widget.index].recommendation,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 70,
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'Cleaning Duration',
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () => {_decrementCounter()},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.black38),
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: kAccentColor,
                                      size: 35,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ValueListenableBuilder(
                                valueListenable: counter,
                                builder: (context, value, child) {
                                  counterfinal = counter.value;
                                  return Text(
                                    '${(counter.value)} hour',
                                    style: const TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () => {_incrementCounter()},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black38)),
                                    child: const Icon(
                                      Icons.add,
                                      size: 35,
                                      color: kAccentColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // const SizedBox(
                          //   height: 70,
                          //   child: Divider(
                          //     thickness: 2,
                          //   ),
                          // ),
                          // Row(
                          //   children: const [
                          //     Expanded(
                          //       child: Text(
                          //         'Choose Date',
                          //         style: TextStyle(
                          //           fontFamily: 'SF Pro Text',
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 25,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(
                          //   height: 25,
                          // ),
                          // Row(
                          //   children: [
                          //     // padding: EdgeInsets.fromLTRB(25, 0, 0, 0),

                          //     Expanded(
                          //       //padding: const EdgeInsets.symmetric(horizontal: 15),
                          //       //width: 150,
                          //       child: ElevatedButton(
                          //         onPressed: () {
                          //           _selectDate(context);
                          //           showDate = true;
                          //         },
                          //         style: ElevatedButton.styleFrom(
                          //             backgroundColor: Colors.white,
                          //             side: const BorderSide(
                          //                 color: Colors.white, width: 2)),
                          //         child: const Text(
                          //           'Date Availability',
                          //           style: TextStyle(
                          //             color: Colors.black,
                          //             fontFamily: ('SF Pro Text'),
                          //           ),
                          //         ),
                          //       ),
                          //     ),

                          //     const SizedBox(
                          //       width: 20,
                          //     ),
                          //     showDate
                          //         ? Center(
                          //             child: Text(
                          //               getDate(),
                          //               style: const TextStyle(
                          //                   fontFamily: ('SF Pro Text'),
                          //                   fontSize: 16,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //           )
                          //         : const SizedBox(),
                          //   ],
                          // ),
                          // const SizedBox(
                          //   height: 70,
                          //   child: Divider(
                          //     thickness: 2,
                          //   ),
                          // ),
                          const SizedBox(
                            height: 30,
                          ),
                          const SizedBox(
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 60,
                                child: TextButton(
                                  onPressed: () {
                                    _selectDate(context);
                                    showDate = true;
                                    setState(() {
                                      _isPressed = true;
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: _isPressed
                                        ? Colors.white
                                        : Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            'Choose Date',
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                                color: Colors.black),
                                          ),
                                          showDate
                                              ? Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                            Icons
                                                                .calendar_month_rounded,
                                                            color:
                                                                kAccentColor),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          getDate(),
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                ('SF Pro Text'),
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : const SizedBox()
                                        ],
                                      ),
                                      // const SizedBox(
                                      //   width: 117,
                                      // ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: kAccentColor,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const SizedBox(
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'Desired Time',
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
                              Container(
                                //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    hint: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Select Time',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: items
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontFamily: 'SF Pro Text',
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value as String;
                                      });
                                    },
                                    buttonHeight: 50,
                                    buttonWidth: 130,
                                    buttonPadding:
                                        const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: Colors.black26,
                                        width: 2,
                                      ),
                                      color: kAccentColor,
                                    ),
                                    buttonElevation: 0,
                                    itemHeight: 40,
                                    itemPadding: const EdgeInsets.only(
                                      left: 10,
                                      right: 0,
                                    ),
                                    dropdownMaxHeight: 120,
                                    dropdownWidth: 120,
                                    dropdownPadding:
                                        EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: kActiveColor,
                                    ),
                                    dropdownElevation: 8,
                                    scrollbarRadius: const Radius.circular(40),
                                    scrollbarThickness: 6,
                                    scrollbarAlwaysShow: false,
                                    offset: const Offset(0, 0),
                                  ),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 20,
                              // ),
                              const Spacer(),
                              const Icon(
                                Icons.remove,
                                size: 30,
                                color: kAccentColor,
                              ),
                              const Spacer(),
                              TimeDisplay(
                                  selectedValue: selectedValue,
                                  counter: counter),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Other widgets go here
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        child: BottomAppBar(
          child: Container(
            padding: const EdgeInsets.only(left: defaultPadding),
            color: kActiveColor,
            height: 75.0,
            child: Row(
              children: [
                // Text(
                //   '$selectedValue',
                //   style: const TextStyle(
                //     fontFamily: 'SF Pro Text',
                //     fontSize: 17,
                //     fontWeight: FontWeight.w400,
                //     color: Colors.white,
                //   ),
                // ),
                // const SizedBox(
                //   width: 10,
                // ),
                const SizedBox(
                  width: 12,
                ),
                ValueListenableBuilder(
                  valueListenable: counter,
                  builder: (context, value, child) {
                    return Text(
                      'RM${(counter.value.toDouble() * companies[widget.index].price).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
                const Spacer(),
                Padding(
                  // padding: const EdgeInsets.fromLTRB(120, 0, 20, 0),
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: SizedBox(
                    height: 40,
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[100]),
                      onPressed: () => {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PaymentPage(
                        //             index: widget.index, value: selectedValue))),
                        // _resetCounter(),

                        if (selectedValue != null)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentPage(
                                index: widget.index,
                                value: selectedValue,
                                counter: counterfinal,
                                Date: getDate(),
                              ),
                            ),
                          ),
                        _resetCounter(),
                      },
                      child: Text(
                        'Reserve',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
