import 'package:flutter/material.dart';

import '../../../constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        TextButton(
          onPressed: press,
          style: TextButton.styleFrom(foregroundColor: kActiveColor),
          child: const Text('See all'),
        ),
      ],
    );
  }
}
