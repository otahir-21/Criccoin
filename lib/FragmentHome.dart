import 'package:criccoin/DrawerItem/NotificationClass.dart';
import 'package:criccoin/DrawerItem/Wallet.dart';
import 'package:criccoin/Fragment/Homepage.dart';
import 'package:criccoin/Fragment/NewsUI.dart';
import 'package:criccoin/Fragment/Profile.dart';
import 'package:criccoin/Fragment/Rewards.dart';
import 'package:criccoin/Splash/Splash-1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'DrawerItem/AccountSetting.dart';
import 'DrawerItem/HelpAndSupport.dart';
import 'DrawerItem/Invite.dart';
import 'Filter/DiscoverFilter.dart';
import 'Fragment/LeaderBoard.dart';

class FragmentHome extends StatefulWidget {
  const FragmentHome({super.key});

  @override
  State<FragmentHome> createState() => _FragmentHomeState();
}

class _FragmentHomeState extends State<FragmentHome> {
  int _selectedDrawerIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedDrawerIndex = index;
    });
  }
  List<String> listText = ['Home', 'Leaderboards','Mission','News','Profile'];


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
          listText[_selectedDrawerIndex],
          style: TextStyle(
            color: const Color(0xff06283D),
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: height * 0.02,
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DiscoverFilter()));
              },
              child: Container(
                  margin: EdgeInsets.only(right: height * 0.02),
                  child: const Icon(Icons.filter_alt_outlined
                  ))),
        ],
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
                      onTap: (){
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
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Profile()));
                              },
                              child: Text(
                                "Edit profile",
                                style: TextStyle(
                                  color: const Color(0xff5E849C),
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600,
                                  fontSize: height * 0.015,
                                ),
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
      body: _getDrawerItemWidget(_selectedDrawerIndex),
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
                      child:  SvgPicture.asset("assets/BottomBar/home.svg",
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
                      child:  SvgPicture.asset("assets/BottomBar/trophy.svg",
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
                      child:  SvgPicture.asset("assets/BottomBar/reward.svg",
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
                      child:  SvgPicture.asset("assets/BottomBar/news.svg",
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
                      child:  SvgPicture.asset("assets/BottomBar/profile.svg",
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
}
