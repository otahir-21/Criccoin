
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../DrawerItem/AccountSetting.dart';
import '../DrawerItem/HelpAndSupport.dart';
import '../DrawerItem/Invite.dart';
import '../DrawerItem/NotificationClass.dart';
import '../DrawerItem/Wallet.dart';

class Rewards extends StatefulWidget {
  const Rewards({super.key});

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  final List<String> items = [
    'Daily',
    'Weekly',
    'Monthly',
    // Add more items as needed
  ];

  int selectedIndex = 0;
  var elevation = 0.2;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: height * 0.05,
            margin: EdgeInsets.only(left: height * 0.04,right: height * 0.04),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
            child: Center(
              child: Text(
                "Task",
                style: TextStyle(
                  color: const Color(0xff0BA4F6),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.018,
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.04,),
          Container(
            height: height * 0.20,
            margin: EdgeInsets.only(left: height * 0.07,right: height * 0.07),
            child: Lottie.network('https://lottie.host/f7825020-7fde-486c-9d76-7aaee6991352/yUiuI08Wji.json'),
          ),

          Container(
            height: height * 0.06,
            margin: EdgeInsets.only(left: height * 0.05),
            alignment: Alignment.center,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                bool isSelected = index == selectedIndex;
                Color bgColor = isSelected ? Colors.black : const Color(0xffF8FAFB);
                Color textColor = isSelected ? Colors.white : const Color(0xff5E849C);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Card(
                    elevation: elevation,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Adjust the radius value as needed
                    ),
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.24,
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                        border: Border.all(color: const Color(0xff5E849C))
                      ),
                      child: Center(
                        child: Text(
                          items[index],
                          style: TextStyle(
                            // color: const Color(0xff416C87),
                            color: textColor,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: height * 0.018,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          getTransition(selectedIndex, context),
        ],
      ),
    );
  }
  getTransition(selectedIndex , BuildContext context){
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    switch (selectedIndex) {
      case 0:
        return SizedBox(
          height: height * 0.546,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.44,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: height * 0.03),
                          child: SizedBox(
                            height: height * 0.04,
                            child: Text(
                              "Criccoin Coin",
                              style: TextStyle(
                                color: const Color(0xff416C87),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: height * 0.018,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: height * 0.03),
                          child: Row(
                            children: [
                              Container(
                                height: height * 0.05,
                                width: width * 0.07,
                                margin: EdgeInsets.only(left: height * 0.01),
                                child: SvgPicture.asset("assets/SVG/coin.svg"),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: height * 0.01,top: height * 0.01),
                                height: height * 0.04,
                                child: Text(
                                  "1000 CC",
                                  style: TextStyle(
                                    color: const Color(0xff416C87),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                    fontSize: height * 0.018,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: height * 0.09,
                      margin: EdgeInsets.only(
                        left: height * 0.03,
                        right: height * 0.03,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffF8FAFB),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: height * 0.019),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Criccoin Coin',
                              style: TextStyle(
                                color: const Color(0xff0BA4F6),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.018,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.03,
                                  width: width * 0.07,
                                  child: SvgPicture.asset("assets/SVG/coin.svg"),
                                ),
                                Text(
                                  ' 650/1,250',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * 0.018,
                                  ),
                                ),

                              ],
                            ),
                            Text(
                              '5 of 8 48:56:00',
                              style: TextStyle(
                                color: const Color(0xff5E849C),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.018,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.04,),
              Container(
                height: height * 0.066,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xFFDFF6FF), Color(0xFFFFFFFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: height * 0.04),
                      child: Text(
                        "All Time",
                        style: TextStyle(
                          color: const Color(0xff06283D),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.018,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: height * 0.03),
                      child: Row(
                        children: [
                          SizedBox(
                            height: height * 0.03,
                            width: width * 0.07,
                            child: SvgPicture.asset("assets/SVG/coin.svg"),
                          ),
                          Text(
                            ' 1000 CC',
                            style: TextStyle(
                              color: const Color(0xff416C87),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: height * 0.018,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      case 1:
        return SizedBox(
          height: height * 0.546,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.44,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: height * 0.03),
                          child: SizedBox(
                            height: height * 0.04,
                            child: Text(
                              "Yesterday",
                              style: TextStyle(
                                color: const Color(0xff416C87),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: height * 0.018,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: height * 0.03),
                          child: Row(
                            children: [
                              Container(
                                height: height * 0.05,
                                width: width * 0.07,
                                margin: EdgeInsets.only(left: height * 0.01),
                                child: SvgPicture.asset("assets/SVG/coin.svg"),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: height * 0.01,top: height * 0.01),
                                height: height * 0.04,
                                child: Text(
                                  "1000 CC",
                                  style: TextStyle(
                                    color: const Color(0xff416C87),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                    fontSize: height * 0.018,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: height * 0.06,
                      margin: EdgeInsets.only(
                        left: height * 0.03,
                        right: height * 0.03,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffF8FAFB),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: height * 0.019),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login Bonus',
                              style: TextStyle(
                                color: const Color(0xff416C87),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.018,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.03,
                                  width: width * 0.07,
                                  child: SvgPicture.asset("assets/SVG/coin.svg"),
                                ),
                                Text(
                                  ' 1000',
                                  style: TextStyle(
                                    color: const Color(0xff416C87),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * 0.018,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.04,),
              Container(
                height: height * 0.066,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xFFDFF6FF), Color(0xFFFFFFFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: height * 0.04),
                      child: Text(
                        "All Time",
                        style: TextStyle(
                          color: const Color(0xff06283D),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.018,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: height * 0.03),
                      child: Row(
                        children: [
                          SizedBox(
                            height: height * 0.03,
                            width: width * 0.07,
                            child: SvgPicture.asset("assets/SVG/coin.svg"),
                          ),
                          Text(
                            ' 1000 CC',
                            style: TextStyle(
                              color: const Color(0xff416C87),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: height * 0.018,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      case 2:
        return SizedBox(
          height: height * 0.546,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.44,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: height * 0.03),
                          child: SizedBox(
                            height: height * 0.04,
                            child: Text(
                              "Today, 31 August",
                              style: TextStyle(
                                color: const Color(0xff416C87),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: height * 0.018,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: height * 0.03),
                          child: Row(
                            children: [
                              Container(
                                height: height * 0.05,
                                width: width * 0.07,
                                margin: EdgeInsets.only(left: height * 0.01),
                                child: SvgPicture.asset("assets/SVG/coin.svg"),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: height * 0.01,top: height * 0.01),
                                height: height * 0.04,
                                child: Text(
                                  "1000 CC",
                                  style: TextStyle(
                                    color: const Color(0xff416C87),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                    fontSize: height * 0.018,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: height * 0.06,
                      margin: EdgeInsets.only(
                        left: height * 0.03,
                        right: height * 0.03,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffF8FAFB),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: height * 0.019),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login Bonus',
                              style: TextStyle(
                                color: const Color(0xff416C87),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.018,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.03,
                                  width: width * 0.07,
                                  child: SvgPicture.asset("assets/SVG/coin.svg"),
                                ),
                                Text(
                                  ' 1000',
                                  style: TextStyle(
                                    color: const Color(0xff416C87),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * 0.018,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01,),
                    Container(
                      height: height * 0.06,
                      margin: EdgeInsets.only(
                        left: height * 0.03,
                        right: height * 0.03,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffF8FAFB),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: height * 0.019),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login Bonus',
                              style: TextStyle(
                                color: const Color(0xff416C87),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.018,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.03,
                                  width: width * 0.07,
                                  child: SvgPicture.asset("assets/SVG/coin.svg"),
                                ),
                                Text(
                                  ' 1000',
                                  style: TextStyle(
                                    color: const Color(0xff416C87),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * 0.018,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01,),

                    Container(
                      height: height * 0.06,
                      margin: EdgeInsets.only(
                        left: height * 0.03,
                        right: height * 0.03,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffF8FAFB),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: height * 0.019),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login Bonus',
                              style: TextStyle(
                                color: const Color(0xff416C87),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.018,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.03,
                                  width: width * 0.07,
                                  child: SvgPicture.asset("assets/SVG/coin.svg"),
                                ),
                                Text(
                                  ' 1000',
                                  style: TextStyle(
                                    color: const Color(0xff416C87),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * 0.018,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.01,),

                    Container(
                      height: height * 0.06,
                      margin: EdgeInsets.only(
                        left: height * 0.03,
                        right: height * 0.03,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffF8FAFB),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: height * 0.019),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login Bonus',
                              style: TextStyle(
                                color: const Color(0xff416C87),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.018,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.03,
                                  width: width * 0.07,
                                  child: SvgPicture.asset("assets/SVG/coin.svg"),
                                ),
                                Text(
                                  ' 1000',
                                  style: TextStyle(
                                    color: const Color(0xff416C87),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * 0.018,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01,),

                    Container(
                      height: height * 0.06,
                      margin: EdgeInsets.only(
                        left: height * 0.03,
                        right: height * 0.03,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffF8FAFB),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: height * 0.019),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login Bonus',
                              style: TextStyle(
                                color: const Color(0xff416C87),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.018,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.03,
                                  width: width * 0.07,
                                  child: SvgPicture.asset("assets/SVG/coin.svg"),
                                ),
                                Text(
                                  ' 1000',
                                  style: TextStyle(
                                    color: const Color(0xff416C87),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * 0.018,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.01,),

                    Container(
                      height: height * 0.06,
                      margin: EdgeInsets.only(
                        left: height * 0.03,
                        right: height * 0.03,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffF8FAFB),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: height * 0.019),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login Bonus',
                              style: TextStyle(
                                color: const Color(0xff416C87),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.018,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.03,
                                  width: width * 0.07,
                                  child: SvgPicture.asset("assets/SVG/coin.svg"),
                                ),
                                Text(
                                  ' 1000',
                                  style: TextStyle(
                                    color: const Color(0xff416C87),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * 0.018,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01,),

                    Container(
                      height: height * 0.06,
                      margin: EdgeInsets.only(
                        left: height * 0.03,
                        right: height * 0.03,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffF8FAFB),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: height * 0.019),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login Bonus',
                              style: TextStyle(
                                color: const Color(0xff416C87),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.018,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.03,
                                  width: width * 0.07,
                                  child: SvgPicture.asset("assets/SVG/coin.svg"),
                                ),
                                Text(
                                  ' 1000',
                                  style: TextStyle(
                                    color: const Color(0xff416C87),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * 0.018,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01,),

                    Container(
                      height: height * 0.06,
                      margin: EdgeInsets.only(
                        left: height * 0.03,
                        right: height * 0.03,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffF8FAFB),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: height * 0.019),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login Bonus',
                              style: TextStyle(
                                color: const Color(0xff416C87),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: height * 0.018,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.03,
                                  width: width * 0.07,
                                  child: SvgPicture.asset("assets/SVG/coin.svg"),
                                ),
                                Text(
                                  ' 1000',
                                  style: TextStyle(
                                    color: const Color(0xff416C87),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: height * 0.018,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: height * 0.04,),
              Container(
                height: height * 0.066,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xFFDFF6FF), Color(0xFFFFFFFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: height * 0.04),
                      child: Text(
                        "All Time",
                        style: TextStyle(
                          color: const Color(0xff06283D),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.018,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: height * 0.03),
                      child: Row(
                        children: [
                          SizedBox(
                            height: height * 0.03,
                            width: width * 0.07,
                            child: SvgPicture.asset("assets/SVG/coin.svg"),
                          ),
                          Text(
                            ' 1000 CC',
                            style: TextStyle(
                              color: const Color(0xff416C87),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: height * 0.018,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      default:
        return Container();
    }
  }


}
