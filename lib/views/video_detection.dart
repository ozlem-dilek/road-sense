import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'detection.dart';

class VideoDetectionPage extends StatefulWidget {
  @override
  _VideoDetectionPageState createState() => _VideoDetectionPageState();
}

class _VideoDetectionPageState extends State<VideoDetectionPage> {
  File? _video;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      setState(() {
        _video = File(video.path);
      });
      // Burada video üzerinde işlem yapılabilir (örneğin, video tespiti için Python servis çağrısı)
    }
  }

  Future<void> _recordVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    if (video != null) {
      setState(() {
        _video = File(video.path);
      });
      // Burada video üzerinde işlem yapılabilir (örneğin, video tespiti için Python servis çağrısı)
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
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.keyboard_arrow_left),
          ),
          title: Text("Yol Hasarı Tespiti"),
          centerTitle: true,
        ),
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: _video == null
                        ? Center(child: Text("Video Çek veya Galeri'den seç"))
                        : Stack(
                      children: [
                        // Video widget'ı kullanmanız gerekebilir (örneğin, video oynatıcı)
                        // Video playback widget is currently placeholder
                        Center(child: Text("Video Playback Widget Here")),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _recordVideo,
                    child: Text(
                      'Video Çek',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.orangeAccent),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _pickVideo,
                    child: Text(
                      'Galeriden Seç',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:WidgetStatePropertyAll(Colors.orangeAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
