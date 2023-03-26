import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/view_model/chat_listvm.dart';
import 'package:whatsapp_clone/screens/pages/individual_chat.dart';

class Chatpage extends StatefulWidget {

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ChatListViewModel>(context, listen: false).getChats();
  }
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ChatListViewModel>(context);
    return ListView.builder(
        itemCount: vm.chats.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => IndividualPage(chat: vm.chats[index])));
            },
            leading: CircleAvatar(
              radius: 23,
              child: vm.chats[index].picture == '' ? Icon(Icons.person) : Image.asset(vm.chats[index].picture),
            ),
            title: Text(vm.chats[index].user),
            subtitle: Text(vm.chats[index].message),
            trailing: Text(vm.chats[index].time),
          );
        }
    );
  }
}
