
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Network extends StatefulWidget {
  const Network({super.key});

  @override
  State<Network> createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/Lottie/network.json")
      ),
    );
  }
}
