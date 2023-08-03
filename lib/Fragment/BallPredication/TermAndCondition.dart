
import 'package:criccoin/JoiningCharges/JoiningCharges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Homepage.dart';
import '../LeaderBoard.dart';
import '../NewsUI.dart';
import '../Profile.dart';
import '../Rewards.dart';

class TermAndConditionNextBall extends StatefulWidget {
  const TermAndConditionNextBall({super.key});

  @override
  State<TermAndConditionNextBall> createState() => _TermAndConditionNextBallState();
}

class _TermAndConditionNextBallState extends State<TermAndConditionNextBall> {
  int _selectedDrawerIndex = -1 ;

  void _onItemTapped(int index) {
    setState(() {
      _selectedDrawerIndex = index;
    });
  }

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
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
          title: Text(
            "Tata Ipl",
            style: TextStyle(
              color: const Color(0xff06283D),
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: height * 0.02,
            ),
          ),
      ),
      body: _selectedDrawerIndex == -1  ?
      ListView(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
            width: width * 0.84,
            height: height * 0.16,
            child: Image.asset(
              'assets/banner/news.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            height: height * 0.04,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Color(0xff0BA4F6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),topRight: Radius.circular(10) )
            ),
            child: Text(
              "Terms and condition",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontSize: height * 0.02,),
            textAlign: TextAlign.center,
            ) ,
          ),
          Container(
            height: height * 0.35,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: height * 0.02),

            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),topRight: Radius.circular(10) )
            ),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur. Ipsum augue vitae aliquam est egestas.Lorem ipsum dolor sit amet consectetur. Ipsum augue vitae aliquam est egestas.Lorem ipsum dolor sit amet consectetur. Ipsum augue vitae aliquam est egestas Next Ball Prediction Coin Distributiona. 1 Run : 5 coinb. 2 Run : 10 coinc. 4 Run : 20 Coind. 6 Run : 30 Coine. Out : 50 Coinf. Wide Ball : 25 Coing. Dot Ball : 10 Coinh. No Ball : 50 Coin.i.   Best Batsman: 20 coinsj.   Best Bowler: 10 coins ",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins",
                fontSize: height * 0.02,),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            height: height * 0.09,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: height * 0.02),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),topRight: Radius.circular(10) )
            ),
            child: Text(
             "This pridicting game cost you 200 Criccoin from your wallet.",
              style: TextStyle(
                color: Color(0xff06283D),
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
                fontSize: height * 0.02,),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: height * 0.02,),
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JoiningCharges()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: const BoxDecoration(
                  color: Color(0xff9ddbfb),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.02,
                right: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Center(
                child: Text(
                  "Let’s Start Predicting",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: MediaQuery.of(context).size.height * 0.02,),
                ),
              ),
            ),
          ),
        ],
      ): _getDrawerItemWidget(_selectedDrawerIndex),
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
                onTap: (){
                  _onItemTapped(0);
                  // setState(() {
                  //   _selectedDrawerIndex == 0;
                  // });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/SVG/home.svg",
                        semanticsLabel: 'Acme Logo'
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.height * 0.01,),
                    )
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: (){
                  _onItemTapped(1);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.10,
                      // color: Colors.green,
                      child: SvgPicture.asset("assets/SVG/trophy.svg",
                          semanticsLabel: 'Acme Logo'
                      ),
                    ),
                    Text(
                      "Leaderboard",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.height * 0.01,),
                    )
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: (){
                  _onItemTapped(2);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.10,
                      // color: Colors.green,
                      child: SvgPicture.asset("assets/SVG/rewards.svg",
                          semanticsLabel: 'Acme Logo'
                      ),
                    ),
                    Text(
                      "Rewards",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.height * 0.01,),
                    )
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: (){
                  _onItemTapped(3);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.10,
                      // color: Colors.green,
                      child: SvgPicture.asset("assets/SVG/news.svg",
                          semanticsLabel: 'Acme Logo'
                      ),
                    ),
                    Text(
                      "News",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.height * 0.01,),
                    )
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: (){
                  _onItemTapped(4);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.10,
                      child: SvgPicture.asset("assets/SVG/profile.svg",
                          semanticsLabel: 'Acme Logo'
                      ),
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.height * 0.01,),
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
