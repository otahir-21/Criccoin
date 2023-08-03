

import 'package:criccoin/Prediction/NextBall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JoiningCharges extends StatefulWidget {
  const JoiningCharges({super.key});

  @override
  State<JoiningCharges> createState() => _JoiningChargesState();
}

class _JoiningChargesState extends State<JoiningCharges> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(right: height * 0.04,top: height * 0.02),
                child: const Icon(
                  Icons.close,
                )),
          ),
          Container(
            margin: EdgeInsets.only(
              top: height * 0.15
            ),
            child: Text(
              "Join Contest",
              style: TextStyle(
                color: const Color(0xff06283D),
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: height * 0.04,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: height * 0.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * 0.05,
                width: width * 0.07,
                margin: EdgeInsets.only(right: height * 0.01),
                child: SvgPicture.asset("assets/SVG/coin.svg",color: const Color(0xff0BA4F6),
                ),),
              Container(
                // margin: EdgeInsets.only(
                //     top: height * 0.19
                // ),
                child: Text(
                  "200 CC",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.02,
                  ),
                ),

              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: height * 0.01),
                child: Text(
                  "Available CC Coins",
                  style: TextStyle(
                    color: const Color(0xff416C87),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.02,
                  ),
                ),
              ),

              Container(
                height: height * 0.05,
                width: width * 0.05,
                margin: EdgeInsets.only(right: height * 0.01),
                child: SvgPicture.asset("assets/SVG/coin.svg",color: const Color(0xff0BA4F6)
                ),),
              Text(
                "1200 cc",
                style: TextStyle(
                  color: const Color(0xff1B2328),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.016,
                ),
              ),

            ],
          ),
          SizedBox(height: height * 0.25,),

          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.transparent; // Set your desired splashColor here
                  }
                  return Colors.transparent; // No overlay color for other states
                },
              ),
            ),
              onPressed: (){

              },
              child:  Text(
                "Watch Ads",
                style: TextStyle(
                  color: const Color(0xff416C87),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.020,
                ),
                textAlign: TextAlign.center,
              ),),

          Container(
            height: height * 0.06,
            margin: EdgeInsets.only(left:  height * 0.13,right:  height * 0.13 ),
            decoration: const BoxDecoration(
              color: Color(0xff0BA4F6),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.transparent; // Set your desired splashColor here
                    }
                    return Colors.transparent; // No overlay color for other states
                  },
                ),
              ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NextBall(
                )));

              },
              child:  Text(
                "Join Now",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.020,
                ),
                textAlign: TextAlign.center,
              ),),

          )

        ],
      )
    );
  }
}
