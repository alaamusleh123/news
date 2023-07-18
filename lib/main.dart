import 'package:flutter/material.dart';
import 'package:news_api/screens/auth/login_screen.dart';
import 'package:news_api/screens/home_screen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login_screen',
      routes: {
        '/home_screen' :(context)=>HomeScreen(),
        '/login_screen' :(context) =>LoginScreen(),
      },
    );
  }
}
