import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _rootNavEnabled = false;
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    String? value = await _storage.read(key: 'root_nav_enabled');
    setState(() {
      _rootNavEnabled = value == 'true'; // Convert string to boolean
    });
  }

  Future<void> _saveSettings(bool value) async {
    await _storage.write(key: 'root_nav_enabled', value: value.toString());
    setState(() {
      _rootNavEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: kToolbarHeight),
        child: Card(
          margin: const EdgeInsets.all(8.0),
          child: SwitchListTile(
            title: const Text('Root Navigation Bar'),
            value: _rootNavEnabled,
            onChanged: _saveSettings,
          ),
        ),
      ),
    );
  }
}
