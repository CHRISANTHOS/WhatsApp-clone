import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../view_screens/picture_view.dart';
import '../view_screens/video_view.dart';

class CameraPage extends StatefulWidget {
  CameraDescription camera;
  CameraPage({required this.camera});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  late Future<void> _initializeCameraController;
  bool isFlash = false;
  bool isRecording = false;
  bool isSelfie = false;

  void _takePicture(BuildContext context)async{
    try{
      await _initializeCameraController;
      final path = join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');

      XFile picture = await _cameraController.takePicture();
      picture.saveTo(path);
      Navigator.push(context, MaterialPageRoute(builder: (context) => PictureView(path: path,)));

    }catch(e){
      log(e.toString());
    }
  }


  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeCameraController = _cameraController.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FutureBuilder(
                future: _initializeCameraController,
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: CameraPreview(_cameraController));
                  }else{
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close,color: Colors.white,)),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isFlash = !isFlash;
                      });
                      isFlash ? _cameraController.setFlashMode(FlashMode.torch) : _cameraController.setFlashMode(FlashMode.off);
                    },
                    child: isFlash ? Icon(Icons.flash_on, color: Colors.white,): Icon(Icons.flash_off, color: Colors.white,),)
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                color: Colors.black,
                padding: EdgeInsets.only(top: 5,bottom: 5),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SafeArea(child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FloatingActionButton(
                              heroTag: 'photos',
                              onPressed: (){

                            },backgroundColor: Colors.black, child: Icon(Icons.photo),),
                          ),
                        )),
                        SafeArea(child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onLongPress: ()async{
                                await _cameraController.startVideoRecording();
                                setState(() {
                                  isRecording = true;
                                });
                              },
                              onLongPressUp: ()async{
                                XFile videoPath = await _cameraController.stopVideoRecording();
                                setState(() {
                                  isRecording = false;
                                });
                                Navigator.push(context, MaterialPageRoute(builder: (context) => VideoView(path: videoPath.path,)));
                              },
                              onTap: (){
                                if(!isRecording) _takePicture(context);
                              },
                              child: isRecording ? Icon(Icons.radio_button_on,color: Colors.red,size: 80,) : Icon(Icons.panorama_fish_eye, color: Colors.white, size: 70,),
                            ),
                          ),
                        )),
                        SafeArea(child: Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FloatingActionButton(
                              heroTag: 'switch',
                              onPressed: ()async{
                              setState(() {
                                isSelfie = !isSelfie;
                                isFlash = false;
                              });
                              final sCamera = await availableCameras();
                              int cameraPosition = isSelfie ? 1 : 0;
                              _cameraController = CameraController(sCamera[cameraPosition], ResolutionPreset.medium);
                              _initializeCameraController = _cameraController.initialize();
                            },backgroundColor: Colors.black, child: Icon(Icons.switch_camera),),
                          ),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text('Hold for video, tap for photo', style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
