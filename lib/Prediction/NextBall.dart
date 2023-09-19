
import 'package:criccoin/DrawerItem/HelpAndSupport.dart';
import 'package:criccoin/DrawerItem/Invite.dart';
import 'package:criccoin/DrawerItem/NotificationClass.dart';
import 'package:criccoin/DrawerItem/Wallet.dart';
import 'package:criccoin/Fragment/Homepage.dart';
import 'package:criccoin/Fragment/LeaderBoard.dart';
import 'package:criccoin/Fragment/NewsUI.dart';
import 'package:criccoin/Fragment/Profile.dart';
import 'package:criccoin/Fragment/Rewards.dart';
import 'package:criccoin/Prediction/TopBatsman.dart';
import 'package:criccoin/Prediction/TopBowler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../DrawerItem/AccountSetting.dart';

class NextBall extends StatefulWidget {
  const NextBall({super.key});

  @override
  State<NextBall> createState() => _NextBallState();
}

class _NextBallState extends State<NextBall> {
  int _selectedDrawerIndex = -1;

  var selected = const Color(0xff0BA4F6);
  var unselected = const Color(0xff87d2fb);
  bool select = false;
  bool unselect = false;

  bool selectPrediction = true;
  bool unselectPrediction = false;

  var position = 'Play';
  double percentage = 0.3;

  double superOverPercentage = 0.3;
  double scorePercentage = 0.6;

  var index = -1;

  bool prizeDistribution = false;
  var color1 = Colors.white;
  var transparent = Colors.transparent;

  void _onItemTapped(int index) {
    setState(() {
      _selectedDrawerIndex = index;
    });
  }

  List<String> stringArray = [
    "Ball",
    "Super Over Prediction",
    "Score",
    "Top Bowler",
    "Top Batsman"
  ];
  List<String> nextBall = [
    "1",
    "2",
    "4",
    "6",
    "OUT",
    "WIDE",
    "DOT BALL",
    "NO BALL"
  ];

  List<String> superOverPrediction = [
    "A",
    "B",
  ];

  List<String> scorePrediction = [
    "<150",
    "150-160",
    ">160",
  ];

  List<String> topBowler = [
    "MS Dhoni (c)",
    "Devon Conway",
    "Ruturaj Gaikwad",
    "Devon Conway",
    "Ruturaj Gaikwad",
    "MS Dhoni (c)",
    "Ruturaj Gaikwad",
    "Devon Conway",
    "Ruturaj Gaikwad",
    "MS Dhoni (c)",
    "Devon Conway",
    "Ruturaj Gaikwad",
  ];

  var positionPrediction = 0;
  bool predictionSelected = false;
  bool predictionSuperOverSelected = false;
  bool predictionScoreSelected = false;
  String? series = '';
  String? matchDate = '';
  String? matchTime = '';

  data() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    series = prefs.getString('series');
    matchDate = prefs.getString('matchDate');
    matchTime = prefs.getString('matchTime');
  }

  @override
  void initState() {
    data();

    super.initState();
  }

  int selectedPredictionIndex = -1;
  int selectedScoreIndex = -1;

  int selectedSuperOverIndex = -1;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const HomePage();
      case 1:
        return const LeaderBoard();
      case 2:
        return const Rewards();
      case 3:
        return const NewsUI();
      case 4:
        return const Profile();
      default:
        return const Text("Error");
    }
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Success()));
            },
            child: Image.asset("assets/Icons/LeftIcon.png")),
        centerTitle: false,
        title: Text(
          "Criccoin",
          style: TextStyle(
            color: const Color(0xff06283D),
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: height * 0.02,
          ),
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          SizedBox(
            height: height * 0.05,
            width: width * 0.02,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: height * 0.02),
                  child: Text(
                    "Menu",
                    style: TextStyle(
                      color: const Color(0xff06283D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: height * 0.018,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: height * 0.02),
                      child: const Icon(
                        Icons.close,
                      )),
                ),
              ],
            ),
          ),

          SizedBox(
            height: height * 0.07,
            width: width * 0.02,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: height * 0.02),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xff06283D), width: 2),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.person,
                    size: height * 0.06,
                  )),
                ),
                Container(
                    margin: EdgeInsets.only(left: height * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Md Nafis",
                          style: TextStyle(
                            color: const Color(0xff1B2328),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.018,
                          ),
                        ),
                        Text(
                          "Edit profile",
                          style: TextStyle(
                            color: const Color(0xff5E849C),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.015,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
            color: Color(0xffDFF6FF),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Wallet()));
            },
            child: SizedBox(
              height: height * 0.05,
              width: width * 0.02,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.05,
                    margin: EdgeInsets.only(left: height * 0.02),
                    child: SvgPicture.asset("assets/SVG/wallet.svg"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: height * 0.01),
                    child: Text(
                      "Wallet",
                      style: TextStyle(
                        color: const Color(0xff1B2328),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: height * 0.018,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            color: Color(0xffDFF6FF),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NotificationClass()));
            },
            child: SizedBox(
              height: height * 0.05,
              width: width * 0.02,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.05,
                    width: width * 0.06,
                    margin: EdgeInsets.only(left: height * 0.02),
                    child: SvgPicture.asset(
                      "assets/SVG/notification.svg",
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: height * 0.01),
                    child: Text(
                      "Notification",
                      style: TextStyle(
                        color: const Color(0xff1B2328),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: height * 0.018,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            color: Color(0xffDFF6FF),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Invite()));
            },
            child: SizedBox(
              height: height * 0.05,
              width: width * 0.02,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: height * 0.05,
                      margin: EdgeInsets.only(left: height * 0.02),
                      child: const Icon(Icons.insert_invitation)),
                  Container(
                    margin: EdgeInsets.only(left: height * 0.01),
                    child: Text(
                      "Invite",
                      style: TextStyle(
                        color: const Color(0xff1B2328),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: height * 0.018,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            color: Color(0xffDFF6FF),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AccountSetting()));
            },
            child: SizedBox(
              height: height * 0.05,
              width: width * 0.02,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: height * 0.05,
                      margin: EdgeInsets.only(left: height * 0.02),
                      child: const Icon(Icons.settings)),
                  Container(
                    margin: EdgeInsets.only(left: height * 0.01),
                    child: Text(
                      "Account Setting",
                      style: TextStyle(
                        color: const Color(0xff1B2328),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: height * 0.018,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            color: Color(0xffDFF6FF),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HelpAndSupport()));
            },
            child: SizedBox(
              height: height * 0.05,
              width: width * 0.02,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: height * 0.05,
                      margin: EdgeInsets.only(left: height * 0.02),
                      child: const Icon(Icons.support_agent)),
                  Container(
                    margin: EdgeInsets.only(left: height * 0.01),
                    child: Text(
                      "Help & Support",
                      style: TextStyle(
                        color: const Color(0xff1B2328),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: height * 0.018,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
      body: _selectedDrawerIndex == -1
          ? ListView(
              children: [
                SizedBox(
                  height: height * 0.16,
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/banner/banner3.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  height: height * 0.04,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            position = 'Play';
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.038,
                          width: width * 0.31,
                          decoration: BoxDecoration(
                            color: position == 'Play' ? selected : unselected,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Play",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: height * 0.018,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            position = 'Scorecard';
                          });
                        },
                        child: Container(
                          height: height * 0.038,
                          width: width * 0.31,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                position == 'Scorecard' ? selected : unselected,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Scorecard",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: height * 0.018,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            position = 'Match Info';
                          });
                        },
                        child: Container(
                          height: height * 0.038,
                          width: width * 0.31,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: position == 'Match Info'
                                ? selected
                                : unselected,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Match Info",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: height * 0.018,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                getTabContainer(position, context),
              ],
            )
          : _getDrawerItemWidget(_selectedDrawerIndex),
      bottomNavigationBar: Material(
        elevation: 10,
        child: SizedBox(
          // padding: const EdgeInsets.all(1.0),
          height: MediaQuery.of(context).size.height * 0.09,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  _onItemTapped(0);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.03,
                      width: width * 0.07,
                      child: SvgPicture.asset("assets/BottomBar/home.svg",
                          semanticsLabel: 'Acme Logo'),
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.height * 0.01,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  _onItemTapped(1);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.03,
                      width: width * 0.07,
                      child: SvgPicture.asset("assets/BottomBar/trophy.svg",
                          semanticsLabel: 'Acme Logo'),
                    ),
                    Text(
                      "Leaderboard",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.height * 0.01,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  _onItemTapped(2);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.03,
                      width: width * 0.07,
                      child: SvgPicture.asset("assets/BottomBar/reward.svg",
                          semanticsLabel: 'Acme Logo'),
                    ),
                    Text(
                      "Rewards",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.height * 0.01,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  _onItemTapped(3);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.03,
                      width: width * 0.07,
                      child: SvgPicture.asset("assets/BottomBar/news.svg",
                          semanticsLabel: 'Acme Logo'),
                    ),
                    Text(
                      "News",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.height * 0.01,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  _onItemTapped(4);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.03,
                      width: width * 0.07,
                      child: SvgPicture.asset("assets/BottomBar/profile.svg",
                          semanticsLabel: 'Acme Logo'),
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.height * 0.01,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTabContainer(String position, BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    switch (position) {
      case 'Play':
        return SizedBox(
            height: height * 0.57,
            child: ListView(
              children: [
                Card(
                  elevation: 0.1,
                  child: Container(
                    height: height * 0.04,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: height * 0.03,
                              margin: EdgeInsets.only(left: height * 0.002),
                              child: SvgPicture.asset(
                                "assets/SVG/wallet.svg",
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: height * 0.002),
                              child: Text(
                                "MS Dhoni 12(5)",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                  fontSize: height * 0.012,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: height * 0.002),
                          child: Text(
                            "MS Dhoni 12(5)",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: height * 0.012,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: height * 0.002),
                              child: Text(
                                "1/3 Jasprit Bumrah",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                  fontSize: height * 0.012,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              height: height * 0.03,
                              margin: EdgeInsets.only(left: height * 0.002),
                              child: SvgPicture.asset(
                                "assets/SVG/wallet.svg",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                SizedBox(
                  height: height * 0.03,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stringArray.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            positionPrediction = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(
                            minWidth: height * 0.12,
                          ),
                          margin: EdgeInsets.only(left: height * 0.01),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(13)),
                            color: positionPrediction == index
                                ? selected
                                : unselected,
                          ),
                          child: FittedBox(
                            child: Text(
                              stringArray[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: height * 0.018,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                getPredictionContainer(positionPrediction, context),
              ],
            ));
      case 'Scorecard':
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.57,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: height * 0.03, top: height * 0.01),
                    child: Text(
                      "CSK",
                      style: TextStyle(
                        color: const Color(0xff06283D),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        fontSize: height * 0.015,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: height * 0.03, top: height * 0.01),
                    child: Text(
                      "(20 Overs) 202/3",
                      style: TextStyle(
                        color: const Color(0xff06283D),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        fontSize: height * 0.015,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: height * 0.02, top: height * 0.01),
                    height: height * 0.03,
                    width: width * 0.16,
                    child: Text(
                      "Batter",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: height * 0.017,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 190,
              ),
              const Center(
                child: Text("under development"),
              )
            ],
          ),
        );
      case 'Match Info':
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.57,
          child: ListView(
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: height * 0.03, top: height * 0.01),
                child: Text(
                  "Series",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.017,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: height * 0.05,
                width: width * 0.1,
                margin: EdgeInsets.only(
                  left: height * 0.03,
                  right: height * 0.03,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffEBF1F4)),
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                ),
                child: Text(
                  series.toString(),
                  style: TextStyle(
                    color: const Color(0xff1B2328),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.018,
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: height * 0.03, top: height * 0.01),
                child: Text(
                  "Match",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.017,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: height * 0.05,
                width: width * 0.1,
                margin: EdgeInsets.only(
                  left: height * 0.03,
                  right: height * 0.03,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffEBF1F4)),
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                ),
                child: Text(
                  "10",
                  style: TextStyle(
                    color: const Color(0xff1B2328),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.018,
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: height * 0.03, top: height * 0.01),
                child: Text(
                  "Match Date",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.017,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: height * 0.05,
                width: width * 0.1,
                margin: EdgeInsets.only(
                  left: height * 0.03,
                  right: height * 0.03,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffEBF1F4)),
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                ),
                child: Text(
                  matchDate.toString(),
                  style: TextStyle(
                    color: const Color(0xff1B2328),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.018,
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: height * 0.03, top: height * 0.01),
                child: Text(
                  "Match Time",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.017,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: height * 0.05,
                width: width * 0.1,
                margin: EdgeInsets.only(
                  left: height * 0.03,
                  right: height * 0.03,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffEBF1F4)),
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                ),
                child: Text(
                  matchTime.toString(),
                  style: TextStyle(
                    color: const Color(0xff1B2328),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.018,
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: height * 0.03, top: height * 0.01),
                child: Text(
                  "Stadium/Venue",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.017,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: height * 0.05,
                width: width * 0.1,
                margin: EdgeInsets.only(
                  left: height * 0.03,
                  right: height * 0.03,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffEBF1F4)),
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                ),
                child: Text(
                  "Kolkata",
                  style: TextStyle(
                    color: const Color(0xff1B2328),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.018,
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: height * 0.03, top: height * 0.01),
                child: Text(
                  "Toss Result",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.017,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: height * 0.05,
                width: width * 0.1,
                margin: EdgeInsets.only(
                  left: height * 0.03,
                  right: height * 0.03,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffEBF1F4)),
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                ),
                child: Text(
                  "10",
                  style: TextStyle(
                    color: const Color(0xff1B2328),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.018,
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: height * 0.03, top: height * 0.01),
                child: Text(
                  "Third Empire",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.017,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: height * 0.05,
                width: width * 0.1,
                margin: EdgeInsets.only(
                  left: height * 0.03,
                  right: height * 0.03,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffEBF1F4)),
                  borderRadius: const BorderRadius.all(Radius.circular(7)),
                ),
                child: Text(
                  "10",
                  style: TextStyle(
                    color: const Color(0xff1B2328),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.018,
                  ),
                ),
              ),
            ],
          ),
        );
      default:
        return Container();
    }
  }

  Widget getPredictionContainer(int position, BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    switch (position) {
      case 0:
        return SizedBox(
            height: height * 0.57,
            child: ListView(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.03,
                  margin: EdgeInsets.only(left: height * 0.04),
                  child: Text(
                    "What happens on the next ball?",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.015,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: height * 0.01,
                        left: height * 0.04,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.36,
                            width: width * 0.35,
                            child: ListView.builder(
                              itemCount: nextBall.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    setState(() {
                                      predictionSelected = true;
                                      selectedPredictionIndex =
                                          index; // Store the selected index in a state variable
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: height * 0.033,
                                    margin:
                                        EdgeInsets.only(top: height * 0.011),
                                    decoration: BoxDecoration(
                                      color: predictionSelected &&
                                              selectedPredictionIndex == index
                                          ? Colors.green
                                          : Colors.black12,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(7)),
                                    ),
                                    child: Text(
                                      nextBall[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.017,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    predictionSelected == false
                        ? SizedBox(
                            // color: Colors.green,
                            // width: width * 0.84,
                            height: height * 0.30,
                            child: Image.asset(
                              'assets/Icons/cricket.png',
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            height: height * 0.34,
                            width: width * 0.50,
                            margin: EdgeInsets.only(right: height * 0.01),
                            child: ListView.builder(
                              itemCount: nextBall.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: height * 0.05,
                                  child: LinearPercentIndicator(
                                    width: width * 0.38,
                                    lineHeight: height * 0.02,
                                    percent: percentage,
                                    trailing: Text(
                                      "${(percentage * 100).toStringAsFixed(1)} %",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        fontSize: height * 0.013,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    linearStrokeCap: LinearStrokeCap.round,
                                    backgroundColor: const Color(0xff54bff9),
                                    progressColor: const Color(0xff0BA4F6),
                                  ),
                                );
                              },
                            ),
                          )
                  ],
                ),
                Container(
                  height: height * 0.05,
                  margin: EdgeInsets.only(
                    left: height * 0.01,
                    right: height * 0.01,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: const Color(0xffEBF1F4),
                      )),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: height * 0.02),
                        child: SvgPicture.asset("assets/SVG/profile.svg",
                            semanticsLabel: 'Acme Logo'),
                      ),
                      Text(
                        "1455 Total Prediction",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: height * 0.017,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: height * 0.02),
                        child: SvgPicture.asset("assets/SVG/profile.svg",
                            semanticsLabel: 'Acme Logo'),
                      ),
                      Text(
                        "22k other playing",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: height * 0.017,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                predictionSelected == false
                    ? Container()
                    : SizedBox(
                        height: height * 0.12,
                        width: width * 0.12,
                        child: Text(
                          'Waiting for the result',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.017,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
              ],
            ));
      case 1:
        return SizedBox(
            height: MediaQuery.of(context).size.height * 0.57,
            child: ListView(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.03,
                  margin: EdgeInsets.only(left: height * 0.04),
                  child: Text(
                    "Who will win the Super Over?",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.015,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.10,
                      margin: EdgeInsets.only(
                        top: height * 0.01,
                        left: height * 0.04,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.10,
                            width: width * 0.35,
                            child: ListView.builder(
                              itemCount: superOverPrediction.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    setState(() {
                                      predictionSuperOverSelected = true;
                                      selectedPredictionIndex =
                                          index; // Store the selected index in a state variable
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: height * 0.033,
                                    margin:
                                        EdgeInsets.only(top: height * 0.011),
                                    decoration: BoxDecoration(
                                      color: predictionSuperOverSelected &&
                                              selectedPredictionIndex == index
                                          ? Colors.green
                                          : Colors.black12,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(7)),
                                    ),
                                    child: Text(
                                      superOverPrediction[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.017,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    predictionSuperOverSelected == false
                        ? Container(
                            height: height * 0.10,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(right: height * 0.03),
                            child: Image.asset(
                              'assets/Icons/cricket.png',
                              width: width * 0.30,
                              fit: BoxFit.fill,
                            ),
                          )
                        : Container(
                            height: height * 0.10,
                            width: width * 0.50,
                            margin: EdgeInsets.only(
                                top: height * 0.01, right: height * 0.01),
                            child: ListView.builder(
                              itemCount: superOverPrediction.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: height * 0.05,
                                  child: LinearPercentIndicator(
                                    width: width * 0.38,
                                    lineHeight: height * 0.02,
                                    percent: superOverPercentage,
                                    trailing: Text(
                                      "${(superOverPercentage * 100).toStringAsFixed(1)} %",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        fontSize: height * 0.013,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    linearStrokeCap: LinearStrokeCap.round,
                                    backgroundColor: const Color(0xff54bff9),
                                    progressColor: const Color(0xff0BA4F6),
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  height: height * 0.05,
                  margin: EdgeInsets.only(
                    left: height * 0.01,
                    right: height * 0.01,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: const Color(0xffEBF1F4),
                      )),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: height * 0.02),
                        child: SvgPicture.asset("assets/SVG/profile.svg",
                            semanticsLabel: 'Acme Logo'),
                      ),
                      Text(
                        "1455 Total Prediction",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: height * 0.017,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: height * 0.02),
                        child: SvgPicture.asset("assets/SVG/profile.svg",
                            semanticsLabel: 'Acme Logo'),
                      ),
                      Text(
                        "22k other playing",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: height * 0.017,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
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
                        onTap: () {
                          setState(() {
                            prizeDistribution == true
                                ? prizeDistribution == true
                                    ? prizeDistribution = false
                                    : prizeDistribution = true
                                : null;
                          });
                        },
                        child: Container(
                          height: height * 0.057,
                          width: width * 0.43,
                          decoration: BoxDecoration(
                              color: prizeDistribution == false
                                  ? color1
                                  : transparent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                          child: Center(
                            child: Text(
                              "Prize Distribution",
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
                            prizeDistribution == false
                                ? prizeDistribution == false
                                    ? prizeDistribution = true
                                    : prizeDistribution = false
                                : null;
                          });
                        },
                        child: Container(
                          height: height * 0.057,
                          width: width * 0.43,
                          decoration: BoxDecoration(
                              color: prizeDistribution == true
                                  ? color1
                                  : transparent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                          child: Center(
                            child: Text(
                              "Leaderboard",
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
                prizeDistribution == false
                    ? priceDistributionFunction(context)
                    : leaderBoardFunction(context),
              ],
            ));
      case 2:
        return SizedBox(
            height: MediaQuery.of(context).size.height * 0.57,
            child: ListView(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.03,
                  margin: EdgeInsets.only(left: height * 0.04),
                  child: Text(
                    "How many runs will be scored in the first inning?",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.015,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.15,
                      margin: EdgeInsets.only(
                        top: height * 0.01,
                        left: height * 0.04,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.15,
                            width: width * 0.35,
                            child: ListView.builder(
                              itemCount: scorePrediction.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    setState(() {
                                      predictionScoreSelected = true;
                                      selectedScoreIndex =
                                          index; // Store the selected index in a state variable
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: height * 0.033,
                                    margin:
                                        EdgeInsets.only(top: height * 0.011),
                                    decoration: BoxDecoration(
                                      color: predictionScoreSelected &&
                                              selectedScoreIndex == index
                                          ? Colors.green
                                          : Colors.black12,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(7)),
                                    ),
                                    child: Text(
                                      scorePrediction[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                        fontSize: height * 0.017,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    predictionScoreSelected == false
                        ? Container(
                            height: height * 0.10,
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(right: height * 0.03),
                            child: Image.asset(
                              'assets/Icons/cricket.png',
                              width: width * 0.30,
                              fit: BoxFit.fill,
                            ),
                          )
                        : Container(
                            height: height * 0.10,
                            width: width * 0.50,
                            margin: EdgeInsets.only(
                                top: height * 0.01, right: height * 0.01),
                            child: ListView.builder(
                              itemCount: scorePrediction.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: height * 0.05,
                                  child: LinearPercentIndicator(
                                    width: width * 0.38,
                                    lineHeight: height * 0.02,
                                    percent: scorePercentage,
                                    trailing: Text(
                                      "${(scorePercentage * 100).toStringAsFixed(1)} %",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        fontSize: height * 0.013,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    linearStrokeCap: LinearStrokeCap.round,
                                    backgroundColor: const Color(0xff54bff9),
                                    progressColor: const Color(0xff0BA4F6),
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.05,
                  margin: EdgeInsets.only(
                    left: height * 0.01,
                    right: height * 0.01,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: const Color(0xffEBF1F4),
                      )),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: height * 0.02),
                        child: SvgPicture.asset("assets/SVG/profile.svg",
                            semanticsLabel: 'Acme Logo'),
                      ),
                      Text(
                        "1455 Total Prediction",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: height * 0.017,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: height * 0.02),
                        child: SvgPicture.asset("assets/SVG/profile.svg",
                            semanticsLabel: 'Acme Logo'),
                      ),
                      Text(
                        "22k other playing",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: height * 0.017,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
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
                        onTap: () {
                          setState(() {
                            prizeDistribution == true
                                ? prizeDistribution == true
                                    ? prizeDistribution = false
                                    : prizeDistribution = true
                                : null;
                          });
                        },
                        child: Container(
                          height: height * 0.057,
                          width: width * 0.43,
                          decoration: BoxDecoration(
                              color: prizeDistribution == false
                                  ? color1
                                  : transparent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                          child: Center(
                            child: Text(
                              "Prize Distribution",
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
                            prizeDistribution == false
                                ? prizeDistribution == false
                                    ? prizeDistribution = true
                                    : prizeDistribution = false
                                : null;
                          });
                        },
                        child: Container(
                          height: height * 0.057,
                          width: width * 0.43,
                          decoration: BoxDecoration(
                              color: prizeDistribution == true
                                  ? color1
                                  : transparent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                          child: Center(
                            child: Text(
                              "Leaderboard",
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
                prizeDistribution == false
                    ? priceDistributionFunction(context)
                    : leaderBoardFunction(context),
              ],
            ));
      case 3:
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.57,
          child: const TopBowler(),
        );
      case 4:
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.57,
          child: const TopBatsman(),
        );
      default:
        return Container();
    }
  }

  priceDistributionFunction(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
        height: height * 0.19,
        width: width * 0.12,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      color: const Color(0xff06283D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.019,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Prediction Winning",
                    style: TextStyle(
                      color: const Color(0xff06283D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.019,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: width * 0.15,
                  child: Text(
                    "<150",
                    style: TextStyle(
                      color: const Color(0xff06283D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.019,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "CC 100",
                    style: TextStyle(
                      color: const Color(0xff06283D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.019,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(
                    "150-160",
                    style: TextStyle(
                      color: const Color(0xff06283D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.019,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "CC 90",
                    style: TextStyle(
                      color: const Color(0xff06283D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.019,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: width * 0.16,
                  child: Text(
                    ">160",
                    style: TextStyle(
                      color: const Color(0xff06283D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.019,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "CC 50",
                    style: TextStyle(
                      color: const Color(0xff06283D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.019,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  leaderBoardFunction(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
        height: height * 0.19,
        width: width * 0.12,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                    color: const Color(0xff06283D),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.019,
                  ),
                ),
                Text(
                  "Number Of Coins",
                  style: TextStyle(
                    color: const Color(0xff06283D),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.019,
                  ),
                ),
                Container(
                  child: Text(
                    "Top Predictor",
                    style: TextStyle(
                      color: const Color(0xff06283D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.019,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              height: height * 0.13,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: width * 0.15,
                        child: Text(
                          index.toString(),
                          style: TextStyle(
                            color: const Color(0xff06283D),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.019,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.15,
                        child: Text(
                          index.toString(),
                          style: TextStyle(
                            color: const Color(0xff06283D),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.019,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.15,
                        child: Text(
                          index.toString(),
                          style: TextStyle(
                            color: const Color(0xff06283D),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.019,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
