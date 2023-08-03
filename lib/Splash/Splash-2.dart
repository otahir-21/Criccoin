
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:criccoin/FragmentHome.dart';
import 'package:criccoin/Login.dart';
import 'package:criccoin/OnBoarding/OnBoarding-1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../BasicDetail.dart';
import '../Network.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  session() async {
    if (FirebaseAuth.instance.currentUser != null) {
      Timer(const Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const FragmentHome()),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/Criccoin.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();

    FirebaseAuth.instance.currentUser == null?
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnBoarding1()),
      );
    }):

    session();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              _controller.play();
              return GestureDetector(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
