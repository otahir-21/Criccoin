import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  var elevation = 0.2;
  var color = const Color(0xfff5f5f5);

  final List<String> items = [
    'Daily',
    'Weekly',
    'Monthly',
    // Add more items as needed
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Wallet",
            style: TextStyle(
              color: const Color(0xff06283D),
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: height * 0.02,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: height * 0.02),
              width: width * 0.05,
              child: SvgPicture.asset("assets/SVG/whatsapp.svg",
                  semanticsLabel: 'Acme Logo'),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            SizedBox(
              height: height * 0.14,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 1,
                    child: Container(
                      height: height * 0.12,
                      width: width * 0.37,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xff0BA4F6)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                              left: height * 0.01,
                              top: height * 0.01,
                            ),
                            child: Text(
                              "Criccoin Coin",
                              style: TextStyle(
                                color: const Color(0xff0BA4F6),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: height * 0.015,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: height * 0.05,
                                width: width * 0.07,
                                margin: EdgeInsets.only(left: height * 0.01),
                                child: SvgPicture.asset("assets/SVG/coin.svg"),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: height * 0.01),
                                child: Text(
                                  "1000",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w700,
                                    fontSize: height * 0.015,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SizedBox(
                            height: height * 0.02,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                    children: [
                                      TextSpan(
                                        text: '≈ INR',
                                        style: TextStyle(
                                          color: const Color(0xff0BA4F6),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w400,
                                          fontSize: height * 0.015,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' ₹100',
                                        style: TextStyle(
                                          color: const Color(0xff000000),
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w400,
                                          fontSize: height * 0.015,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 1,
                    child: Container(
                      height: height * 0.12,
                      width: width * 0.37,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xffFFEDCC)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                              left: height * 0.01,
                              top: height * 0.01,
                            ),
                            child: Text(
                              "Watch Ads",
                              style: TextStyle(
                                color: const Color(0xffFFAE1B),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: height * 0.015,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                  height: height * 0.05,
                                  width: width * 0.07,
                                  margin: EdgeInsets.only(left: height * 0.01),
                                  child: const Icon(
                                      Icons.play_circle_outline_sharp)),
                              Text(
                                "Get 10 CC",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w700,
                                  fontSize: height * 0.017,
                                ),
                                textAlign: TextAlign.left,
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
            Container(
              margin: EdgeInsets.only(left: height * 0.04, top: height * 0.03,bottom: height * 0.01),
              alignment: Alignment.topLeft,
              child: Text(
                "Transactions",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.015,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.06,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  bool isSelected = index == selectedIndex;
                  Color bgColor = isSelected ? Colors.white : const Color(0xffF8FAFB);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Card(
                      elevation: elevation,
                      child: Container(
                        height: height * 0.07,
                        width: width * 0.30,
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text(
                            items[index],
                            style: TextStyle(
                              color: const Color(0xff416C87),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: height * 0.018,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            getTransition(selectedIndex , context),
          ],
        ));
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
                              "Today",
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
