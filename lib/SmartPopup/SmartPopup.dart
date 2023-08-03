
import 'package:flutter/material.dart';

class SmartPopup extends StatefulWidget {
  const SmartPopup({super.key});

  @override
  State<SmartPopup> createState() => _SmartPopupState();
}

class _SmartPopupState extends State<SmartPopup> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hurray!",
              style: TextStyle(
                color: const Color(0xff1B2328),
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: height * 0.024,
              ),
            ),
            Text(
              "You have received 10 Criccoin!",
              style: TextStyle(
                color: const Color(0xff1B2328),
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: height * 0.018,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
