


import 'package:flutter/material.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: Text("Help And Support Screen"),
      ),
    );
  }
}
