
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TopBowler extends StatefulWidget {
  const TopBowler({super.key});

  @override
  State<TopBowler> createState() => _TopBowlerState();
}

class _TopBowlerState extends State<TopBowler> {
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

  bool predictionBowlerSelected = false;

  int selectedBowlerIndex = -1;
   double ballerPercentage = 0.3;
  bool prizeDistribution = false;
  var color1 = Colors.white;
  var transparent = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            height: height * 0.03,
            margin: EdgeInsets.only(left: height * 0.04),
            child: Text(
              "Who will be the top bowler of today match ?",
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
                        itemCount: topBowler.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                predictionBowlerSelected = true;
                                selectedBowlerIndex = index; // Store the selected index in a state variable
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: height * 0.033,
                              margin: EdgeInsets.only(top: height * 0.011),
                              decoration: BoxDecoration(
                                color: predictionBowlerSelected && selectedBowlerIndex == index ? Colors.green : Colors.black12,
                                borderRadius: const BorderRadius.all(Radius.circular(7)),
                              ),
                              child: Text(
                                topBowler[index],
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
              predictionBowlerSelected  == false ?
              Container(
                height: height * 0.10,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(right:  height * 0.03),
                child: Image.asset(
                  'assets/Icons/cricket.png',
                  width: width * 0.30,
                  fit: BoxFit.fill,
                ),
              ):
              Container(
                height: height * 0.10,
                width: width * 0.50,
                margin: EdgeInsets.only(top: height * 0.01, right: height * 0.01),
                child: ListView.builder(
                  itemCount: topBowler.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: height * 0.05,
                      child: LinearPercentIndicator(
                        width: width * 0.38,
                        lineHeight: height * 0.02,
                        percent: ballerPercentage,
                        trailing: Text(
                          "${(ballerPercentage * 100).toStringAsFixed(1)} %",
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
          SizedBox(height: height *0.01,),
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
                      semanticsLabel: 'Acme Logo'
                  ),
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
                      semanticsLabel: 'Acme Logo'
                  ),
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
          SizedBox(height: height *0.02,),
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
                      prizeDistribution == true ?
                      prizeDistribution == true ? prizeDistribution = false : prizeDistribution = true :
                      null;
                    });
                  },
                  child: Container(
                    height: height * 0.057,
                    width: width * 0.43,
                    decoration: BoxDecoration(
                        color: prizeDistribution == false ? color1 : transparent,
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
                      prizeDistribution == false ?
                      prizeDistribution == false ? prizeDistribution = true : prizeDistribution = false: null;
                    });
                  },
                  child: Container(
                    height: height * 0.057,
                    width: width * 0.43,
                    decoration: BoxDecoration(
                        color: prizeDistribution == true ? color1 : transparent,
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
          prizeDistribution == false ? priceDistributionFunction(context) : leaderBoardFunction(context),

        ],
      )
    );
  }

  priceDistributionFunction(context){
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
        height: height * 0.19,
        width: width * 0.12,
        child: Column(
          children: [
            SizedBox(height: height * 0.01,),
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
            SizedBox(height: height * 0.01,),

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
            SizedBox(height: height * 0.01,),

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
            SizedBox(height: height * 0.01,),

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
        )
    );
  }
  leaderBoardFunction(context){
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
        height: height * 0.19,
        width: width * 0.12,
        child: Column(
          children: [
            SizedBox(height: height * 0.01,),
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
            SizedBox(height: height * 0.01,),
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
        )
    );
  }
}
