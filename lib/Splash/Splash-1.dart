import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:criccoin/Splash/Splash-2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Network.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  final String assetName = 'assets/SVG/splash.svg';


  connectivityCheck(context) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      await Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Network()));    }
    else{
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Splash2()),
        );
      });
    }
  }

  @override
  void initState() {

    connectivityCheck(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset("assets/SVG/Spalsh -1.png",fit: BoxFit.fill,)
        ),
    );
  }
}
