import 'package:camera/camera.dart';

import 'package:flutter/material.dart';

/// CameraApp is the Main Application.
class CameraView extends StatefulWidget {
  /// Default Constructor
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late List<CameraDescription> _cameras;

  bool loaded = false;
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    setupCamera();
  }

  Future<void> setupCamera() async {
    _cameras = await availableCameras();

    controller = CameraController(_cameras[0], ResolutionPreset.medium);

    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });

    setState(() {
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return MaterialApp(
      home: Stack(
        children: [
          Positioned(
            child: ElevatedButton(
              onPressed: buttonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Scanned',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          CameraPreview(controller),
        ],
      ),
    );
  }

  Future<void> buttonPressed() async {
    try {
      await controller.takePicture();
    } on CameraException catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
