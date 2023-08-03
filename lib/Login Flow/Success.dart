
import 'package:criccoin/FragmentHome.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
          ),
          Center(
            child: Text(
              "Thank You!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                fontSize: MediaQuery.of(context).size.height * 0.03,),
            ),
          ),
          Text(
            "You Account Has Been Created",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              fontSize: MediaQuery.of(context).size.height * 0.02,),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.38,
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FragmentHome()));
            },
            child: Container(
              alignment: Alignment.bottomCenter,
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
                  "Let’s Start Guessing",
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
