import 'package:flutter/material.dart';
import 'package:projet_mobile/pages/login.dart';

class MainLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISIMS Pay',
      theme: ThemeData(
        primaryColor: const Color(0xFF100C30),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF100C30),
          secondary: const Color(0xFF8E50F5),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          iconTheme: MaterialStateProperty.resolveWith<IconThemeData>((Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(color: Color(0xFF1C023F));
            }
            else{
              return const IconThemeData(color: Colors.grey);
            }

          }),
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(color: Color(0xFF1C023F));
            }
            return const TextStyle(color: Colors.grey);
          }),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Always show the login page first
    );
  }
}