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
      home: MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }
}

