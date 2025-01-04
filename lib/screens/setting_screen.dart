import 'package:flutter/material.dart';
import 'package:fun_facts/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Theme Mode",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Switch(
                  value: themeProvider.isDarkModeChecked,
                  onChanged: (value) {
                    themeProvider.updateThemeMode(darkMode: value);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
