import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert'; // bu kütüphane json için
import 'package:http/http.dart' as http;

class DetectionPage extends StatefulWidget {
  const DetectionPage({super.key});

  @override
  State<DetectionPage> createState() => _DetectionPageState();
}

class _DetectionPageState extends State<DetectionPage> {
  File? _image;
  List<dynamic>? _detections;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePicture() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });

      await _detectObjects(image.path);
    } else {
      print('Fotoğraf çekme iptal edildi/başarısız oldu');
    }
  }

  Future<void> _pickPicture() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });

      await _detectObjects(image.path);
    } else {
      print('Fotoğraf seçme iptal edildi/başarısız oldu');
    }
  }

  Future<void> _detectObjects(String imagePath) async {
    final url = Uri.parse('http://127.0.0.1:5001/predict/photo');
    final request = http.MultipartRequest('POST', url)
      ..files.add(await http.MultipartFile.fromPath('image', imagePath));
    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      setState(() {
        _detections = json.decode(responseBody);
      });
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(246, 246, 246, 1),
          leading: IconButton(
            onPressed: () {},
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
                    child: _image == null
                        ? Center(child: Text("Fotoğraf Çek veya Galeri'den seç"))
                        : Stack(
                      children: [
                        Image.file(_image!),
                        if (_detections != null)
                          ..._detections!.map((detection) {
                            return Positioned(
                              left: detection['x1'],
                              top: detection['y1'],
                              width: detection['x2'] - detection['x1'],
                              height: detection['y2'] - detection['y1'],
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _takePicture,
                    child: Text(
                      'Fotoğraf Çek',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _pickPicture,
                    child: Text(
                      'Galeriden Seç',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
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
                onPressed: () {},
                icon: Icon(Icons.camera_alt),
                color: Colors.orangeAccent,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.video_collection),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.live_tv_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
