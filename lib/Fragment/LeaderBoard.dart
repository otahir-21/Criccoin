
import 'package:criccoin/Filter/DiscoverFilter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../DrawerItem/AccountSetting.dart';
import '../DrawerItem/HelpAndSupport.dart';
import '../DrawerItem/Invite.dart';
import '../DrawerItem/NotificationClass.dart';
import '../DrawerItem/Wallet.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: height * 0.02,top: height * 0.01),
            child: Text(
              "Top predictor in Criccoin",
              style: TextStyle(
                color: const Color(0xff06283D),
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: height * 0.019,
              ),
            ),
          ),
          SizedBox(height: height * 0.01,),
          SizedBox(
            height: height * 0.70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left : height * 0.02, top: height * 0.01),
                      child: Text(
                        "Rank",
                        style: TextStyle(
                          color: const Color(0xff416C87),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.019,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height * 0.01),
                      child: Text(
                        "Name",
                        style: TextStyle(
                          color: const Color(0xff416C87),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.019,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right : height * 0.02, top: height * 0.01),
                      child: Text(
                        "Coins",
                        style: TextStyle(
                          color: const Color(0xff416C87),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.019,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 100, // The number of items in the list
                    itemBuilder: (context, index) {
                      index+=1;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left : height * 0.03,top: height * 0.01),
                            height: height* 0.05,
                            // width: width * 0.07,
                            child: Center(child:  Text(
                              '$index th'.toString(),
                              style: TextStyle(
                                color: const Color(0xff06283D),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: height * 0.019,
                              ),
                              maxLines: 2,
                            ),),
                          ),
                          Container(
                            height : height * 0.05,
                            margin: EdgeInsets.only(
                              left: height * 0.01,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color:const Color(0xff06283D),
                                  width: 2),
                            ),
                            child: Center(
                                child: Icon(Icons.person,
                                  size: height * 0.04,)
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: height * 0.05,top: height * 0.01),
                            width : width * 0.45,
                            child: Text(
                              "Rohit Sharma",
                              style: TextStyle(
                                color: const Color(0xff06283D),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: height * 0.019,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left : height * 0.02,top: height * 0.01),
                            // width : width * 0.45,
                            child: Text(
                              "2100",
                              style: TextStyle(
                                color: const Color(0xff06283D),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: height * 0.019,
                              ),
                              maxLines: 2,
                            ),
                          ),


                          // Icon(Icons.cabin),

                        ],
                      );
                    },
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
