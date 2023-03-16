import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/whatsapp_home_screen.dart';


class PopMenu{

  HomeScreen homeScreen = HomeScreen();

  List<PopupMenuItem> popUp(){
    switch(tabb){
      case Tabb.group:
        return [
          const PopupMenuItem<int>(
            value: 0,
            child: Text("Settings"),
          ),
        ];
      case Tabb.chats:
        return [
          const PopupMenuItem<int>(
            value: 0,
            child: Text("New group"),
          ),
          const PopupMenuItem<int>(
            value: 0,
            child: Text("New broadcast"),
          ),
          const PopupMenuItem<int>(
            value: 0,
            child: Text("WhatsApp Web"),
          ),
          const PopupMenuItem<int>(
            value: 0,
            child: Text("Starred messages"),
          ),
          const PopupMenuItem<int>(
            value: 1,
            child: Text("Settings"),
          ),
        ];
      case Tabb.status:
        return [
          const PopupMenuItem<int>(
            value: 0,
            child: Text("Status privacy"),
          ),
          const PopupMenuItem<int>(
            value: 1,
            child: Text("Settings"),
          ),
        ];
      case Tabb.calls:
        return [
          const PopupMenuItem<int>(
            value: 0,
            child: Text("Calls"),
          ),
          const PopupMenuItem<int>(
            value: 1,
            child: Text("Settings"),
          ),
        ];
    }
  }

}