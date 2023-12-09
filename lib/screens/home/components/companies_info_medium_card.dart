import 'package:flutter/material.dart';

import '../../../constants.dart';

class CompaniesInfoMediumCard extends StatelessWidget {
  const CompaniesInfoMediumCard({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
    required this.minHour,
    required this.location,
    required this.rating,
    required this.press,
  }) : super(key: key);

  final String title, image, location, price, minHour;
  final double rating;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      onTap: press,
      child: SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.1,
              child: Image.asset(image, alignment: Alignment.centerLeft),
            ),
            const SizedBox(height: defaultPadding / 2),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
              // Theme.of(context).textTheme.headline6,
            ),
            Text(
              location,
              maxLines: 1,
              style: const TextStyle(color: kBodyTextColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              child: DefaultTextStyle(
                style: const TextStyle(color: Colors.black, fontSize: 12),
                child: Row(
                  children: [
                    Container(
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
                            fontSize: 12,
                            fontFamily: 'SF Pro Text'),
                      ),
                    ),
                    // Spacer(),
                    const SizedBox(width: 10),
                    Text(
                      price,
                      style: const TextStyle(fontFamily: 'SF Pro Text'),
                    ),

                    //Spacer(),
                    const SizedBox(width: 8),
                    const CircleAvatar(
                      radius: 2,
                      backgroundColor: kActiveColor,
                    ),
                    //Spacer(),
                    const SizedBox(width: 8),
                    Text(
                      minHour,
                      style: const TextStyle(fontFamily: 'SF Pro Text'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
