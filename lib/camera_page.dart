import 'dart:io' show Platform;

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loginn/button_camera_animated.dart';
import 'package:native_shutter_sound/native_shutter_sound.dart';

// import '../widgets/custom_widgets/button_camera_animated.dart';
// import '../widgets/modal_alerts/alerts.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({
    required this.cameras,
    Key? key,
  }) : super(key: key);

  final List<CameraDescription> cameras;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;

  bool cameraDenied = false;
  bool audioDenied = false;
  bool cameraError = false;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.cameras.isNotEmpty) {
      initCamera(widget.cameras.first);
    }
  }

  Future<dynamic> takePicture() async {
    if (widget.cameras.isEmpty) {
      Get.back();
    }
    if (!_cameraController.value.isInitialized) {
      Get.back();
    }
    if (_cameraController.value.isTakingPicture) {
      return;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);

      XFile picture = await _cameraController.takePicture();
      NativeShutterSound.play();

      Get.back(result: picture);
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      Get.back();
    }
  }

  Future<dynamic> initCamera(CameraDescription cameraDescription) async {
    _cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.yuv420,
      enableAudio: false,
    );
    await _cameraController.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'cameraPermission':
            cameraDenied = true;
            setState(() {});
            break;
          case 'CameraAccessDenied':
            cameraDenied = true;
            setState(() {});
            break;
          case 'CameraAccessDeniedWithoutPrompt':
            cameraDenied = true;
            setState(() {});
            break;
          // case 'AudioAccessDenied':
          //   audioDenied = true;
          //   setState(() {});
          //   break;
          // case 'AudioAccessDeniedWithoutPrompt':
          //   audioDenied = true;
          //   setState(() {});
          //   break;
          default:
            cameraError = true;
            setState(() {});
            Fluttertoast.showToast(
                msg: e.description ?? 'Terjadi kesalahan pada kamera');
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            if (widget.cameras.isEmpty)
              Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      'Kamera tidak ditemukan pada perangkat ini',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            else if (cameraError)
              Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      'Terjadi kesalahan pada kamera',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            else if (cameraDenied)
              Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      'Kamera belum dapat digunakan, silahkan izinkan akses kamera aplikasi ini',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            else if (audioDenied)
              Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      'Kamera belum dapat digunakan, silahkan izinkan akses microphone aplikasi ini',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            else if (_cameraController.value.isInitialized)
              SizedBox(
                  width: double.infinity,
                  child: CameraPreview(_cameraController))
            else
              Container(
                color: Colors.black,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  color: Colors.black,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    if (Platform.isIOS)
                      Expanded(child: BackButton(color: Colors.white))
                    else
                      const Spacer(),
                    Expanded(
                      child: AnimatedCameraButton(onPressed: takePicture),
                    ),
                    Expanded(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 30,
                        icon: Icon(
                          _isRearCameraSelected
                              ? CupertinoIcons.switch_camera
                              : CupertinoIcons.switch_camera_solid,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() =>
                              _isRearCameraSelected = !_isRearCameraSelected);
                          initCamera(
                              widget.cameras[_isRearCameraSelected ? 0 : 1]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
