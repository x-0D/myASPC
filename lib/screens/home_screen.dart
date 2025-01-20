import 'package:flutter/material.dart';
import '../screens/schedule_screen.dart';
import '../screens/news_screen.dart';
import '../screens/contacts_screen.dart';
import '../screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const NewsScreen(),
    const ScheduleScreen(),
    const ContactsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.newspaper),
            label: 'Новости',
          ),
          NavigationDestination(
            icon: Icon(Icons.schedule),
            label: 'Расписание',
          ),
          NavigationDestination(
            icon: Icon(Icons.contacts),
            label: 'Контакты',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}
