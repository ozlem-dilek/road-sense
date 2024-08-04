import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_damage_detection_app/views/homePage.dart';
import 'package:road_damage_detection_app/views/searchPage.dart';

import 'notificationPage.dart';

class DetectionPage extends StatefulWidget {
  const DetectionPage({super.key});

  @override
  State<DetectionPage> createState() => _DetectionPageState();
}

class _DetectionPageState extends State<DetectionPage> {
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
        body:
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.75,
                  )
                ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    ElevatedButton(onPressed: (){},
                      child:Text('Fotoğraf Çek',
                          style: TextStyle(
                              color: Colors.white),),
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.orangeAccent)),),
                    ElevatedButton(onPressed: (){},
                      child:Text('Galeriden Seç',
                          style: TextStyle(
                              color: Colors.white,)),
                      style: ButtonStyle
                          (backgroundColor: WidgetStatePropertyAll(Colors.grey)), )

                  ],
                ),
              ]

            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt), color: Colors.orangeAccent,),
                IconButton(onPressed: (){}, icon: Icon(Icons.video_collection)),
                IconButton(onPressed: (){}, icon: Icon(Icons.live_tv_outlined))

              ],
            ),
          ),
      ),
    );
  }
}
