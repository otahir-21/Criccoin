import 'dart:convert';
import 'dart:io';

import 'package:criccoin/JoiningCharges/JoiningCharges.dart';
import 'package:criccoin/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../DrawerItem/AccountSetting.dart';
import '../DrawerItem/HelpAndSupport.dart';
import '../DrawerItem/Invite.dart';
import '../DrawerItem/NotificationClass.dart';
import '../DrawerItem/Wallet.dart';
import '../GlobalVariable.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String selectedGender = 'Male';

  var selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked.toString().replaceAll(' 00:00:00.000', '');
        changeOccur = true;
      });
    }
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
      setState(() {
        isLoading = true;
      });

      Map<String, dynamic> userData = await fetchUserData(uid);

      // Check if the userData is not empty or null
      if (userData.isNotEmpty) {
        // User data is available, you can use the data here
        fullName.text = userData['full_name'];
        number.text = userData['mobile'];
        emailController.text = userData['email'];
        playerId.text = userData['player_id'];
        print(userData);
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FragmentHome()));

      } else {
        // No data available for the given UID
        print('No data available');
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BasicDetails()));
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      // Handle any errors that may occur during the API call
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  bool isLoading = true;

  void _handleRadioValueChange(String? value) {
    setState(() {
      selectedGender = value!;
      changeOccur = true;
    });
  }

  TextEditingController fullName = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController playerId = TextEditingController();

  bool changeOccur = false;
  File? image;

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
  @override
  void initState() {
    // getData();
    getUserData(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }
  getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userName = prefs.getString('full_name');
    final String? email = prefs.getString('email');
    final String? mobile = prefs.getString('mobile');
    final String? playerI = prefs.getString('playerId');

    fullName.text = userName.toString();
    number.text = mobile.toString();
    emailController.text = email.toString();
    playerId.text = playerI.toString();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: isLoading? const Center(
          child: CircularProgressIndicator(), // Show circular progress indicator while loading
        ): ListView(
          children: [
            Container(
              width: width * 0.20,
              margin: EdgeInsets.only(top: height * 0.03),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
              child:  Center(
                  child: image != null
                      ? Image.file(
                    image!,
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.06,
                  ):Icon(Icons.person,size: MediaQuery.of(context).size.height * 0.06,)
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
            SizedBox(
              height: height * 0.01,
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: height * 0.04),
                  child: Text(
                    "Full Name",
                    style: TextStyle(
                      color: const Color(0xff00386D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.02,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: height * 0.04, right: height * 0.02),
                  width: width * 0.92,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: const Color(0xffEBF1F4))),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    controller: fullName,
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      setState(() {
                        changeOccur = true;
                      });
                    },
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),

                    decoration: InputDecoration(
                      hintText: "Full name",
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
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: height * 0.04),
                  child: Text(
                    "Number",
                    style: TextStyle(
                      color: const Color(0xff00386D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.02,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: height * 0.04, right: height * 0.02),
                  width: width * 0.92,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: const Color(0xffEBF1F4))),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    controller: number,
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      setState(() {
                        changeOccur = true;
                      });
                    },
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "969261788",
                      contentPadding: const EdgeInsets.all(0.0),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),

                      prefix: const Text(
                        " +91 ",
                        style: TextStyle(color: Colors.black),
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
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: height * 0.04),
                  child: Text(
                    "Player Id",
                    style: TextStyle(
                      color: const Color(0xff00386D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.02,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: height * 0.04, right: height * 0.02),
                  width: width * 0.92,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: const Color(0xffEBF1F4))),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    controller: playerId,
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      setState(() {
                        changeOccur = true;
                      });
                    },
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Player Id",
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
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: height * 0.04),
                  child: Text(
                    "Gender",
                    style: TextStyle(
                      color: const Color(0xff00386D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.02,
                    ),
                  ),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.c,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: height * 0.04),
                      // alignment: Alignment.center,
                      width: width * 0.40,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: const Color(0xffEBF1F4))),
                      child: RadioListTile<String>(
                        title: Text(
                          'Male',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: height * 0.02,
                          ),
                        ),
                        value: 'Male',
                        groupValue: selectedGender,
                        onChanged: _handleRadioValueChange,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: height * 0.03),
                      width: width * 0.40,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: const Color(0xffEBF1F4))),
                      child: RadioListTile<String>(
                        activeColor: Colors.blue,
                        title: Text(
                          'Female',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: height * 0.02,
                          ),
                        ),
                        value: 'Female',
                        groupValue: selectedGender,
                        onChanged: _handleRadioValueChange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: height * 0.04),
                  child: Text(
                    "Date Of birth",
                    style: TextStyle(
                      color: const Color(0xff00386D),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.02,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: height * 0.04, right: height * 0.02),
                  width: width * 0.92,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: const Color(0xffEBF1F4))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      selectedDate == null
                          ? const Text(
                              "Select date",
                              style: TextStyle(color: Colors.black),
                            )
                          : Text('$selectedDate'),
                      selectedDate == null
                          ? IconButton(
                              icon: const Icon(Icons.calendar_today),
                              onPressed: () => _selectDate(context),
                            )
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    signOutUser();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                        color: changeOccur == false
                            ? const Color(0xff9ddbfb)
                            : const Color(0xff0BA4F6),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.02,
                      right: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: Center(
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: changeOccur == false
                              ? Colors.black
                              : Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const JoiningCharges()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                        color: changeOccur == false
                            ? const Color(0xff9ddbfb)
                            : const Color(0xff0BA4F6),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.02,
                      right: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: Center(
                      child: Text(
                        "Save Change",
                        style: TextStyle(
                          color: changeOccur == false
                              ? Colors.black
                              : Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
  void signOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
    } catch (e) {
      // An error occurred
      print("Error signing out: $e");
    }
  }
}
