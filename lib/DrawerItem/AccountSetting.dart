


import 'package:flutter/material.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Account Setting Screen"),
      ),
    );
  }
}
