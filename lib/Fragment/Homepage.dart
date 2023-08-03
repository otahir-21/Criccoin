import 'package:carousel_slider/carousel_slider.dart';
import 'package:criccoin/DrawerItem/AccountSetting.dart';
import 'package:criccoin/DrawerItem/HelpAndSupport.dart';
import 'package:criccoin/DrawerItem/Wallet.dart';
import 'package:criccoin/Filter/Preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../DrawerItem/Invite.dart';
import '../DrawerItem/NotificationClass.dart';
import '../Filter/DiscoverFilter.dart';
import 'Profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var color = Colors.white;
  var transparent = Colors.transparent;
  bool press = false;
  bool press2 = false;

  List<String> banners = ['https://criccoin.b-cdn.net/images/7265033.jpg', 'https://criccoin.b-cdn.net/images/banner2.jpg'];


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: height * 0.18,
            width: double.infinity,
            alignment: Alignment.bottomRight,
            child: CarouselSlider(
              items: [
                for (int i = 0; i < banners.length; i++)
                  SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      banners[i].toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                // Other images can be added here in the same format
              ],
              options: CarouselOptions(
                height: double.infinity,
                aspectRatio: 16 / 1,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),

          SizedBox(
            height: height * 0.02,
          ),
          Container(
            height: height * 0.06,
            margin: EdgeInsets.only(
              left: height * 0.03,
              right: height * 0.03,
            ),
            decoration: const BoxDecoration(
                color: Color(0xff9cdbfc),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      press == true ?
                      press == true ? press = false : press = true :
                          null;
                    });
                  },
                  child: Container(
                    height: height * 0.057,
                    width: width * 0.43,
                    decoration: BoxDecoration(
                        color: press == false ? color : transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Center(
                      child: Text(
                        "Upcoming",
                        style: TextStyle(
                          color: const Color(0xff5E849C),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.018,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      press == false ?
                      press == false ? press = true : press = false: null;
                    });
                  },
                  child: Container(
                    height: height * 0.057,
                    width: width * 0.43,
                    decoration: BoxDecoration(
                        color: press == true ? color : transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Center(
                      child: Text(
                        "Recent",
                        style: TextStyle(
                          color: const Color(0xff5E849C),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.018,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          press == false
              ? SizedBox(
                  height: height * 0.70,
                  width: width * 0.12,
                  child: Stack(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            'assets/banner/ipl.png',
                            fit: BoxFit.fill,
                          )),
                      Positioned(
                        top: height * 0.07,
                        left: height * 0.03,
                        bottom: height * 0.16,
                        child: SizedBox(
                          height: height * 0.20,
                          width: width * 0.90,
                          child: ListView.builder(
                            shrinkWrap: false,
                            scrollDirection: Axis.vertical,
                            itemCount: 7,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 0.1,
                                child: Container(
                                  height: height * 0.168,
                                  width: width * 0.85,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Container(
                                        height: height * 0.02,
                                        width: width * 0.80,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Tata Ipl",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                            fontSize: height * 0.017,
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        indent: 12,
                                        endIndent: 12,
                                        color: Colors.black,
                                        thickness: 0.3,
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                        width: width * 0.8,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Kolkata Knight Riders",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                                fontSize: height * 0.014,
                                              ),
                                            ),
                                            Text(
                                              "Chennai Super Kings",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                                fontSize: height * 0.014,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                        width: width * 0.77,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Icon(Icons.ice_skating),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                Text(
                                                  "Kkr ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: height * 0.017,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Csk",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: height * 0.017,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                const Icon(Icons.ice_skating),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "03h 30m 02s left",
                                        style: TextStyle(
                                          color: const Color(0xffFF0000),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w400,
                                          fontSize: height * 0.017,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.80,
                                        height: height * 0.03,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: height * 0.03,
                                              width: width * 0.35,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff0BA4F6),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                  )),
                                              child: Text(
                                                "Today, 1:00 pm",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xffFFFFFF),
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: height * 0.017,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (){
                                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Preference()));
                                              },
                                              child: Container(
                                                  height: height * 0.03,
                                                  width: width * 0.35,
                                                  decoration: const BoxDecoration(
                                                      color: Color(0xff0BA4F6),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                      )),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "Start Prediction",
                                                        style: TextStyle(
                                                          color: const Color(
                                                              0xffFFFFFF),
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize:
                                                              height * 0.017,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      const Icon(
                                                        Icons
                                                            .center_focus_strong_rounded,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  )),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  height: height * 0.70,
                  width: width * 0.12,
                  child: Stack(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            'assets/banner/ipl.png',
                            fit: BoxFit.fill,
                          )),
                      Positioned(
                        top: height * 0.07,
                        left: height * 0.03,
                        bottom: height * 0.16,
                        child: Container(
                          color: Colors.white10,
                          height: height * 0.9,
                          width: width * 0.9,
                          child: ListView.builder(
                            shrinkWrap: false,
                            scrollDirection: Axis.vertical,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 0.1,
                                child: Container(
                                  height: height * 0.169,
                                  width: width * 0.85,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Container(
                                        height: height * 0.02,
                                        width: width * 0.80,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Tatssa Ipl",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                            fontSize: height * 0.017,
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        indent: 12,
                                        endIndent: 12,
                                        color: Colors.black,
                                        thickness: 0.3,
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                        width: width * 0.8,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Kolkata Knight Riders",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                                fontSize: height * 0.014,
                                              ),
                                            ),
                                            Text(
                                              "Chennai Super Kings",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                                fontSize: height * 0.014,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                        width: width * 0.77,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Icon(Icons.ice_skating),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                Text(
                                                  "Kkr ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: height * 0.017,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Csk",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: height * 0.017,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                const Icon(Icons.ice_skating),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "Completed",
                                        style: TextStyle(
                                          color: const Color(0xffFF0000),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w400,
                                          fontSize: height * 0.017,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.80,
                                        height: height * 0.03,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: height * 0.03,
                                              width: width * 0.35,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff0BA4F6),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                  )),
                                              child: Text(
                                                "Today, 1:00 pm",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xffFFFFFF),
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: height * 0.017,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Container(
                                                height: height * 0.03,
                                                width: width * 0.35,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xff0BA4F6),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10),
                                                    )),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      "You Won 145 CC",
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xffFFFFFF),
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize:
                                                            height * 0.015,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    const Icon(
                                                      Icons
                                                          .center_focus_strong_rounded,
                                                      color: Colors.white,
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
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
