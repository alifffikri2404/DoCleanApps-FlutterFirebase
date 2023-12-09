import 'package:do_clean_application/screens/login/pages/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:do_clean_application/constants.dart';
import 'package:do_clean_application/demoData.dart';
import 'package:do_clean_application/screens/home/components/companies_info_vertical.dart';
import 'package:do_clean_application/screens/profile/activity_history_main.dart';
import 'package:do_clean_application/screens/servicepage/service_detail_page.dart';
import 'package:get/get.dart';

import 'components/bouncing_button.dart';
import 'components/companies_info_medium_card.dart';
import 'components/image_carousel.dart';
import 'components/section_title.dart';
import 'components/main_drawer.dart';
import 'package:do_clean_application/screens/profile/settings.dart';
import 'package:do_clean_application/screens/profile/about.dart';
import 'package:do_clean_application/screens/profile/activity_history_main.dart';
import 'package:do_clean_application/screens/profile/faq.dart';

// class PageRouteFunction extends StatelessWidget {
//   const PageRouteFunction({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => HomeScreen(),
//         '/history': (context) => activityHistory(),
//         '/settings': (context) => AccountSettings(),
//         '/faq': (context) => faq(),
//         '/abt': (context) => about(),
//       },
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  final user = FirebaseAuth.instance.currentUser!;
  late String valueText;
  TextEditingController _textFieldController = TextEditingController();

  String? name = '';
  String? email = '';
  String? phoneNum = '';
  String? location = '';

  Future getData() async {
    await FirebaseFirestore.instance
        .collection('UserData')
        .doc(user.email)
        .get()
        .then(
      (snapshot) async {
        if (snapshot.exists) {
          setState(
            () {
              name = snapshot.data()!["Name"];
              email = snapshot.data()!["Email"];
              phoneNum = snapshot.data()!["PhoneNumber"];
              location = snapshot.data()!["Location"];
            },
          );
        }
      },
    );
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: kAccentColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: kBgColor,
            iconColor: kBgColor,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 24.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('asset/images/latte.jpg'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Welcome back!',
                      style: TextStyle(
                        fontSize: 18,
                        color: kBgColor,
                        fontFamily: 'SF Pro Text',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name!,
                      style: const TextStyle(
                        fontSize: 23,
                        color: kBgColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SF Pro Text',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.email!,
                      style: const TextStyle(
                        fontSize: 19,
                        color: kBgColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SF Pro Text',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // ListTile(
                //   leading: const Icon(
                //     Icons.home_sharp,
                //     color: kBgColor,
                //   ),
                //   title: const Text(
                //     'Home',
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontFamily: 'SF Pro Text',
                //     ),
                //   ),
                //   onTap: () {
                //     Navigator.pushNamed(context, '/home');
                //   },
                // ),
                ListTile(
                  leading: const Icon(
                    Icons.dashboard_customize_sharp,
                    color: kBgColor,
                  ),
                  title: const Text(
                    'Activity History',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SF Pro Text',
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/history');
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.account_circle_sharp,
                    color: kBgColor,
                  ),
                  title: const Text(
                    'Account Setting',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SF Pro Text',
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
                ExpansionTile(
                  collapsedIconColor: kBgColor,
                  iconColor: kBgColor,
                  leading: const Icon(Icons.help_sharp),
                  title: const Text(
                    'Help',
                    style: TextStyle(
                      color: kBgColor,
                      fontSize: 20,
                      fontFamily: 'SF Pro Text',
                    ),
                  ),
                  childrenPadding: const EdgeInsets.only(left: 60),
                  children: [
                    ListTile(
                      title: const Text(
                        'FAQ',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                        ),
                      ),
                      leading: const Icon(Icons.question_mark),
                      onTap: () {
                        Navigator.pushNamed(context, '/faq');
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'About Us',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                        ),
                      ),
                      leading: const Icon(Icons.people_outlined),
                      onTap: () {
                        Navigator.pushNamed(context, '/abt');
                      },
                    ),
                  ],
                ),
                // const SizedBox(
                //   height: 30,
                // ),
                ListTile(
                  leading: const Icon(
                    Icons.logout_sharp,
                    color: kBgColor,
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SF Pro Text',
                    ),
                  ),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, '/');
                  },
                ),
                const Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 25.0),
                    child: const Text(
                      'Terms of Service',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      children: [],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              // to scroll the screen
              // expandedHeight: 60,
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              floating: true,
              title: Column(
                children: [
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  Text(
                    'Cleaning to'.toUpperCase(),
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: kActiveColor,
                          fontFamily: 'SF Pro Text',
                        ),
                  ),
                  Text(
                    location!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SF Pro Text',
                    ),
                  ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: kBgColor,
                  //     shadowColor: Colors.transparent,
                  //   ),
                  //   child: Text(
                  //     codeDialog,
                  //     style:
                  //         const TextStyle(fontSize: 20, color: kMainColor),
                  //   ),
                  //   onPressed: () {
                  //     showLocationDialog(context);
                  //   },
                  // ),
                ],
              ),
              leading: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      key: ValueKey<bool>(value.visible),
                      child: Icon(value.visible ? Icons.clear : Icons.menu),
                    );
                  },
                ),
                color: kActiveColor,
              ),
              actions: [
                // TextButton(
                //   onPressed: () {
                //     showLocationDialog(context);
                //   },
                //   child: const Text(
                //     'Filter',
                //     style: TextStyle(color: Colors.black),
                //   ),
                // ),
                IconButton(
                  onPressed: () {
                    //showLocationDialog(context);
                  },
                  icon: const Icon(
                    Icons.location_searching_sharp,
                    color: kActiveColor,
                  ),
                ),
              ],
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              sliver: SliverToBoxAdapter(
                child: ImageCarousel(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
                vertical: 15,
              ),
              sliver: SliverToBoxAdapter(
                child: SectionTitle(
                  title: 'Best Choices',
                  press: () {},
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    bestChoiceCardData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: defaultPadding),
                      child: CompaniesInfoMediumCard(
                        title: demoMediumCardData[index]['name'],
                        location: demoMediumCardData[index]['location'],
                        image: demoMediumCardData[index]['image'],
                        rating: demoMediumCardData[index]['rating'],
                        minHour: demoMediumCardData[index]['minHour'],
                        price: demoMediumCardData[index]['price'],
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ServiceDetailPage(index: index),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Image.asset('asset/images/banner_ads_1.png'),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Deals Around You',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  //press: () {},
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, index) {
                  // Row(
                  //   children: List.generate(
                  //     demoMediumCardData.length,
                  //     (index) => Padding(
                  //       padding: const EdgeInsets.only(left: defaultPadding),
                  //       child: CompaniesInfoMediumCard(
                  //         title: demoMediumCardData[index]['name'],
                  //         location: demoMediumCardData[index]['location'],
                  //         image: demoMediumCardData[index]['image'],
                  //         rating: demoMediumCardData[index]['rating'],
                  //         minHour: demoMediumCardData[index]['minHour'],
                  //         price: demoMediumCardData[index]['price'],
                  //         press: () {},
                  //       ),
                  //     ),
                  //   ),
                  // );
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: List.generate(
                        demoMediumCardData.length,
                        (index) => Padding(
                          padding:
                              const EdgeInsets.only(bottom: defaultPadding),
                          child: CompaniesInfoVertical(
                            title: demoMediumCardData[index]['name'],
                            location: demoMediumCardData[index]['location'],
                            image: demoMediumCardData[index]['image'],
                            rating: demoMediumCardData[index]['rating'],
                            minHour: demoMediumCardData[index]['minHour'],
                            price: demoMediumCardData[index]['price'],
                            shortDesc: demoMediumCardData[index]['shortDesc'],
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ServiceDetailPage(index: index),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
        floatingActionButton: BouncingButton(),
      ),
    );
  }

  showLocationDialog(BuildContext context) {
    Widget saveButton = TextButton(
      style: TextButton.styleFrom(backgroundColor: kActiveColor),
      child: const Text(
        'OK',
        style: TextStyle(
          color: kBgColor,
          fontFamily: 'SF Pro Text',
        ),
      ),
      onPressed: () {
        setState(() {
          // codeDialog = valueText;
          // Navigator.pushNamed(context, '/');
        });
      },
    );

    Widget cancelButton = TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.deepPurple[500],
      ),
      child: const Text(
        'Cancel',
        style: TextStyle(
          color: kBgColor,
          fontFamily: 'SF Pro Text',
        ),
      ),
      onPressed: () {
        setState(() {
          Navigator.pushNamed(context, '/');
        });
      },
    );

    AlertDialog locationDialog = AlertDialog(
      title: const Text('Please add your current location'),
      content: TextField(
        onChanged: (value) {
          setState(
            () {
              valueText = value;
            },
          );
        },
        controller: _textFieldController,
        decoration: const InputDecoration(
          hintText: 'Your current location',
          hintStyle: TextStyle(fontFamily: 'SF Pro Text'),
        ),
      ),
      actions: <Widget>[
        saveButton,
        cancelButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return locationDialog;
      },
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
