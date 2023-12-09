import 'package:do_clean_application/constants.dart';
import 'package:flutter/material.dart';
import 'package:do_clean_application/screens/profile/upcoming_activity.dart';
import 'package:do_clean_application/screens/profile/outgoing_activity.dart';

class activityHistory extends StatefulWidget {
  const activityHistory({Key? key}) : super(key: key);

  @override
  _activityHistory createState() => _activityHistory();
}

class _activityHistory extends State<activityHistory> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Activity History',
              style: TextStyle(
                fontFamily: 'SF Pro Text',
                fontSize: 23,
              ),
            ),
            backgroundColor: kActiveColor,
            bottom: const TabBar(
              indicatorColor: kActiveColor,
              labelStyle: TextStyle(
                fontFamily: 'SF Pro Text',
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'SF Pro Text',
              ),
              tabs: [Tab(text: 'Upcoming'), Tab(text: 'History')],
            ),
          ),
          body: const TabBarView(
            children: [
              FirstScreen(),
              SecScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
