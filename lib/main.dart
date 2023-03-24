import 'package:flutter/material.dart';
import 'screens/whatsapp_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/view_model/chat_listvm.dart';
import 'package:whatsapp_clone/view_model/status/status_listvm.dart';
import 'package:whatsapp_clone/view_model/calls/calls_listvm.dart';

void main() async{

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (BuildContext context) => ChatListViewModel(),),
      ChangeNotifierProvider(create: (BuildContext context) => StatusListViewModel()),
      ChangeNotifierProvider(create: (BuildContext context) => CallsListViewModel()),
    ],
    child: MaterialApp(
      title: 'WhatsApp clone',
      home: HomeScreen(),
    ),
    );
  }
}
