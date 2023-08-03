
import 'package:country_picker/country_picker.dart';
import 'package:criccoin/Auth/Auth.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.06,
              left: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Text(
              "Welcome to Criccoin",
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  fontSize: MediaQuery.of(context).size.height * 0.03),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                left: MediaQuery.of(context).size.height * 0.02),
            child: Text(
              "Enter Your Number",
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.06,
          //   margin: EdgeInsets.only(
          //     top: MediaQuery.of(context).size.height * 0.01,
          //     left: MediaQuery.of(context).size.height * 0.02,
          //     right: MediaQuery.of(context).size.height * 0.02,
          //   ),
          //   decoration: BoxDecoration(
          //       border: Border.all(color: const Color(0xffD3DBE3)),
          //       borderRadius: const BorderRadius.all(Radius.circular(10))),
          //   child: Row(
          //     children: [
          //       Container(
          //         height: MediaQuery.of(context).size.height * 0.06,
          //         width: MediaQuery.of(context).size.height * 0.06,
          //         decoration: BoxDecoration(
          //           border: Border.all(color: const Color(0xffD3DBE3), width: 1),
          //           borderRadius: const BorderRadius.all(Radius.circular(10)),
          //         ),
          //         child: showCountryPicker(
          //             context: context,
          //             countryListTheme: const CountryListThemeData(
          //               bottomSheetHeight: 550,
          //             ),
          //             onSelect: (value) {
          //               setState(() {
          //                 selectedCountry = value;
          //               });
          //             }),
          //       ),
          //       SizedBox(
          //         height: MediaQuery.of(context).size.height * 0.06,
          //         width: MediaQuery.of(context).size.height * 0.30,
          //         child: TextFormField(
          //           keyboardType: const TextInputType.numberWithOptions(decimal: true),
          //           autofocus: false,
          //           controller: phone,
          //           textAlign: TextAlign.start,
          //           cursorColor: Colors.black,
          //           style: const TextStyle(color: Colors.black),
          //           decoration: InputDecoration(
          //             hintText: "Enter Your Mobile Number",
          //             contentPadding: const EdgeInsets.all(0.0),
          //             disabledBorder: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(28.0),
          //               borderSide: const BorderSide(
          //                 color: Colors.white,
          //               ),
          //             ),
          //             enabledBorder: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(28.0),
          //               borderSide: const BorderSide(
          //                 color: Colors.white,
          //               ),
          //             ),
          //             focusedErrorBorder: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(28.0),
          //               borderSide: const BorderSide(
          //                 color: Colors.white,
          //               ),
          //             ),
          //             // hintStyle: const TextStyle(color: Colors.black),
          //             errorBorder: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(28.0),
          //               borderSide: const BorderSide(
          //                 color: Colors.white,
          //               ),
          //             ),
          //             focusedBorder: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(28.0),
          //               borderSide: const BorderSide(
          //                 color: Colors.white,
          //               ),
          //             ),
          //             focusColor: Colors.black,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

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
                fontSize: height * 0.02,
                fontWeight: FontWeight.bold,
              ),
              // onChanged: (value) {
              //   setState(() {
              //     phone.text = value;
              //   });
              // },
              decoration: InputDecoration(
                hintText: "Enter phone number",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.02,
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
                  padding: const EdgeInsets.all(8.0),
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
                        fontSize: height * 0.02,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
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
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                left: MediaQuery.of(context).size.height * 0.02),
            child: Text(
              "Enter Referral Code",
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
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
                      fontSize: MediaQuery.of(context).size.height * 0.02),
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
              const Text(
                "I’m over 18 years old.",
                style: TextStyle(color: Color(0xff1B2328), fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.37,
          ),
          InkWell(
            onTap: () {
              const CircularProgressIndicator();
              Auth auth = Auth();
              var number = phone.text.trim();
              var userNumber = '+${selectedCountry.phoneCode}$number'.trim();
              auth.signInWithPhone(context, userNumber);
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

  // Future<void> phoneVerification(String phone) async {
  //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //   var userNumber  = '+${selectedCountry.phoneCode}$phone';
  //
  //   try {
  //     await firebaseAuth.verifyPhoneNumber(
  //         phoneNumber: '+${selectedCountry.phoneCode}$phone',
  //         verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
  //           await firebaseAuth.signInWithCredential(phoneAuthCredential);
  //         },
  //         verificationFailed: (error) {
  //           throw Exception(error.message);
  //         },
  //         codeSent: (verificationId, forceResendingToken) {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) =>
  //                   OptVerification(verificationId: verificationId,userNumber : userNumber),
  //             ),
  //           );
  //         },
  //         codeAutoRetrievalTimeout: (verificationId) {});
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(e.message.toString()),
  //       ),
  //     );
  //   }
  // }
}
