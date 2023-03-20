import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/view_model/chat_listvm.dart';

class Chatpage extends StatefulWidget {

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ChatListViewModel>(context);
    return ListView.builder(
        itemCount: vm.chats.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Image.asset(vm.chats[index].picture),
            ),
            title: Text(vm.chats[index].user),
            subtitle: Text(vm.chats[index].message),
            trailing: Text(vm.chats[index].time),
          );
        }
    );
  }
}
