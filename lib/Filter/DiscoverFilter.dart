import 'package:criccoin/FragmentHome.dart';
import 'package:flutter/material.dart';

class DiscoverFilter extends StatefulWidget {
  const DiscoverFilter({super.key});

  @override
  State<DiscoverFilter> createState() => _DiscoverFilterState();
}

class _DiscoverFilterState extends State<DiscoverFilter> {
  List<bool> checkboxValues = [false, false, false, false, false];

  void resetCheckboxes() {
    setState(() {
      checkboxValues = [false, false, false, false, false, false];
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: height * 0.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(height: height * 0.02,)
              Container(
                margin: EdgeInsets.only(left: height * 0.02),
                child: Text(
                  "Filter by Series",
                  style: TextStyle(
                    color: const Color(0xff06283D),
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.018,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(right: height * 0.02),
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: height * 0.02,
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Column(
            children: [
              // Create a CheckboxListTile for each checkbox
              CheckboxListTile(
                title: const Text('Odi'),
                value: checkboxValues[0],
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValues[0] = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Ipl'),
                value: checkboxValues[1],
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValues[1] = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('One Day Match'),
                value: checkboxValues[2],
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValues[2] = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('20-20'),
                value: checkboxValues[3],
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValues[3] = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Test Match'),
                value: checkboxValues[4],
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValues[4] = value!;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: height * 0.45,
          ),
          SizedBox(
            height: height * 0.05,
            width: width * 0.02,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    resetCheckboxes();
                  },
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.35,
                    decoration: const BoxDecoration(
                        color: Color(0xff54bff9),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            resetCheckboxes();
                          },
                          child: Text(
                            "Reset",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: height * 0.016,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * 0.2,
                  width: width * 0.35,
                  decoration: const BoxDecoration(
                      color: Color(0xff0BA4F6),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.done_all_outlined,
                        color: Colors.white,
                        size: height * 0.02,
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        "Apply",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: height * 0.016,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
