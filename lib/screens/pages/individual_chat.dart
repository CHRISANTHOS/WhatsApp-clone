import 'package:flutter/material.dart';
import 'package:whatsapp_clone/view_model/chat_vm.dart';

class IndividualPage extends StatefulWidget {
  ChatViewModel chat;
  IndividualPage({super.key, required this.chat});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height  = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          width:  width,
          height: height,
          color: Colors.grey,
        ),
        Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios)),
            title: Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white30,
                  child: Icon(Icons.person),
                ),
                Column(
                  children: [
                    Text(widget.chat.user),
                    const Text('Active')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
