import 'package:flutter/material.dart';
import 'package:projet_mobile/pages/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primaryColor: Color(0xFF1C023F), // Set your primary color
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF1C023F),
          secondary: Color(0xFF1C023F), // Set your secondary color
        ),
        textTheme: TextTheme(

          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: Colors.transparent, // Set indicator color to transparent
          iconTheme: MaterialStateProperty.resolveWith<IconThemeData>((Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return IconThemeData(color: Color(0xFF1C023F)); // Use theme's primary color when selected
            }
            return IconThemeData(); // Default icon theme
          }),
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return TextStyle(color: Color(0xFF1C023F)); // Use theme's primary color when selected
            }
            return TextStyle(); // Default text style
          }), // Use theme's primary color
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
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
                    "Welcome back",
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
        body: MyHomePage(title: '',),
        bottomNavigationBar: NavigationBar(
          indicatorColor: Colors.transparent,
            backgroundColor: Colors.grey[200],
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Badge(child: Icon(Icons.credit_card_rounded)),
              label: 'Card',
            ),
            NavigationDestination(
              selectedIcon: Container(
                width: 48.0, // Set the width as needed
                height: 48.0, // Set the height as needed
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary, // Use theme's primary color
                ),
                child: Icon(Icons.qr_code_scanner_rounded, color: Colors.white),
              ),
              icon: Container(
                width: 68.0, // Set the width as needed
                height: 68.0, // Set the height as needed
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary, // Use theme's primary color
                ),
                child: Icon(Icons.qr_code_scanner_rounded, color: Colors.white),
              ),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bar_chart),
              icon: Icon(Icons.bar_chart_rounded),
              label: 'Stats',
            ),
            NavigationDestination(
              icon: Badge(child: Icon(Icons.supervised_user_circle_rounded)),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

