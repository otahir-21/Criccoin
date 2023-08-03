import 'package:criccoin/Fragment/BallPredication/TermAndCondition.dart';
import 'package:flutter/material.dart';

import '../Login Flow/Success.dart';

class Preference extends StatefulWidget {
  const Preference({super.key});


  @override
  State<Preference> createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Preferences",
          style: TextStyle(
            color: const Color(0xff06283D),
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: height * 0.02,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: height * 0.02, top: height * 0.02),
            child: Text(
              "Select Your Preference from below categories",
              style: TextStyle(
                color: const Color(0xff06283D),
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontSize: height * 0.015,
              ),
            ),
          ),
          SizedBox(height: height * 0.01,),

          Row(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {

                },
                child: Container(
                  margin: EdgeInsets.only(left: height * 0.02),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.black),
                  ),
                  height: height * 0.04,
                  width: width * 0.43,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "6 Over Prediction",
                        style: TextStyle(
                          color: const Color(0xff06283D),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: height * 0.018,
                        ),
                      ),
                      Icon(Icons.add, size: height * 0.02,)
                    ],
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: (){

                },
                child: Container(
                  margin: EdgeInsets.only(left: height * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.black),
                  ),
                  height: height * 0.04,
                  width: width * 0.46,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        "Next Ball Prediction",
                        style: TextStyle(
                          color: const Color(0xff06283D),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: height * 0.018,
                        ),
                      ),
                      Icon(Icons.add, size: height * 0.02,)
                    ],
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: height * 0.01,),

          Row(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: (){

                },
                child: Container(
                  margin: EdgeInsets.only(left: height * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.black),
                  ),
                  height: height * 0.04,
                  width: width * 0.43,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Best Bowler",
                        style: TextStyle(
                          color: const Color(0xff06283D),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: height * 0.018,
                        ),
                      ),
                      Icon(Icons.add, size: height * 0.02,)
                    ],
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: (){

                },
                child: Container(
                  margin: EdgeInsets.only(left: height * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.black),
                  ),
                  height: height * 0.04,
                  width: width * 0.46,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "20 Over Inning Score",
                        style: TextStyle(
                          color: const Color(0xff06283D),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: height * 0.018,
                        ),
                      ),
                      Icon(Icons.add, size: height * 0.02,)
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.01,),

          Row(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,

                onTap: (){

                },
                child: Container(
                  margin: EdgeInsets.only(left: height * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.black),
                  ),
                  height: height * 0.04,
                  width: width * 0.43,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "6 Over Prediction",
                        style: TextStyle(
                          color: const Color(0xff06283D),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: height * 0.018,
                        ),
                      ),
                      Icon(Icons.add, size: height * 0.02,)
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.56,),
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TermAndConditionNextBall()));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: const BoxDecoration(
                  color: Color(0xff0BA4F6),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.02,
                right: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Center(
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: MediaQuery.of(context).size.height * 0.02,),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
