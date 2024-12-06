import 'package:flutter/material.dart';
import 'package:projet_mobile/pages/card.dart';
import 'package:projet_mobile/pages/home.dart';
import 'package:projet_mobile/pages/profile.dart';
import 'package:projet_mobile/pages/scan.dart';
import 'package:projet_mobile/pages/stats.dart';

import 'app.dart';


void main() {
  runApp(MainLogin());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISIMS Pay',


      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    MyHomePage(title: 'Home'),
    CardPage(),
    Scan(),
    StatsPage(),
    ProfilePage()

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'), // Replace with your profile image path
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bonjour Safouen!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Bienvenue ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Badge(
              child: Icon(
                Icons.notifications,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations:  <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_rounded),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.credit_card_rounded)),
            label: 'Carte',
          ),
          NavigationDestination(
            selectedIcon: Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF1C023F),
              ),
              child: Icon(Icons.qr_code_scanner_rounded, color: Colors.white),
            ),
            icon: Container(
              width: 68.0,
              height: 68.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Icon(Icons.qr_code_scanner_rounded, color: Colors.white),
            ),
            label: '',
          ),
          NavigationDestination(

            selectedIcon: Icon(Icons.bar_chart),
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Statistiques',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.supervised_user_circle_rounded)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}