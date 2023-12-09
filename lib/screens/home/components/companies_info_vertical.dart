import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'package:do_clean_application/theme.dart';

class CompaniesInfoVertical extends StatelessWidget {
  const CompaniesInfoVertical({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
    required this.minHour,
    required this.location,
    required this.rating,
    required this.press,
    required this.shortDesc,
  }) : super(key: key);

  final String title, image, location, price, minHour, shortDesc;
  final double rating;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              image,
              alignment: Alignment.topCenter,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.black54),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      fontFamily: 'SF Pro Text',
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Text(
                      location,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      shortDesc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding / 2,
                              vertical: defaultPadding / 8),
                          decoration: const BoxDecoration(
                            color: kActiveColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                          child: Text(
                            rating.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'SF Pro Text'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Text(
                          price,
                          style: const TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Min: ',
                        style:
                            TextStyle(fontFamily: 'SF Pro Text', fontSize: 15),
                      ),
                      Text(
                        '$minHour  ',
                        style: const TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
        // borderRadius: const BorderRadius.all(
        //   Radius.circular(10),
        // ),
        // onTap: press,
        // children: [
        //   SizedBox(
        //     width: 400,
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         AspectRatio(
        //           aspectRatio: 3,
        //           child: Image.asset(image, alignment: Alignment.centerLeft),
        //         ),
        //         const SizedBox(height: defaultPadding / 2),
        //         Text(
        //           title,
        //           maxLines: 1,
        //           overflow: TextOverflow.ellipsis,
        //           style: Theme.of(context).textTheme.headline6,
        //         ),
        //         Text(
        //           location,
        //           maxLines: 1,
        //           style: const TextStyle(color: kBodyTextColor),
        //         ),
        //         Padding(
        //           padding:
        //               const EdgeInsets.symmetric(vertical: defaultPadding / 2),
        //           child: DefaultTextStyle(
        //             style: const TextStyle(color: Colors.black, fontSize: 12),
        //             child: Row(
        //               children: [
        //                 Container(
        //                   padding: const EdgeInsets.symmetric(
        //                       horizontal: defaultPadding / 2,
        //                       vertical: defaultPadding / 8),
        //                   decoration: const BoxDecoration(
        //                     color: kActiveColor,
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(6),
        //                     ),
        //                   ),
        //                   child: Text(
        //                     rating.toString(),
        //                     style: const TextStyle(
        //                         color: Colors.white, fontSize: 12),
        //                   ),
        //                 ),
        //                 // Spacer(),
        //                 const SizedBox(width: 10),
        //                 Text(price),
        //                 //Spacer(),
        //                 const SizedBox(width: 10),
        //                 const CircleAvatar(
        //                   radius: 2,
        //                   backgroundColor: kActiveColor,
        //                 ),
        //                 //Spacer(),
        //                 const SizedBox(width: 10),
        //                 Text(minHour),
        //               ],
        //             ),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
