import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fun_facts/screens/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> facts = [];
  bool isLoading = true;

  void getData() async {
    try {
      var response = await Dio().get(
          "https://raw.githubusercontent.com/NetVanna/flutter_dummy_api/refs/heads/main/facts.json");
      facts = jsonDecode(response.data);
      isLoading = false;
      setState(() {});
    } catch (e) {
      isLoading = false;
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  /// api url from github
  // https://raw.githubusercontent.com/NetVanna/flutter_dummy_api/refs/heads/main/facts.json

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fun Facts"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingScreen(),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : PageView.builder(
                    itemCount: facts.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            facts[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 35),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 18.0),
            child: Text("Swipe to left for more >>"),
          ),
        ],
      ),
    );
  }
}
