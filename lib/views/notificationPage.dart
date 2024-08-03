import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_damage_detection_app/views/searchPage.dart';

import 'homePage.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(




      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
                  icon: Icon(Icons.home_filled, size: 35)),
              IconButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
                  icon: Icon(Icons.search, size: 37)),
              SizedBox(width: 20),
              IconButton(onPressed: (){

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()));

              },
                  icon: Icon(Icons.mode_comment, size: 33)),
              IconButton(onPressed: (){},
                  icon: Icon(Icons.account_circle, size: 35))
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 65, height: 65,
        child: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add, color: Colors.white, size: 35),
          backgroundColor: Colors.orangeAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
