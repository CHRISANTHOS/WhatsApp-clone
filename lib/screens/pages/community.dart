import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            leading: Stack(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black45
                  ),
                  child: const Icon(Icons.group, color: Colors.white,),
                ),
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: Color(0xff25D366),
                    child: Icon(
                      Icons.add,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
            title: const Text('New community'),
          ),
          Container(
            height: 10,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
