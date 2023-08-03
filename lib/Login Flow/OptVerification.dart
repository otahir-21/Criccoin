import 'dart:convert';

import 'package:criccoin/BasicDetail.dart';
import 'package:criccoin/FragmentHome.dart';
import 'package:criccoin/GlobalVariable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Login.dart';

class OptVerification extends StatefulWidget {
  final String verificationId;
  final String userNumber;

  const OptVerification(
      {super.key, required this.verificationId, required this.userNumber});

  @override
  State<OptVerification> createState() => _OptVerificationState();
}

class _OptVerificationState extends State<OptVerification> {
  String? otpCode = '';
  String? verificationId;
  int? resendToken;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.06,
              left: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Text(
              "OTP Sent",
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  fontSize: MediaQuery.of(context).size.height * 0.03),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.02,
              right: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Text(
              'Waiting to automatically detect SMS sent to ${widget.userNumber}',
              style: TextStyle(
                  color: const Color(0xff1B2328),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  fontSize: MediaQuery.of(context).size.height * 0.02),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Pinput(
              length: 6,
              showCursor: true,
              defaultPinTheme: PinTheme(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xffD3DBE3),
                  ),
                ),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onCompleted: (value) {
                setState(() {
                  otpCode = value;
                });
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      resendOTP(widget.userNumber);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.height * 0.17,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff7AC8F5)),
                      child: Text(
                        "Resend OTP",
                        style: TextStyle(
                            color: const Color(0xff416C87),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (otpCode != null) {
                        verifyOtp(context, otpCode!);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Enter 6 digit otp"),
                          ),
                        );
                      }
                      // verifyOtp(context,UserO);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BasicDetails()));
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.height * 0.17,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff0BA4F6)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: const Icon(Icons.ice_skating,
                                    color: Colors.white),
                              ),
                              Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                              ),
                            ])),
                  )
                ]),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.height * 0.02,
            ),
            child: RichText(
              text: TextSpan(
                text: 'Entered wrong number? ',
                style: const TextStyle(color: Colors.black),
                /*defining default style is optional */
                children: <TextSpan>[
                  TextSpan(
                    text: 'Edit Number',
                    style: const TextStyle(
                      color: Color(0xff1363DF),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Login()));
                      },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.50,
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

  Future<void> verifyOtp(BuildContext context, String userOtp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId, smsCode: userOtp);
      await auth.signInWithCredential(credential);
      setState(() {
        number = widget.userNumber;
      });
      // getUserData();
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final String? uid = prefs.getString('uid');

      getUserData(FirebaseAuth.instance.currentUser!.uid);

    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message.toString()),
        ),
      );
    }
  }

  // Function to trigger OTP code resend
  void resendOTP(String userNumber) async {
    // Make sure the phone number is the same as before
    String phoneNumber = userNumber;

    // Resend the verification code
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        // Auto-retrieval of verification code completed
        // You can use the credential to sign in with `signInWithCredential`
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        } else {
          print('Verification failed: ${e.message}');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        // Update the verificationId with the new value for the resent code
        this.verificationId = verificationId;
        resendToken = resendToken; // Assign the token value to the resendToken variable
        otpCode = ''; // Clear the otpCode when OTP is resent
        print('Verification code sent to the phone number.');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-retrieval timeout, when the code isn't automatically detected
        print('Auto-retrieval verification timeout.');
      },
      timeout: const Duration(seconds: 60),
      forceResendingToken: resendToken, // Provide the resend token obtained from codeSent callback
    );
  }

  Future<Map<String, dynamic>> fetchUserData(String uid) async {
    // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
    final apiUrl = '$globalVariable/user/$uid';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // If the server returns a successful response, parse the JSON data
        return jsonDecode(response.body);
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Catch any other errors that may occur during the request
      throw Exception('Failed to communicate with the server');
    }
  }

  void getUserData(String uid) async {
    try {
      Map<String, dynamic> userData = await fetchUserData(uid);

      // Check if the userData is not empty or null
      if (userData.isNotEmpty) {
        // User data is available, you can use the data here
        print(userData);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FragmentHome()));

      } else {
        // No data available for the given UID
        print('No data available');
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BasicDetails()));

      }
    } catch (e) {
      // Handle any errors that may occur during the API call
      print('Error: $e');
    }
  }


  // getUserData() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String? uid = prefs.getString('uid');
  //   String url = '$globalVariable/user/$uid';
  //   print(uid);
  //   print(url);
  // }

//   Future<void> uploadData() async {
//     String url = '$globalVariable/auth/register';
//
//     var phone = FirebaseAuth.instance.currentUser?.phoneNumber;
//     String number = removeCountryCode(phone!);
//
//     // Define the data you want to upload
//     Map<String, dynamic> data = {
//       "u_id": uid,
//       "full_name": nameController.text,
//       "email": emailController.text,
//       "mobile": number
//     };
//
//     try {
//       //   // Convert data to JSON format
//       String jsonData = jsonEncode(data);
//
//       // Set up the headers
//       Map<String, String> headers = {
//         "Content-Type": "application/json",
//       };
//
//       // Make the HTTP POST request
//       final response = await http.post(
//         Uri.parse(url),
//         headers: headers,
//         body: jsonData,
//       );
//
//       print(response.statusCode);
//       // Check the response status
//
//       if (response.statusCode == 201) {
//         // Data uploaded successfully, parse the JSON response
//         Map<String, dynamic> responseData = jsonDecode(response.body);
//         print("Uploaded Data:");
//         print("u_id: ${responseData['u_id']}");
//         print("full_name: ${responseData['full_name']}");
//         print("email: ${responseData['email']}");
//         print("mobile: ${responseData['mobile']}");
//         print("player_id: ${responseData['player_id']}");
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Successfully Added Data"),
//           ),
//         );
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => FragmentHome(),
//           ),
//         );
//         final SharedPreferences prefs = await SharedPreferences.getInstance();
//
// // Save an integer value to 'counter' key.
//         await prefs.setString('full_name', '${responseData['full_name']}');
//         await prefs.setString('email', '${responseData['email']}');
//         await prefs.setString('mobile', number);
//
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Email Already Taken"),
//           ),
//         );
//         // If the response status is not 200, handle the error message
//         // if (response.body.isNotEmpty) {
//         //   Map<String, dynamic> responseBody = jsonDecode(response.body);
//         //   String errorMessage = responseBody['message'];
//         //   List<String> emailErrors = List.from(responseBody['errors']['email']);
//         //   print("this ");
//         //
//         //   print("Error message: $errorMessage");
//         //   print("Email errors: ${emailErrors.join(', ')}");
//         //
//         //   // if (responseBody.containsKey('errors') &&
//         //   //     responseBody['errors'] is Map &&
//         //   //     responseBody['errors'].containsKey('email') &&
//         //   //     responseBody['errors']['email'] is List &&
//         //   //     responseBody['errors']['email'].isNotEmpty) {
//         //   //   // Print the first error message related to the email field
//         //   //   print("Error: ${responseBody['errors']['email'][0]}");
//         //   // } else {
//         //   //   // Print a generic error message if the response structure is unexpected
//         //   //   print("Failed to upload data. Status code: ${response.statusCode}");
//         //   // }
//         // } else {
//         //   // Print a generic error message if the response body is empty
//         //   print("Failed to upload data. Status code: ${response.statusCode}");
//         // }
//       }
//     } catch (e) {
//       // Handle general errors
//       print("Error occurred while uploading data: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('$e'),
//         ),
//       );
//     }
//   }

}
