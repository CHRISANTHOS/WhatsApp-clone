import 'package:flutter/material.dart';
import 'screens/whatsapp_home_screen.dart';

void main() async{

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp clone',
      home: HomeScreen(),
    );
  }
}
