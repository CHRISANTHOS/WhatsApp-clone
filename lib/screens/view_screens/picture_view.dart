import 'dart:io';

import 'package:flutter/material.dart';

class PictureView extends StatefulWidget {
  String path;
  PictureView({required this.path});

  @override
  State<PictureView> createState() => _PictureViewState();
}

class _PictureViewState extends State<PictureView> {
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
              child: Image.file(File(widget.path), fit: BoxFit.cover,),
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
                ),)
          ],
        ),
      ),
    );
  }
}
