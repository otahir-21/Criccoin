

import 'package:country_picker/country_picker.dart';
import 'package:criccoin/Auth/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login Flow/OptVerification.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  bool? check1 = false;
  TextEditingController phone = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: isLoading
          ? const CircularProgressIndicator():ListView(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.13,
              left: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Text(
              "Welcome to Criccoin",
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                left: MediaQuery.of(context).size.height * 0.02),
            child: Text(
              "Enter Your Number",
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  fontSize: height * 0.014),
            ),
          ),

          Container(
              height: height * 0.06,
          margin: EdgeInsets.only(
              top: height * 0.01,
              left: height * 0.02,
              right: height * 0.02,
            ),
            child: TextFormField(
              cursorColor: Colors.purple,
              controller: phone,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: height * 0.02,
                color: const Color(0xff3A3A3A),
              ),
              decoration: InputDecoration(
                hintText: "Enter phone number",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.017,
                  color: Colors.grey.shade600,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black12),
                ),
                prefixIcon: Container(
                  padding: EdgeInsets.only(
                    left: height * 0.01,
                    right: height * 0.01,
                    top: height * 0.013,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: const Color(0xffD3DBE3)
                    )
                  ),
                  child: InkWell(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                            bottomSheetHeight: height * 0.70,
                          ),
                          onSelect: (value) {
                            setState(() {
                              selectedCountry = value;
                            });
                          });
                    },
                    child: Text(
                      "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: height * 0.016,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                suffixIcon: phone.text.length > 9
                    ? Container(
                        height: height * 0.01,
                        width: height * 0.01,
                        margin: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                    : null,
              ),
            ),
          ),

          const SizedBox(
            height: 0.01,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                left: MediaQuery.of(context).size.height * 0.02),
            child: Text(
              "Enter Referral Code",
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  fontSize: height * 0.014),
            ),
          ),
          Container(
            height: height * 0.06,
            width: width * 0.90,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.height * 0.02,
              right: MediaQuery.of(context).size.height * 0.02,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffD3DBE3)),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.height * 0.30,
              child: TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                autofocus: false,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: " Referral Code",
                  contentPadding: const EdgeInsets.all(0.0),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  // hintStyle: const TextStyle(color: Colors.black),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusColor: Colors.black,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    left: MediaQuery.of(context).size.height * 0.02),
                child: Text(
                  "Don’t Have Referral Code ?",
                  style: TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      fontSize: height * 0.014),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    left: MediaQuery.of(context).size.height * 0.01),
                child: const Text(
                  "Auto Fetch",
                  style: TextStyle(
                      color: Color(0xff1363DF),
                      fontFamily: "Poppins",
                      // fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 15),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                  focusColor: const Color(0xff0BA4F6),
                  value: check1, //unchecked
                  onChanged: (bool? value) {
                    //value returned when checkbox is clicked
                    setState(() {
                      check1 = value;
                    });
                  }),
              Text(
                "I’m over 18 years old.",
                style: TextStyle(color: const Color(0xff1B2328), fontSize: height * 0.015),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.37,
          ),
          InkWell(
            onTap: () {
              const CircularProgressIndicator();
              var number = phone.text.trim();
              var userNumber = '+${selectedCountry.phoneCode}$number'.trim();
              phone.text.isEmpty ?
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Enter Phone Number".toString()),
                ),
              ):
              signInWithPhone(context, userNumber);
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            alignment: Alignment.center,
            child: RichText(
              text: const TextSpan(
                text: 'By continuing you will agree to out ',
                style: TextStyle(
                  color: Color(0xff1B2328),
                  fontWeight: FontWeight.w600,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Term & Condition',
                      style: TextStyle(
                        color: Color(0xff1363DF),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void signInWithPhone(BuildContext context, String phoneNumber) async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    try {
      setState(() {
        isLoading = true;
      });
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
            await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text((error.message).toString()),
              ),
            );
          },
          codeSent: (verificationId, forceResendingToken) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OptVerification(verificationId: verificationId, userNumber: phoneNumber),
            ));
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message.toString()),
        ),
      );
    }finally {
      setState(() {
        isLoading = false;
      });
    }
  }

}
