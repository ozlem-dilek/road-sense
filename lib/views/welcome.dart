import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_damage_detection_app/views/login.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, title = "Welcome"});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Center(
              child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Image(
                      image: AssetImage("lib/assets/images/3.jpg"))),
            ),
            SizedBox(height: 10),
            Text("RoadSense",
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w700)),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 5),
              child: Text("Detect road damages, recieve real-time notifications and safe driving!",
              style: TextStyle(
                fontSize: 20,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: ElevatedButton(
                  onPressed:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text('Get Started!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                      fontWeight: FontWeight.w700)),
                  style: ButtonStyle(
                        minimumSize: WidgetStatePropertyAll(Size(300,70)),
                        backgroundColor: WidgetStatePropertyAll(Colors.orangeAccent)
                  )
              ),
            )

          ],
        ),
      )

    );
  }
}
