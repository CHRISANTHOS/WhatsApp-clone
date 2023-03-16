import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {

  String path;
  VideoView({Key? key, required this.path}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  VideoPlayerController? _controller;
  late Future<void> _initializeVideoPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path));
    _initializeVideoPlayer = _controller!.initialize().then((value) {setState(() {

    });});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.crop_rotate, size: 27,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.emoji_emotions_outlined, size: 27,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.title, size: 27,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.edit, size: 27,)),
        ],
      ),
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              child: FutureBuilder(
                  future: _initializeVideoPlayer,
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                      return AspectRatio(aspectRatio: _controller!.value.aspectRatio, child: VideoPlayer(_controller!));
                    }else{
                      return const CircularProgressIndicator();
                    }
              }),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                width: width,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                        maxLines: 6,
                        minLines: 1,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            filled: true,
                            fillColor: Colors.grey[700],
                            hintText: 'Add Caption...',
                            prefixIcon: const Icon(Icons.add_photo_alternate, color: Colors.white, size: 22,),
                            hintStyle: const TextStyle(color: Colors.white, fontSize: 12),
                            suffixIcon: const Icon(Icons.circle_outlined, color: Colors.white, size: 22,)
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    CircleAvatar(radius: 22, backgroundColor: Colors.tealAccent[700], child: const Icon(Icons.check, size: 22, color: Colors.white,),)
                  ],
                ),
              ),),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){
                  setState(() {
                    _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
                  });
                },
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: Colors.black38,
                  child: Icon(_controller!.value.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white,size: 50,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
