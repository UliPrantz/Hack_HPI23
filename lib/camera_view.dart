import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Show us the trash!'),
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width / 2 - 50,
              child: ElevatedButton(
                onPressed: () => buttonPressed(context),
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
            Center(child: CameraPreview(controller)),
          ],
        ),
      ),
    );
  }

  Future<void> buttonPressed(BuildContext context) async {
    // try {
    //   await controller.takePicture();
    // } on CameraException catch (e) {
    //   print(e);
    // }

    context.push(Uri(path: '/confirmation').toString());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
