import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:road_damage_detection_app/views/video_detection.dart';
import 'detection.dart';
import 'homePage.dart';
import 'package:google_fonts/google_fonts.dart';

class LiveDetectionPage extends StatefulWidget {
  @override
  _LiveDetectionPageState createState() => _LiveDetectionPageState();
}

class _LiveDetectionPageState extends State<LiveDetectionPage> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  bool _isProcessing = false;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras!.isNotEmpty) {
      _cameraController = CameraController(_cameras![0], ResolutionPreset.high);

      try {
        await _cameraController!.initialize();
        setState(() {
          _isCameraInitialized = true;
        });
      } catch (e) {
        print("Kamera başlatma hatası: $e");
      }
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _startRealTimeDetection() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    setState(() {
      _isProcessing = true;
      _isRecording = true;
    });

    try {
      final tempDir = await getTemporaryDirectory();
      final videoPath = '${tempDir.path}/video.mp4';

      // Start recording
      await _cameraController!.startVideoRecording();

      // Continuously capture frames for detection
      while (_isRecording) {
        final videoFile = await _cameraController!.stopVideoRecording();
        File video = File(videoFile.path);
        video.copySync(videoPath);

        // Send video to Python service
        final request = http.MultipartRequest(
          'POST',
          Uri.parse('http://<xxx>:5000/detect'),
        );
        request.files.add(await http.MultipartFile.fromPath('video', videoPath));
        final response = await request.send();

        if (response.statusCode == 200) {
          print('Detection successful');
        } else {
          print('Detection failed');
        }

        // Restart video recording
        await _cameraController!.startVideoRecording();
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  Future<void> _stopRealTimeDetection() async {
    if (_isRecording) {
      setState(() {
        _isRecording = false;
      });

      try {
        // Stop the video recording
        await _cameraController!.stopVideoRecording();
      } catch (e) {
        print("Error stopping recording: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(246, 246, 246, 1),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()));            },
            icon: Icon(Icons.keyboard_arrow_left),
          ),
          title: Text("Canlı Tespit",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w700
          ),),
          centerTitle: true,
        ),
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isCameraInitialized
                ? AspectRatio(
              aspectRatio: _cameraController!.value.aspectRatio,
              child: CameraPreview(_cameraController!),
            )
                : Center(child: CircularProgressIndicator()),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isProcessing ? null : _startRealTimeDetection,
              child: _isProcessing
                  ? CircularProgressIndicator()
                  : Text(
                'Başlat',
                style: GoogleFonts.lato(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.orangeAccent),
              ),
            ),
            ElevatedButton(
              onPressed: !_isProcessing ? null : _stopRealTimeDetection,
              child: Text(
                'Durdur',
                style:  GoogleFonts.lato(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.redAccent),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetectionPage()),
                  );
                },
                icon: Icon(Icons.camera_alt),
                color: Colors.orangeAccent,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VideoDetectionPage()),
                  );
                },
                icon: Icon(Icons.video_collection),
                color: Colors.orangeAccent,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.live_tv_outlined),
                color: Colors.orangeAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
