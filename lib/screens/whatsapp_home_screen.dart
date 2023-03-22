import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'pages/chat_page.dart';
import 'pages/calls_page.dart';
import 'pages/camera_page.dart';
import 'pages/status_page.dart';
import 'pages/community.dart';
import 'package:whatsapp_clone/utils/pop_menu.dart';

enum Tabb { group, chats, status, calls }

enum Floating { chat, status }

Tabb tabb = Tabb.chats;
Floating floating = Floating.chat;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool isFab = true;

  PopMenu popMenu = PopMenu();

  void _showCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => CameraPage(camera: camera)));
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController!.addListener(() {
      if (_tabController!.index == 1) {
        setState(() {
          isFab = true;
          tabb = Tabb.chats;
          floating = Floating.chat;
        });
      } else if (_tabController!.index == 0) {
        setState(() {
          tabb = Tabb.group;
          isFab = false;
        });
      } else if (_tabController!.index == 2) {
        setState(() {
          tabb = Tabb.status;
          isFab = false;
          floating = Floating.status;
        });
      } else if (_tabController!.index == 3) {
        setState(() {
          tabb = Tabb.calls;
          isFab = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff25D366),
        title: const Text('Whatsapp'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              icon: Icon(Icons.group),
            ),
            Tab(
              text: 'Chats',
            ),
            Tab(
              text: 'Status',
            ),
            Tab(
              text: 'Calls',
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showCamera();
            },
            icon: const Icon(Icons.camera_alt),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton(itemBuilder: (context) {
            return popMenu.popUp();
          }, onSelected: (value) {
            print(value);
          }),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [CommunityPage(), Chatpage(), StatusPage(), CallPage()],
      ),
      floatingActionButton: isFab
          ? FloatingActionButton(
              heroTag: 'chat',
              onPressed: () {},
              backgroundColor: const Color(0xff25D366),
              child: const Icon(
                Icons.message,
                color: Colors.white,
              ),
            )
          : floating == Floating.status
              ? Column(
        mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: FloatingActionButton(
                        heroTag: 'pen',
                        onPressed: () {},
                        backgroundColor: Colors.white70,
                        child: const Icon(
                          Icons.pending,
                          color: Colors.black87,
                          size: 17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FloatingActionButton(
                      heroTag: 'cam',
                      onPressed: () {},
                      backgroundColor: const Color(0xff25D366),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              : null,
    );
  }
}
