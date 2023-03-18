import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/whatsapp_home_screen.dart';


class PopMenu{

  HomeScreen homeScreen = HomeScreen();

  List<PopupMenuItem> popUp(){
    switch(tabb){
      case Tabb.group:
        return [
          const PopupMenuItem<String>(
            value: 'Settings',
            child: Text("Settings"),
          ),
        ];
      case Tabb.chats:
        return [
          const PopupMenuItem<String>(
            value: 'NewGroup',
            child: Text("New group"),
          ),
          const PopupMenuItem<String>(
            value: 'NewBroadCast',
            child: Text("New broadcast"),
          ),
          const PopupMenuItem<String>(
            value: 'WhatsAppWeb',
            child: Text("WhatsApp Web"),
          ),
          const PopupMenuItem<String>(
            value: 'Starred',
            child: Text("Starred messages"),
          ),
          const PopupMenuItem<String>(
            value: 'Settings',
            child: Text("Settings"),
          ),
        ];
      case Tabb.status:
        return [
          const PopupMenuItem<String>(
            value: 'StatusPrivacy',
            child: Text("Status privacy"),
          ),
          const PopupMenuItem<String>(
            value: 'Settings',
            child: Text("Settings"),
          ),
        ];
      case Tabb.calls:
        return [
          const PopupMenuItem<String>(
            value: 'logs',
            child: Text("Call logs"),
          ),
          const PopupMenuItem<String>(
            value: 'Settings',
            child: Text("Settings"),
          ),
        ];
    }
  }

}