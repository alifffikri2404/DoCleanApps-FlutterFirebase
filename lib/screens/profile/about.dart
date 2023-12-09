import 'package:do_clean_application/constants.dart';
import 'package:flutter/material.dart';

class about extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(
            fontFamily: 'SF Pro Text',
            fontSize: 23,
          ),
        ),
        centerTitle: true,
        backgroundColor: kActiveColor,
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          children: const <Widget>[
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                'Cleaning Your Worries Away',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: kAccentColor,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'SF Pro Text',
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'DoClean! is built on the idea that everyone should get a satisfied cleaning service quickly, safely and reliably',
              style: TextStyle(
                fontSize: 17,
                letterSpacing: 1.2,
                height: 1.2,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF Pro Text',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Our goal is simple - to develop a friendly and safe platform for seamless booking',
              style: TextStyle(
                fontSize: 17,
                letterSpacing: 1.2,
                height: 1.2,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF Pro Text',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'DoClean! only take trustworthy and reliable company. We carefully check background of each and everyone for your peace of mind. Our dedicated customer support members are available daily to ensure you have a great experience-every time',
              style: TextStyle(
                fontSize: 17,
                letterSpacing: 1.2,
                height: 1.2,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF Pro Text',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
