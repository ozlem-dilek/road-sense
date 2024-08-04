import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DetectionPage extends StatefulWidget {
  const DetectionPage({super.key});

  @override
  State<DetectionPage> createState() => _DetectionPageState();
}

class _DetectionPageState extends State<DetectionPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePicture() async {
    print('Fotoğraf çekme işlemi başlatıldı'); // Hata ayıklama mesajı
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      print('Fotoğraf çekildi ve setState çağrıldı'); // Hata ayıklama mesajı
    } else {
      print('Fotoğraf çekme iptal edildi veya başarısız oldu'); // Hata ayıklama mesajı
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(246, 246, 246, 1),
          leading: IconButton(
            onPressed: (){},
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
                    ? Center(child: Text('Fotoğraf Çek'))
                    : Image.file(_image!),

                  )
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
                    onPressed: () {},
                    child: Text(
                      'Galeriden Seç',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey),
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
