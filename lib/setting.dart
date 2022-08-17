import 'package:flutter/material.dart';

// ignore: camel_case_types
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 46, 140),
        centerTitle: true,
        title: const Text('设置'),
      ),
      body: const Center(
          child: Text('Setting'),
          ),
    );
  }
}

