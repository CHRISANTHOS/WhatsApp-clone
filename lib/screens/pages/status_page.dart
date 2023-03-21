import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Stack(
              children: const [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.black38,
                  child: Icon(Icons.person),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 7,
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),
            title: const Text('Your status update'),
            subtitle: const Text('Tap to add status update'),
          ),
          const Text('Recent updates'),

        ],
      ),
    );
  }
}
