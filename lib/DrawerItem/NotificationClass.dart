

import 'package:flutter/material.dart';

class NotificationClass extends StatefulWidget {
  const NotificationClass({super.key});

  @override
  State<NotificationClass> createState() => _NotificationClassState();
}

class _NotificationClassState extends State<NotificationClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Notification Screen"),
      ),
    );
  }
}
