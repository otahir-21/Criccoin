
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NewsUI extends StatefulWidget {
  const NewsUI({super.key});

  @override
  State<NewsUI> createState() => _NewsUIState();
}

class _NewsUIState extends State<NewsUI> {

  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http.get(Uri.parse("https://prismcloudhosting.com/CRICCOIN_APIs/public/v1/api/news"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load data');
    }
  }
  late Future<List<Map<String, dynamic>>> newsData;

  String extractDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  @override
  void initState() {
    fetchData();
    newsData = fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: newsData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final newsList = snapshot.data!;
            return ListView.builder(
                itemCount: newsList.length, // The number of items in the list
                itemBuilder: (context, index) {
                  final newsItem = newsList[index];
                  extractDate(newsItem['created_at']);
                  // print(newsItem);
                  String imageUrl = 'https://criccoin.b-cdn.net/images/'+newsItem['image'];
                  // print(imageUrl);
                  return Column(
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                        width: width * 0.84,
                        height: height * 0.18,
                        child:Image.network(
                          imageUrl,
                          fit: BoxFit.fill,
                        )
                      ),
                      Container(
                        width: width * 0.77,
                        margin: EdgeInsets.only(top: height * 0.01),
                        child: Text(
                          extractDate(newsItem['created_at']),
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
                          newsItem['title'],
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
                        newsItem['description'],
                          style: TextStyle(
                            color: const Color(0xff181818),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: height * 0.018,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // Container(
                      //   width: width * 0.82,
                      //   alignment: Alignment.topLeft,
                      //   child: TextButton(
                      //       onPressed: () {},
                      //       child: Container(
                      //         height: height * 0.06,
                      //         width: width * 0.37,
                      //         decoration: BoxDecoration(
                      //             border: Border.all(color: const Color(0xff909090))),
                      //         child:  Center(
                      //           child: Text(
                      //             "Read More",
                      //             style: TextStyle(
                      //               color: const Color(0xff000000),
                      //               fontFamily: "Poppins",
                      //               fontWeight: FontWeight.w400,
                      //               fontSize: height * 0.018,
                      //             ),
                      //             textAlign: TextAlign.center,
                      //           ),
                      //         ),
                      //       )),
                      // ),
                    ],
                  );
                },
              );
          }
        },
      ),
    );
  }
}
