import 'package:do_clean_application/constants.dart';
import 'package:flutter/material.dart';

class SecScreen extends StatefulWidget {
  const SecScreen({Key? key}) : super(key: key);

  @override
  _FirstScreen createState() => _FirstScreen();
}

class _FirstScreen extends State<SecScreen> {
  List _data = [
    {
      "name": "KitaCuci",
      "image": "asset/images/logoservice_4.png",
      "price": "RM 75.00",
      "date": "9 Jan 2023",
      "time": "1:00 PM - 4:00 PM",
    },
    {
      "name": "Maju Jaya Sdn. Bhd.",
      "image": "asset/images/logoservice_1.png",
      "price": "RM 90.00",
      "date": "20 Dec 2022",
      "time": "2:00 PM - 5:00 PM",
    },
    {
      "name": "Washee Washee",
      "image": "asset/images/logoservice_2.png",
      "price": "RM 112.00",
      "date": "10 Nov 2022",
      "time": "10:00 AM - 2:00 PM",
    },
    {
      "name": "Dust & Dash Ent.",
      "image": "asset/images/logoservice_3.png",
      "price": "RM 162.00",
      "date": "29 Sept 2022",
      "time": "9:00 AM - 3:00 PM",
    },
    {
      "name": "Time N Tidy",
      "image": "asset/images/logoservice_5.png",
      "price": "RM 100.00",
      "date": "18 Nov 2022",
      "time": "1:00 PM - 5:00 PM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 35, 0, 10),
            child: const Text(
              "History",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'SF Pro Text',
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                key:
                ObjectKey(_data[index]);
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 231, 226, 226)),
                    borderRadius: BorderRadius.circular(20),
                    //color: Colors.white70,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox.fromSize(
                            size: Size.fromRadius(47),
                            child: Image(
                              image: AssetImage(_data[index]['image']),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${_data[index]['name']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        fontFamily: 'SF Pro Text',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${_data[index]['date']}',
                                    style: const TextStyle(
                                      fontFamily: 'SF Pro Text',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${_data[index]['time']}',
                                style: const TextStyle(
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${_data[index]['price']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kAccentColor,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Reorder",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontFamily: 'SF Pro Text',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ItemLists {
  String name;
  String image;
  String price;
  String date;
  String time;

  ItemLists(
      {required this.name,
      required this.image,
      required this.price,
      required this.date,
      required this.time});
}
