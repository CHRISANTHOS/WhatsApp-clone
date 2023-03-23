import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:whatsapp_clone/view_model/calls/calls_listvm.dart';


class CallPage extends StatefulWidget {

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 22,
              backgroundColor: const Color(0xff25D366),
              child: Transform.rotate(
                  angle: 90 * math.pi / 90,
                  child: const Icon(Icons.link_outlined)),
            ),
            title: const Text('Create call link'),
            subtitle: const Text('Share a link for your WhatsApp call'),
          ),
          const SizedBox(height: 10,),
          const Text('Recent', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),)
        ],
      ),
    );
  }
}
