import 'package:criccoin/Filter/DiscoverFilter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../DrawerItem/AccountSetting.dart';
import '../DrawerItem/HelpAndSupport.dart';
import '../DrawerItem/Invite.dart';
import '../DrawerItem/NotificationClass.dart';
import '../DrawerItem/Wallet.dart';

class NewsUI extends StatefulWidget {
  const NewsUI({super.key});

  @override
  State<NewsUI> createState() => _NewsUIState();
}

class _NewsUIState extends State<NewsUI> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView.builder(
        itemCount: 5, // The number of items in the list
        itemBuilder: (context, index) {
          // The builder function returns a widget for each item in the list
          return Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                width: width * 0.84,
                height: height * 0.18,
                child: Image.asset(
                  'assets/banner/news.png',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: width * 0.77,
                margin: EdgeInsets.only(top: height * 0.01),
                child: Text(
                  "27 December 2022",
                  style: TextStyle(
                    color: const Color(0xff999999),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.018,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: width * 0.77,
                margin: EdgeInsets.only(top: height * 0.01),
                child: Text(
                  "Lorem Ipsum and lorem ipsum and lorem ipsum",
                  style: TextStyle(
                    color: const Color(0xff181818),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.018,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: width * 0.77,
                margin: EdgeInsets.only(top: height * 0.01),
                child: Text(
                  "Lorem ipsum dolor sit amet consectetur. Dolor interdum purus consequat interdum. Nunc nisl dis odio vehicula. A a malesuada arcu gravida est nec odio dui. Consequat arcu tincidunt ut at hac ",
                  style: TextStyle(
                    color: const Color(0xff181818),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.018,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: width * 0.82,
                alignment: Alignment.topLeft,
                child: TextButton(
                    onPressed: () {},
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.37,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff909090))),
                      child:  Center(
                        child: Text(
                          "Read More",
                          style: TextStyle(
                            color: const Color(0xff000000),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.018,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}
