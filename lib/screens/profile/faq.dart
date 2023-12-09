import 'package:do_clean_application/constants.dart';
import 'package:flutter/material.dart';

class faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAQ',
          style: TextStyle(
            fontFamily: 'SF Pro Text',
            fontSize: 23,
          ),
        ),
        centerTitle: true,
        backgroundColor: kActiveColor,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(24),
            child: Column(
              children: const <Widget>[
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Frequently Asked Question',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: kAccentColor,
                      fontFamily: 'SF Pro Text',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'What is DoClean!?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Text',
                  ),
                  textAlign: TextAlign.right,
                ),
                Divider(
                  color: kAccentColor,
                  thickness: 2,
                  indent: 100,
                  endIndent: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'DoClean! is an application that offer solutions only with the tap of your finger.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'What type of service you provide?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Text',
                  ),
                  textAlign: TextAlign.right,
                ),
                Divider(
                  color: kAccentColor,
                  thickness: 2,
                  indent: 100,
                  endIndent: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'At this moment, we only provide Basic House cleaning. Currently there is no post-renovation cleaning service.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Should I pick up the cleaner?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Text',
                  ),
                  textAlign: TextAlign.right,
                ),
                Divider(
                  color: kAccentColor,
                  thickness: 2,
                  indent: 100,
                  endIndent: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'No. No need to pick up the cleaner since the cleaner will come by their own transport.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'How do I file a complaint?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Text',
                  ),
                  textAlign: TextAlign.right,
                ),
                Divider(
                  color: kAccentColor,
                  thickness: 2,
                  indent: 100,
                  endIndent: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'To file a complaint, just contact us at 019-8765432 (WhatsApp).',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'How do I know booking is successful?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF Pro Text',
                  ),
                  textAlign: TextAlign.center,
                ),
                Divider(
                  color: kAccentColor,
                  thickness: 2,
                  indent: 100,
                  endIndent: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'After you made a booking, you will receive a confirmation through email and can check at activity page.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
