import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';

class Invite extends StatefulWidget {
  const Invite({super.key});

  @override
  State<Invite> createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  var elevation = 0.2;
  var color = const Color(0xfff5f5f5);

  final List<String> items = [
    'Daily',
    'Weekly',
    'Monthly',
    // Add more items as needed
  ];

  final List<String> icons = [
    'assets/SVG/whatsappsvg.svg',
    'assets/SVG/twitter.svg',
    'assets/SVG/facebook.svg',
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
            "Invite",
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
              child: SvgPicture.asset("assets/SVG/whatsappsvg.svg",
                  semanticsLabel: 'Acme Logo'),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              child: Lottie.network(
                  "https://lottie.host/58fc3f55-4e83-4842-b19b-d16a85ca34e7/pLnc8XnIRK.json"),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              width: width * 0.7,
              child: Text(
                "Invite Your friends and you will get 200 coins On your Wallet ",
                style: TextStyle(
                  color: const Color(0xff06283D),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.02,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: height * 0.06,
              width: width * 0.8,
              decoration: const BoxDecoration(
                  color: Color(0xffEBF1F4),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: height * 0.03,
                        width: width * 0.07,
                        margin: EdgeInsets.only(left: height * 0.01),
                        child: const Icon(
                          Icons.copy_all_outlined,
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          "Criccoin.com/Share Link",
                          style: TextStyle(
                            color: const Color(0xff06283D),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: height * 0.015,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: height * 0.040,
                    width: width * 0.20,
                    margin: EdgeInsets.only(right: height * 0.002),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      "Copy",
                      style: TextStyle(
                        color: const Color(0xff06283D),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: height * 0.015,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.09,
            ),
            SizedBox(
              child: Text(
                "Or",
                style: TextStyle(
                  color: const Color(0xff06283D),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.020,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              child: Text(
                "Share this profile via",
                style: TextStyle(
                  color: const Color(0xff06283D),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.016,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: height * 0.06,
              width: width * 0.5,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: icons.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      // width: width * 0.12,
                      margin: EdgeInsets.only(left: height * 0.02),
                      decoration: const BoxDecoration(
                          color: Color(0xffF2F6F8), shape: BoxShape.circle),
                      child: GestureDetector(
                          onTap: () {
                            try {
                              Share.share('check out my website https://example.com');
                            } catch (e) {
                              print("Error sharing: $e");
                            }

                          },
                          child: SvgPicture.asset(icons[index])),
                    );
                  }),
            )
          ],
        ));
  }
}
