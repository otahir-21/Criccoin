
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:criccoin/FragmentHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'GlobalVariable.dart';


class BasicDetails extends StatefulWidget {
  const BasicDetails({super.key});

  @override
  State<BasicDetails> createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {

  File? image;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
      // uploadImage();
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  Future pickImageGallery() async {
    try {
      final ImagePicker picker = ImagePicker();

      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() {
        this.image = imageTemp;
      });
      // uploadImage();
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  // File imageFile;
  String url = '$globalVariable/uploads';
  var uid = FirebaseAuth.instance.currentUser?.uid;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.14,
              left: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
            ),
            child: Text(
              "Welcome to Criccoin",
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  fontSize: MediaQuery
                      .of(context)
                      .size
                      .height * 0.02),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
              right: MediaQuery
                  .of(context)
                  .size
                  .height * 0.15,
            ),
            child: Text(
              "Enter Basic Details",
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  fontSize: MediaQuery
                      .of(context)
                      .size
                      .height * 0.02),
            ),
          ),

          Container(
            margin: EdgeInsets.only(
              right: MediaQuery
                  .of(context)
                  .size
                  .height * 0.37,
              top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
              left: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xff06283D),
                  width: 2),
            ),
            child: Center(
                child: image != null
                    ? Image.file(
                  image!,
                  fit: BoxFit.fill,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.06,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.06,
                ) : Icon(Icons.person, size: MediaQuery
                    .of(context)
                    .size
                    .height * 0.06,)
            ),
          ),

          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: SizedBox(
                      height: height * 0.13,
                      width: width * 0.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Change Profile Picture",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: height * 0.017),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(Icons.close)),
                            ],
                          ),
                          const Divider(),
                          SizedBox(
                            height: height * 0.039,
                            child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    pickImageCamera();
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Capture Image",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: height * 0.017,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.039,
                            child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    pickImageGallery();
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Upload Image",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: height * 0.017,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                  left: height * 0.13,
                  right: height * 0.13,
                  top: height * 0.02),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xffF2F6F8),
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              child: Text(
                "Tap to Upload Image",
                style: TextStyle(
                  color: const Color(0xff5E849C),
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.018,
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(
              top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.04,
              left: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
              right: MediaQuery
                  .of(context)
                  .size
                  .height * 0.15,
            ),
            child: Text(
              "Enter Your Full Name",
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  fontSize: MediaQuery
                      .of(context)
                      .size
                      .height * 0.02),
            ),
          ),

          Container(
            margin: EdgeInsets.only(
              top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.01,
              left: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
              right: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
            ),
            height: MediaQuery
                .of(context)
                .size
                .height * 0.05,
            width: MediaQuery
                .of(context)
                .size
                .height * 0.03,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: const Color(0xffD3DBE3),)
            ),
            child: TextFormField(
              keyboardType: TextInputType.name,
              autofocus: false,
              textAlign: TextAlign.start,
              cursorColor: Colors.black,
              controller: nameController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Enter your full name",
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

          // Container(
          //   margin: EdgeInsets.only(
          //     top: MediaQuery
          //         .of(context)
          //         .size
          //         .height * 0.02,
          //     left: MediaQuery
          //         .of(context)
          //         .size
          //         .height * 0.02,
          //     right: MediaQuery
          //         .of(context)
          //         .size
          //         .height * 0.15,
          //   ),
          //   child: Text(
          //     "Enter Your Player Id",
          //     style: TextStyle(
          //         color: const Color(0xff000000),
          //         fontWeight: FontWeight.w700,
          //         fontFamily: "Poppins",
          //         fontSize: MediaQuery
          //             .of(context)
          //             .size
          //             .height * 0.02),
          //   ),
          // ),

          // Container(
          //   margin: EdgeInsets.only(
          //     top: MediaQuery
          //         .of(context)
          //         .size
          //         .height * 0.01,
          //     left: MediaQuery
          //         .of(context)
          //         .size
          //         .height * 0.02,
          //     right: MediaQuery
          //         .of(context)
          //         .size
          //         .height * 0.02,
          //   ),
          //   height: MediaQuery
          //       .of(context)
          //       .size
          //       .height * 0.05,
          //   width: MediaQuery
          //       .of(context)
          //       .size
          //       .height * 0.03,
          //   decoration: BoxDecoration(
          //       borderRadius: const BorderRadius.all(Radius.circular(10)),
          //       border: Border.all(color: const Color(0xffD3DBE3),)
          //   ),
          //   child: TextFormField(
          //     keyboardType: TextInputType.name,
          //     autofocus: false,
          //     textAlign: TextAlign.start,
          //     cursorColor: Colors.black,
          //
          //     style: const TextStyle(color: Colors.black),
          //     decoration: InputDecoration(
          //       hintText: "Enter Your Player Id",
          //       contentPadding: const EdgeInsets.all(0.0),
          //       disabledBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(28.0),
          //         borderSide: const BorderSide(
          //           color: Colors.white,
          //         ),
          //       ),
          //       enabledBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(28.0),
          //         borderSide: const BorderSide(
          //           color: Colors.white,
          //         ),
          //       ),
          //       focusedErrorBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(28.0),
          //         borderSide: const BorderSide(
          //           color: Colors.white,
          //         ),
          //       ),
          //       // hintStyle: const TextStyle(color: Colors.black),
          //       errorBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(28.0),
          //         borderSide: const BorderSide(
          //           color: Colors.white,
          //         ),
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(28.0),
          //         borderSide: const BorderSide(
          //           color: Colors.white,
          //         ),
          //       ),
          //       focusColor: Colors.black,
          //     ),
          //   ),
          // ),

          Container(
            margin: EdgeInsets.only(
              top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
              left: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
              right: MediaQuery
                  .of(context)
                  .size
                  .height * 0.15,
            ),
            child: Text(
              "Enter Your Email Address",
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  fontSize: MediaQuery
                      .of(context)
                      .size
                      .height * 0.02),
            ),
          ),

          Container(
            margin: EdgeInsets.only(
              top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.01,
              left: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
              right: MediaQuery
                  .of(context)
                  .size
                  .height * 0.02,
            ),
            height: MediaQuery
                .of(context)
                .size
                .height * 0.05,
            width: MediaQuery
                .of(context)
                .size
                .height * 0.03,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: const Color(0xffD3DBE3),)
            ),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              textAlign: TextAlign.start,
              cursorColor: Colors.black,
              controller: emailController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Enter Your Email Address",
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

          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.21,
          ),

          InkWell(
            onTap: () {
              // uploadImage(image!);
              uploadData();
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FragmentHome()));

            },
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.06,
              decoration: const BoxDecoration(
                  color: Color(0xff0BA4F6),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.only(
                left: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,
                right: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,
              ),
              child: Center(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .height * 0.02,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String removeCountryCode(String phoneNumber) {
    // Check if the phone number contains a "+" sign
    if (phoneNumber.startsWith('+')) {
      // Extract the phone number without the country code
      return phoneNumber.substring(1); // Assuming the country code is "+971"
    } else {
      // Return the original phone number if it doesn't contain a country code
      return phoneNumber;
    }
  }

  // update() async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse('$globalVariable/auth/register'),
  //       body: jsonEncode(<String, String>{
  //         "u_id": uid.toString(),
  //         "full_name": nameController.text,
  //         "email": emailController.text,
  //         "mobile": number
  //       }),
  //     );
  //     print(response.statusCode);
  //     print(body);
  //
  //     if (response.statusCode == 200) {
  //       // final getUserModel = getUserModelFromJson(response.body);
  //       // userController.value = getUserModel;
  //       // return getUserModel;
  //     }
  //   } catch (e) {
  //     log("$e");
  //   }
  // }

  Future<void> uploadData() async {
    String url = '$globalVariable/auth/register';

    var phone = FirebaseAuth.instance.currentUser?.phoneNumber;
    String number = removeCountryCode(phone!);

    // Define the data you want to upload
    Map<String, dynamic> data = {
      "u_id": uid,
      "full_name": nameController.text,
      "email": emailController.text,
      "mobile": number
    };

    try {
    //   // Convert data to JSON format
      String jsonData = jsonEncode(data);

      // Set up the headers
      Map<String, String> headers = {
        "Content-Type": "application/json",
      };

      // Make the HTTP POST request
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonData,
      );

      print(response.statusCode);
      // Check the response status

      if (response.statusCode == 201) {
        // Data uploaded successfully, parse the JSON response
        Map<String, dynamic> responseData = jsonDecode(response.body);
        print("Uploaded Data:");
        print("u_id: ${responseData['u_id']}");
        print("full_name: ${responseData['full_name']}");
        print("email: ${responseData['email']}");
        print("mobile: ${responseData['mobile']}");
        print("player_id: ${responseData['player_id']}");

        ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Successfully Added Data"),
                  ),
        );
        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FragmentHome(),
                        ),
                      );
        final SharedPreferences prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
        await prefs.setString('full_name', '${responseData['full_name']}');
        await prefs.setString('email', '${responseData['email']}');
        await prefs.setString('mobile', number);
        await prefs.setString('uid', uid!);
        await prefs.setString('playerId', '${responseData['player_id']}');

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Email Already Taken"),
          ),
        );
        // If the response status is not 200, handle the error message
        // if (response.body.isNotEmpty) {
        //   Map<String, dynamic> responseBody = jsonDecode(response.body);
        //   String errorMessage = responseBody['message'];
        //   List<String> emailErrors = List.from(responseBody['errors']['email']);
        //   print("this ");
        //
        //   print("Error message: $errorMessage");
        //   print("Email errors: ${emailErrors.join(', ')}");
        //
        //   // if (responseBody.containsKey('errors') &&
        //   //     responseBody['errors'] is Map &&
        //   //     responseBody['errors'].containsKey('email') &&
        //   //     responseBody['errors']['email'] is List &&
        //   //     responseBody['errors']['email'].isNotEmpty) {
        //   //   // Print the first error message related to the email field
        //   //   print("Error: ${responseBody['errors']['email'][0]}");
        //   // } else {
        //   //   // Print a generic error message if the response structure is unexpected
        //   //   print("Failed to upload data. Status code: ${response.statusCode}");
        //   // }
        // } else {
        //   // Print a generic error message if the response body is empty
        //   print("Failed to upload data. Status code: ${response.statusCode}");
        // }
      }
    } catch (e) {
      // Handle general errors
      print("Error occurred while uploading data: $e");
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text('$e'),
        ),
      );
    }
  }

  Map<String, dynamic> convertFileToDataStructure(File image) {
    // Get the file path from the File object
    String filePath = image.path;

    // Create the JSON data structure
    Map<String, dynamic> dataStructure = {
      "file": {
        "path": filePath,
      },
      "is360": false,
      "alt_text": "",
    };

    return dataStructure;
  }

  Future<void> uploadImage(File imagePath) async {
    final String uploadUrl = '$globalVariable/uploads';

    try {
      final imageBytes = await imagePath.readAsBytes();
      final String base64Image = base64Encode(imageBytes);

      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      Map<String, dynamic> requestBody = {
        'images': {'path': base64Image},
        'data': {
          'is360': false,
          'alt_text': '',
        }
      };

      http.Response response = await http.post(
        Uri.parse(uploadUrl),
        headers: headers,
        body: jsonEncode(requestBody),
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        // Image uploaded successfully
        print('Image uploaded successfully');
        print(response.body);
      } else {
        // Handle error if the upload was unsuccessful
        print('Image upload failed with status code: ${response.statusCode}');
        print(response.body);

        // Parse the API response and handle the error message
        try {
          Map<String, dynamic> jsonResponse = jsonDecode(response.body);
          String errorMessage = jsonResponse['message'];
          int statusCode = jsonResponse['status'];

          print('Error Message: $errorMessage');
          print('Status Code: $statusCode');
        } catch (e) {
          // Handle JSON parsing error
          print('Error while parsing API response: $e');
        }
      }
    } catch (e) {
      // Handle any exceptions that occurred during the process
      print('Error while uploading image: $e');
    }
  }

}
