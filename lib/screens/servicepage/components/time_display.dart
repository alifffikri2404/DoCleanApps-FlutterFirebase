import 'package:do_clean_application/constants.dart';
import 'package:flutter/material.dart';

class TimeDisplay extends StatefulWidget {
  const TimeDisplay({
    Key? key,
    required this.selectedValue,
    required this.counter,
  }) : super(key: key);

  final String? selectedValue;
  final ValueNotifier<int> counter;

  @override
  State<TimeDisplay> createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  String selectedValue = 'No Time';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // if (widget.selectedValue != null &&
        //     (int.parse(widget.selectedValue!.substring(0, 2)) +
        //             widget.counter.value) <
        //         12)
        //   ValueListenableBuilder(
        //       valueListenable: widget.counter,
        //       builder: (context, value, child) {
        //         if (widget.selectedValue != null &&
        //             (int.parse(widget.selectedValue!.substring(0, 2)) +
        //                     widget.counter.value) <
        //                 12) {
        //           return Text(
        //             '${((int.parse(
        //                   widget.selectedValue!.substring(0, 2),
        //                 )) + widget.counter.value)}:00 AM',
        //             style: const TextStyle(
        //               fontFamily: 'SF Pro Text',
        //               fontSize: 25,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           );
        //         }
        //         if (widget.selectedValue != null &&
        //             (int.parse(
        //                       widget.selectedValue!.substring(0, 2),
        //                     ) +
        //                     widget.counter.value) >
        //                 12) {
        //           return Text(
        //             '${((int.parse(
        //                   widget.selectedValue!.substring(0, 2),
        //                 )) + widget.counter.value)}:00 PM',
        //             style: const TextStyle(
        //               fontFamily: 'SF Pro Text',
        //               fontSize: 25,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           );
        //         }
        //         if (widget.selectedValue != null &&
        //             (int.parse(
        //                       widget.selectedValue!.substring(0, 2),
        //                     ) +
        //                     widget.counter.value) ==
        //                 12) {
        //           return Text(
        //             '${((int.parse(
        //                   widget.selectedValue!.substring(0, 2),
        //                 )) + widget.counter.value)}:00 PM',
        //             style: const TextStyle(
        //               fontFamily: 'SF Pro Text',
        //               fontSize: 25,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           );
        //         }
        //         return const Text(
        //           '',
        //           style: TextStyle(color: kActiveColor),
        //         );
        //       }),
        // if (widget.selectedValue != null &&
        //     (int.parse(
        //               widget.selectedValue!.substring(0, 2),
        //             ) +
        //             widget.counter.value) >
        //         12)
        //   ValueListenableBuilder(
        //     valueListenable: widget.counter,
        //     builder: (context, value, child) {
        //       if (widget.selectedValue != null &&
        //           (int.parse(
        //                     widget.selectedValue!.substring(0, 2),
        //                   ) +
        //                   widget.counter.value) <
        //               12) {
        //         return Text(
        //           '${((int.parse(
        //                 widget.selectedValue!.substring(0, 2),
        //               )) + widget.counter.value)}:00 PM',
        //           style: const TextStyle(
        //             fontFamily: 'SF Pro Text',
        //             fontSize: 25,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         );
        //       }
        //       if (widget.selectedValue != null &&
        //           (int.parse(
        //                     widget.selectedValue!.substring(0, 2),
        //                   ) +
        //                   widget.counter.value) >
        //               12) {
        //         return Text(
        //           '${((int.parse(
        //                 widget.selectedValue!.substring(0, 2),
        //               )) + widget.counter.value)}:00 PM',
        //           style: const TextStyle(
        //             fontFamily: 'SF Pro Text',
        //             fontSize: 25,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         );
        //       }
        //       if (widget.selectedValue != null &&
        //           (int.parse(
        //                     widget.selectedValue!.substring(0, 2),
        //                   ) +
        //                   widget.counter.value) ==
        //               12) {
        //         return Text(
        //           '${((int.parse(
        //                 widget.selectedValue!.substring(0, 2),
        //               )) + widget.counter.value)}:00 PM',
        //           style: const TextStyle(
        //             fontFamily: 'SF Pro Text',
        //             fontSize: 25,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         );
        //       }
        //       return const Text(
        //         '',
        //         style: TextStyle(color: kActiveColor),
        //       );
        //     },
        //   ),
        // if (widget.selectedValue != null &&
        //     (int.parse(
        //               widget.selectedValue!.substring(0, 2),
        //             ) +
        //             widget.counter.value) ==
        //         12)
        //   ValueListenableBuilder(
        //     valueListenable: widget.counter,
        //     builder: (context, value, child) {
        //       if (widget.selectedValue != null &&
        //           (int.parse(
        //                     widget.selectedValue!.substring(0, 2),
        //                   ) +
        //                   widget.counter.value) <
        //               12) {
        //         return Text(
        //           '${((int.parse(
        //                 widget.selectedValue!.substring(0, 2),
        //               )) + widget.counter.value)}:00 AM',
        //           style: const TextStyle(
        //             fontFamily: 'SF Pro Text',
        //             fontSize: 25,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         );
        //       }
        //       if (widget.selectedValue != null &&
        //           (int.parse(widget.selectedValue!.substring(0, 2)) +
        //                   widget.counter.value) >
        //               12) {
        //         return Text(
        //           '${((int.parse(
        //                 widget.selectedValue!.substring(0, 2),
        //               )) + widget.counter.value)}:00 PM',
        //           style: const TextStyle(
        //             fontFamily: 'SF Pro Text',
        //             fontSize: 25,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         );
        //       }
        //       if (widget.selectedValue != null &&
        //           (int.parse(
        //                     widget.selectedValue!.substring(0, 2),
        //                   ) +
        //                   widget.counter.value) ==
        //               12) {
        //         return Text(
        //           '${((int.parse(widget.selectedValue!.substring(0, 2))) + widget.counter.value)}:00 PM',
        //           style: const TextStyle(
        //             fontFamily: 'SF Pro Text',
        //             fontSize: 25,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         );
        //       }
        //       return const Text(
        //         '',
        //         style: TextStyle(color: kActiveColor),
        //       );
        //     },
        //   ),
        if (widget.selectedValue != null &&
            (int.parse(widget.selectedValue!.substring(0, 2)) +
                    widget.counter.value) <
                12)
          ValueListenableBuilder(
            valueListenable: widget.counter,
            builder: (context, value, child) {
              if (widget.selectedValue != null &&
                  (int.parse(widget.selectedValue!.substring(0, 2)) +
                          widget.counter.value) <
                      12) {
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 13, 40, 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: kAccentColor,
                        border: Border.all(color: Colors.black26, width: 2),
                      ),
                      child: Text(
                        '${((int.parse(widget.selectedValue!.substring(0, 2))) + widget.counter.value)}:00 AM',
                        style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (widget.selectedValue != null &&
                  (int.parse(widget.selectedValue!.substring(0, 2)) +
                          widget.counter.value) >
                      12) {
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 13, 40, 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: kAccentColor,
                        border: Border.all(color: Colors.black26, width: 2),
                      ),
                      child: Text(
                        '${((int.parse(widget.selectedValue!.substring(0, 2))) + widget.counter.value)}:00 PM',
                        style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (widget.selectedValue != null &&
                  (int.parse(widget.selectedValue!.substring(0, 2)) +
                          widget.counter.value) ==
                      12) {
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 13, 40, 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: kAccentColor,
                        border: Border.all(color: Colors.black26, width: 2),
                      ),
                      child: Text(
                        '${((int.parse(widget.selectedValue!.substring(0, 2))) + widget.counter.value)}:00 PM',
                        style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Text('');
            },
          ),
        if (widget.selectedValue != null &&
            (int.parse(widget.selectedValue!.substring(0, 2)) +
                    widget.counter.value) >
                12)
          ValueListenableBuilder(
            valueListenable: widget.counter,
            builder: (context, value, child) {
              if (widget.selectedValue != null &&
                  (int.parse(widget.selectedValue!.substring(0, 2)) +
                          widget.counter.value) <
                      12) {
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 13, 40, 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: kAccentColor,
                        border: Border.all(color: Colors.black26, width: 2),
                      ),
                      child: Text(
                        '${((int.parse(widget.selectedValue!.substring(0, 2))) + widget.counter.value)}:00 PM',
                        style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (widget.selectedValue != null &&
                  (int.parse(widget.selectedValue!.substring(0, 2)) +
                          widget.counter.value) >
                      12) {
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 13, 40, 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: kAccentColor,
                        border: Border.all(color: Colors.black26, width: 2),
                      ),
                      child: Text(
                        '${((int.parse(widget.selectedValue!.substring(0, 2))) + widget.counter.value)}:00 PM',
                        style: const TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                );
              }
              if (widget.selectedValue != null &&
                  (int.parse(widget.selectedValue!.substring(0, 2)) +
                          widget.counter.value) ==
                      12) {
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 13, 40, 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: kAccentColor,
                        border: Border.all(color: Colors.black26, width: 2),
                      ),
                      child: Text(
                        '${((int.parse(widget.selectedValue!.substring(0, 2))) + widget.counter.value)}:00 PM',
                        style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Text('');
            },
          ),
        if (widget.selectedValue != null &&
            (int.parse(widget.selectedValue!.substring(0, 2)) +
                    widget.counter.value) ==
                12)
          ValueListenableBuilder(
            valueListenable: widget.counter,
            builder: (context, value, child) {
              if (widget.selectedValue != null &&
                  (int.parse(widget.selectedValue!.substring(0, 2)) +
                          widget.counter.value) <
                      12) {
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 13, 40, 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: kAccentColor,
                        border: Border.all(color: Colors.black26, width: 2),
                      ),
                      child: Text(
                        '${((int.parse(widget.selectedValue!.substring(0, 2))) + widget.counter.value)}:00 AM',
                        style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (widget.selectedValue != null &&
                  (int.parse(widget.selectedValue!.substring(0, 2)) +
                          widget.counter.value) >
                      12) {
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 13, 40, 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: kAccentColor,
                        border: Border.all(color: Colors.black26, width: 2),
                      ),
                      child: Text(
                        '${((int.parse(widget.selectedValue!.substring(0, 2))) + widget.counter.value)}:00 PM',
                        style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (widget.selectedValue != null &&
                  (int.parse(widget.selectedValue!.substring(0, 2)) +
                          widget.counter.value) ==
                      12) {
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 13, 40, 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: kAccentColor,
                        border: Border.all(color: Colors.black26, width: 2),
                      ),
                      child: Text(
                        '${((int.parse(widget.selectedValue!.substring(0, 2))) + widget.counter.value)}:00 PM',
                        style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Text('');
            },
          ),
      ],
    );
  }
}
