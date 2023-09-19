import 'dart:async';
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:criccoin/Filter/Preference.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var color = Colors.white;
  var transparent = Colors.transparent;
  bool press = false;
  bool press2 = false;

  List<String> banners = [
    'https://criccoin.b-cdn.net/images/7265033.jpg',
    'https://criccoin.b-cdn.net/images/banner2.jpg'
  ];

  String responseData = "";

  List home_team_id = [];
  List away_team_id = [];

  List home_team_name = [];
  List home_team_logo = [];

  List away_team_name = [];
  List away_team_logo = [];

  List matchTime = [];
  List matchId = [];
  List torurnmentId = [];
  List matchName =[];
  var isLoading = true;
  var datatime ;
  var totalData = 0;
  List<Map<String, dynamic>> combinedList = [];

  Future<void> fetchingLiveMatch() async {

    DateTime dateTime1 = DateTime.now();
    int conunixTimestamp = dateTime1.millisecondsSinceEpoch ~/ 1000;
    String apiURL = "https://api.thesports.com/v1/cricket/match/diary?user=prism&secret=1cc05a496a197cc2426948c8d5615c8c&tsp=$conunixTimestamp";
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isLoading = false; // Data fetched, set isLoading to false
    });

    final response = await http.get(Uri.parse(apiURL));

    if (response.statusCode == 200) {
      setState(() {
        responseData = response.body;
      });

      var decode = jsonDecode(response.body);

      setState(() {
        totalData = decode['query']['total'];
      });

      for (var result in decode['results']) {
        home_team_id.add(result['home_team_id']);
        away_team_id.add(result['away_team_id']);
        matchTime.add(result['match_time']);
        matchId.add(result['unique_tournament_id']);
      }

      for (var result in decode['results_extra']['unique_tournament']) {
        combinedList.add({
          'id': result['id'],
          'name': result['name'],
        });
      }

      for (var results in decode['results_extra']['team']) {
        if (home_team_id.contains(results['id'])) {
          home_team_name.add(results['name']);
          home_team_logo.add(results['logo']);
        }else{
          away_team_name.add(results['name']);
          away_team_logo.add(results['logo']);
        }
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  String? findNameById(var id) {
    for (var item in combinedList) {
      if (item['id'] == id) {
        return item['name'];
      }
    }
    return null; // Return null if no match is found
  }

  fetchLiveMatch() async {
    var apiURL = 'https://api.thesports.com/v1/cricket/match/detail_live?user=prism&secret=1cc05a496a197cc2426948c8d5615c8c';
    final response = await http.get(Uri.parse(apiURL));

    if (response.statusCode == 200) {
      setState(() {
        responseData = response.body;
      });
      var decode = jsonDecode(response.body);
      // print(decode);
    } else {
      throw Exception('Failed to load data');
    }
  }

  late Timer _timer;
  String currentTime = '';

  void getLiveTime() {
    DateTime datetime = DateTime.now();
    TimeOfDay timeOfDay = TimeOfDay.fromDateTime(datetime);

    setState(() {
      currentTime =
      '${timeOfDay.hour}:${timeOfDay.minute.toString().padLeft(2, '0')}:${datetime.second.toString().padLeft(2, '0')}';
    });
  }
 // redeme


  // crickbus
  // crickline guru   --> important
  // crick maza

  // live match video
  //
  // bet fare

  @override
  void initState() {
    fetchingLiveMatch();
    fetchLiveMatch();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      getLiveTime();
    });
    super.initState();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.18,
            width: double.infinity,
            alignment: Alignment.bottomRight,
            child: CarouselSlider(
              items: [
                for (int i = 0; i < banners.length; i++)
                  SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      banners[i].toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                // Other images can be added here in the same format
              ],
              options: CarouselOptions(
                height: double.infinity,
                aspectRatio: 16 / 1,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            height: height * 0.06,
            margin: EdgeInsets.only(
              left: height * 0.03,
              right: height * 0.03,
            ),
            decoration: const BoxDecoration(
                color: Color(0xff9cdbfc),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      press == true
                          ? press == true
                              ? press = false
                              : press = true
                          : null;
                    });
                  },
                  child: Container(
                    height: height * 0.057,
                    width: width * 0.43,
                    decoration: BoxDecoration(
                        color: press == false ? color : transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Center(
                      child: Text(
                        "Upcoming",
                        style: TextStyle(
                          color: const Color(0xff5E849C),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.018,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      press == false
                          ? press == false
                              ? press = true
                              : press = false
                          : null;
                    });
                  },
                  child: Container(
                    height: height * 0.057,
                    width: width * 0.43,
                    decoration: BoxDecoration(
                        color: press == true ? color : transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Center(
                      child: Text(
                        "Recent",
                        style: TextStyle(
                          color: const Color(0xff5E849C),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: height * 0.018,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          press == false ?
          // SizedBox(
          //         height: height * 0.50,
          //         width: width * 0.90,
          //         child: Stack(
          //           children: [
          //             SizedBox(
          //                 height: height * 0.15,
          //                 width: double.infinity,
          //                 child: Image.asset(
          //                   'assets/banner/ipl.png',
          //                   fit: BoxFit.fill,
          //                 )),
          //             isLoading ? const Center(
          //               child: CircularProgressIndicator(), // Show circular progress indicator
          //             ):
          //             Positioned(
          //               top: height * 0.06,
          //               child: SizedBox(
          //                 height: height * 0.45,
          //                 width: width * 0.90,
          //                 child: ListView.builder (
          //                   shrinkWrap: false,
          //                   scrollDirection : Axis.vertical,
          //                   itemCount: away_team_name.length,
          //                   itemBuilder: (BuildContext context, int index) {
          //                     int unixTimestamp = matchTime[index];
          //                     String _twoDigits(int n) {
          //                       if (n >= 10) return "$n";
          //                       return "0$n";
          //                     }
          //
          //                     String _threeDigits(int n) {
          //                       if (n >= 100) return "$n";
          //                       if (n >= 10) return "0$n";
          //                       return "00$n";
          //                     }
          //
          //                     DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
          //
          //                     String formattedDateTime = '${dateTime.year}-${_twoDigits(dateTime.month)}-${_twoDigits(dateTime.day)} ${_twoDigits(dateTime.hour)}:${_twoDigits(dateTime.minute)}:${_twoDigits(dateTime.second)}.${_threeDigits(dateTime.millisecond)}';
          //
          //                     String formattedDate = '${dateTime.year}-${_twoDigits(dateTime.month)}-${_twoDigits(dateTime.day)}';
          //                     String formattedTime = '${_twoDigits(dateTime.hour)}:${_twoDigits(dateTime.minute)}:${_twoDigits(dateTime.second)}.${_threeDigits(dateTime.millisecond)}';
          //                     return Card(
          //                       elevation: 0.1,
          //                       child: Container(
          //                         height: height * 0.168,
          //                         width: width * 0.85,
          //                         decoration: BoxDecoration(
          //                             color: Colors.white,
          //                             borderRadius: BorderRadius.circular(20)),
          //                         child: Column(
          //                           children: [
          //                             SizedBox(
          //                               height: height * 0.01,
          //                             ),
          //                             Container(
          //                               height: height * 0.02,
          //                               width: width * 0.80,
          //                               alignment: Alignment.centerLeft,
          //                               child: Text(
          //                                 findNameById(matchId[index]).toString(),
          //                                 style: TextStyle(
          //                                   color: Colors.black,
          //                                   fontFamily: "Poppins",
          //                                   fontWeight: FontWeight.w400,
          //                                   fontSize: height * 0.017,
          //                                 ),
          //                               ),
          //                             ),
          //                             const Divider(
          //                               indent: 12,
          //                               endIndent: 12,
          //                               color: Colors.black,
          //                               thickness: 0.3,
          //                             ),
          //                             SizedBox(
          //                               height: height * 0.03,
          //                               width: width * 0.8,
          //                               child: Row(
          //                                 mainAxisAlignment:
          //                                     MainAxisAlignment.spaceBetween,
          //                                 children: [
          //                                   Text(
          //                                     home_team_name[index],
          //                                     style: TextStyle(
          //                                       color: Colors.black,
          //                                       fontFamily: "Poppins",
          //                                       fontWeight: FontWeight.w400,
          //                                       fontSize: height * 0.014,
          //                                     ),
          //                                   ),
          //                                   Text(
          //                                     away_team_name[index],
          //                                     style: TextStyle(
          //                                       color: Colors.black,
          //                                       fontFamily: "Poppins",
          //                                       fontWeight: FontWeight.w400,
          //                                       fontSize: height * 0.014,
          //                                     ),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                             SizedBox(
          //                               height: height * 0.03,
          //                               width: width * 0.77,
          //                               child: Row(
          //                                 mainAxisAlignment:
          //                                     MainAxisAlignment.spaceBetween,
          //                                 children: [
          //                                   Row(
          //                                     mainAxisAlignment:
          //                                         MainAxisAlignment
          //                                             .spaceBetween,
          //                                     children: [
          //                                       SizedBox(
          //                                         height: height * 0.04,
          //                                         width: width * 0.06,
          //                                         child: home_team_logo[index].isEmpty
          //                                             ? Image.asset('assets/Icons/cricket.png') // Replace 'assets/default_image.png' with your default image asset
          //                                             : Image.network(home_team_logo[index]
          //                                         ),
          //                                       ),
          //                                       SizedBox(
          //                                         width: width * 0.02,
          //                                       ),
          //                                       // Text(
          //                                       //   "Kkr ",
          //                                       //   style: TextStyle(
          //                                       //     color: Colors.black,
          //                                       //     fontFamily: "Poppins",
          //                                       //     fontWeight: FontWeight.w600,
          //                                       //     fontSize: height * 0.017,
          //                                       //   ),
          //                                       // ),
          //                                     ],
          //                                   ),
          //                                   Row(
          //                                     mainAxisAlignment:
          //                                         MainAxisAlignment
          //                                             .spaceBetween,
          //                                     children: [
          //                                       // Text(
          //                                       //   "Csk",
          //                                       //   style: TextStyle(
          //                                       //     color: Colors.black,
          //                                       //     fontFamily: "Poppins",
          //                                       //     fontWeight: FontWeight.w600,
          //                                       //     fontSize: height * 0.017,
          //                                       //   ),
          //                                       // ),
          //                                       SizedBox(
          //                                         width: width * 0.02,
          //                                       ),
          //                                       SizedBox(
          //                                         height: height * 0.04,
          //                                         width: width * 0.06,
          //                                         child: home_team_logo[index].isEmpty
          //                                             ? Image.asset('assets/Icons/cricket.png') // Replace 'assets/default_image.png' with your default image asset
          //                                             : Image.network(away_team_logo[index]),
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //
          //                             Text(
          //                               formattedTime.toString(),
          //                               style: TextStyle(
          //                                 color: const Color(0xffFF0000),
          //                                 fontFamily: "Poppins",
          //                                 fontWeight: FontWeight.w400,
          //                                 fontSize: height * 0.017,
          //                               ),
          //                             ),
          //                             SizedBox(
          //                               width: width * 0.80,
          //                               height: height * 0.03,
          //                               child: Row(
          //                                 mainAxisAlignment:
          //                                     MainAxisAlignment.spaceBetween,
          //                                 children: [
          //                                   Container(
          //                                     height: height * 0.03,
          //                                     width: width * 0.35,
          //                                     decoration: const BoxDecoration(
          //                                         color: Color(0xff0BA4F6),
          //                                         borderRadius:
          //                                             BorderRadius.only(
          //                                           topLeft:
          //                                               Radius.circular(10),
          //                                           topRight:
          //                                               Radius.circular(10),
          //                                         )),
          //                                     child: Text(
          //                                       "Today, $formattedDate",
          //                                       style: TextStyle(
          //                                         color:
          //                                             const Color(0xffFFFFFF),
          //                                         fontFamily: "Poppins",
          //                                         fontWeight: FontWeight.w400,
          //                                         fontSize: height * 0.017,
          //                                       ),
          //                                       textAlign: TextAlign.center,
          //                                     ),
          //                                   ),
          //                                   InkWell(
          //                                     onTap: () async {
          //                                       final SharedPreferences prefs = await SharedPreferences.getInstance();
          //                                       await prefs.setString('matchId', matchId[index]);
          //
          //
          //                                       await prefs.setString('homeTeamID', home_team_id[index]);
          //                                       await prefs.setString('awayTeamID', away_team_id[index]);
          //
          //                                       await prefs.setString('series', findNameById(matchId[index]).toString());
          //
          //                                       await prefs.setString('matchTime', formattedTime);
          //                                       await prefs.setString('matchDate', formattedDate);
          //
          //
          //                                       final String? series = prefs.getString('matchId');
          //                                       print(series);
          //                                       // await series.setString('awayTeamID', away_team_id[index]);
          //
          //
          //
          //                                       Navigator.of(context).push(
          //                                           MaterialPageRoute(
          //                                               builder: (context) => const Preference()));
          //
          //                                       // compareTimes();
          //                                     },
          //                                     child: Container(
          //                                         height: height * 0.03,
          //                                         width: width * 0.35,
          //                                         decoration:
          //                                             const BoxDecoration(
          //                                                 color:
          //                                                     Color(0xff0BA4F6),
          //                                                 borderRadius:
          //                                                     BorderRadius.only(
          //                                                   topLeft:
          //                                                       Radius.circular(
          //                                                           10),
          //                                                   topRight:
          //                                                       Radius.circular(
          //                                                           10),
          //                                                 )),
          //                                         child: Row(
          //                                           mainAxisAlignment:
          //                                               MainAxisAlignment
          //                                                   .center,
          //                                           children: [
          //                                             Text(
          //                                               "Start Prediction",
          //                                               style: TextStyle(
          //                                                 color: const Color(
          //                                                     0xffFFFFFF),
          //                                                 fontFamily: "Poppins",
          //                                                 fontWeight:
          //                                                     FontWeight.w400,
          //                                                 fontSize:
          //                                                     height * 0.017,
          //                                               ),
          //                                               textAlign:
          //                                                   TextAlign.center,
          //                                             ),
          //                                             const Icon(
          //                                               Icons
          //                                                   .center_focus_strong_rounded,
          //                                               color: Colors.white,
          //                                             ),
          //                                           ],
          //                                         )),
          //                                   )
          //                                 ],
          //                               ),
          //                             )
          //                           ],
          //                         ),
          //                       ),
          //                     );
          //                   },
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       )
          SizedBox(
            height: height * 0.50,
            width: width * 0.90,
            child: Stack(
              children: [
                SizedBox(
                    height: height * 0.15,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/banner/ipl.png',
                      fit: BoxFit.fill,
                    )),
                isLoading ? const Center(
                  child: CircularProgressIndicator(), // Show circular progress indicator
                ):
                Positioned(
                  top: height * 0.06,
                  child: SizedBox(
                    height: height * 0.45,
                    width: width * 0.90,
                    child: ListView.builder (
                      shrinkWrap: false,
                      scrollDirection : Axis.vertical,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                      return Card(
                          elevation: 0.1,
                          child: Container(
                            height: height * 0.168,
                            width: width * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Container(
                                  height: height * 0.02,
                                  width: width * 0.80,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "tournament name",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize: height * 0.017,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  indent: 12,
                                  endIndent: 12,
                                  color: Colors.black,
                                  thickness: 0.3,
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                  width: width * 0.8,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "team A Name",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w400,
                                          fontSize: height * 0.014,
                                        ),
                                      ),
                                      Text(
                                        "team B Name",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w400,
                                          fontSize: height * 0.014,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                  width: width * 0.77,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: height * 0.04,
                                            // width: width * 0.06,
                                            child: Text("Team A logo")
                                          ),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          // Text(
                                          //   "Kkr ",
                                          //   style: TextStyle(
                                          //     color: Colors.black,
                                          //     fontFamily: "Poppins",
                                          //     fontWeight: FontWeight.w600,
                                          //     fontSize: height * 0.017,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          // Text(
                                          //   "Csk",
                                          //   style: TextStyle(
                                          //     color: Colors.black,
                                          //     fontFamily: "Poppins",
                                          //     fontWeight: FontWeight.w600,
                                          //     fontSize: height * 0.017,
                                          //   ),
                                          // ),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          SizedBox(
                                            height: height * 0.04,
                                            // width: width * 0.06,
                                            child:Text("Team B logo")
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Text(
                                  "match time ",
                                  style: TextStyle(
                                    color: const Color(0xffFF0000),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w400,
                                    fontSize: height * 0.017,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.80,
                                  height: height * 0.03,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: height * 0.03,
                                        width: width * 0.35,
                                        decoration: const BoxDecoration(
                                            color: Color(0xff0BA4F6),
                                            borderRadius:
                                            BorderRadius.only(
                                              topLeft:
                                              Radius.circular(10),
                                              topRight:
                                              Radius.circular(10),
                                            )),
                                        child: Text(
                                          "match date ",
                                          style: TextStyle(
                                            color:
                                            const Color(0xffFFFFFF),
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                            fontSize: height * 0.017,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                                          await prefs.setString('matchId', matchId[index]);


                                          await prefs.setString('homeTeamID', home_team_id[index]);
                                          await prefs.setString('awayTeamID', away_team_id[index]);

                                          await prefs.setString('series', findNameById(matchId[index]).toString());



                                          final String? series = prefs.getString('matchId');
                                          print(series);
                                          // await series.setString('awayTeamID', away_team_id[index]);



                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) => const Preference()));

                                          // compareTimes();
                                        },
                                        child: Container(
                                            height: height * 0.03,
                                            width: width * 0.35,
                                            decoration:
                                            const BoxDecoration(
                                                color:
                                                Color(0xff0BA4F6),
                                                borderRadius:
                                                BorderRadius.only(
                                                  topLeft:
                                                  Radius.circular(
                                                      10),
                                                  topRight:
                                                  Radius.circular(
                                                      10),
                                                )),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                Text(
                                                  "Start Prediction",
                                                  style: TextStyle(
                                                    color: const Color(
                                                        0xffFFFFFF),
                                                    fontFamily: "Poppins",
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    fontSize:
                                                    height * 0.017,
                                                  ),
                                                  textAlign:
                                                  TextAlign.center,
                                                ),
                                                const Icon(
                                                  Icons
                                                      .center_focus_strong_rounded,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
              : SizedBox(
                  height: height * 0.50,
                  width: width * 0.90,
                  child: Stack(
                    children: [
                      SizedBox(
                          height: height * 0.15,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/banner/ipl.png',
                            fit: BoxFit.fill,
                          )),
                      Positioned(
                        top: height * 0.06,
                        child: SizedBox(
                          height: height * 0.45,
                          width: width * 0.90,
                          child: ListView.builder(
                            shrinkWrap: false,
                            scrollDirection: Axis.vertical,
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 0.1,
                                child: Container(
                                  height: height * 0.168,
                                  width: width * 0.85,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Container(
                                        height: height * 0.02,
                                        width: width * 0.80,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Tata Ipl",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                            fontSize: height * 0.017,
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        indent: 12,
                                        endIndent: 12,
                                        color: Colors.black,
                                        thickness: 0.3,
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                        width: width * 0.8,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Kolkata Knight Riders",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                                fontSize: height * 0.014,
                                              ),
                                            ),
                                            Text(
                                              "Chennai Super Kings",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                                fontSize: height * 0.014,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                        width: width * 0.77,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Icon(Icons.ice_skating),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                Text(
                                                  "Kkr ",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: height * 0.017,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Csk",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: height * 0.017,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                const Icon(Icons.ice_skating),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "Complete",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w400,
                                          fontSize: height * 0.017,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.80,
                                        height: height * 0.03,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: height * 0.03,
                                              width: width * 0.35,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff0BA4F6),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                  )),
                                              child: Text(
                                                "Today, 1:00 pm",
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xffFFFFFF),
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: height * 0.017,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Preference()));
                                              },
                                              child: Container(
                                                  height: height * 0.03,
                                                  width: width * 0.35,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              Color(0xff0BA4F6),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10),
                                                          )),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "You won 155 CC",
                                                        style: TextStyle(
                                                          color: const Color(
                                                              0xffFFFFFF),
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize:
                                                              height * 0.017,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      const Icon(
                                                        Icons
                                                            .center_focus_strong_rounded,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  )),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
