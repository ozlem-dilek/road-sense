import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_damage_detection_app/views/searchPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detection.dart';
import 'homePage.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),

        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
            child: Icon(Icons.keyboard_arrow_left),
          ),
          ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
          child: Text('Bildirimler',
          style: GoogleFonts.lato(
            fontSize: 30,
            fontWeight: FontWeight.w700
          ),),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.tune))
        ],
      ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Yeni Bildirimler',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    ),
                  ),
                ],
              ),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 1,
                  offset: Offset(0, 0), // Gölgenin konumu
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Icon(Icons.line_axis,
                        size: 35,
                        color: Colors.orangeAccent),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text('Çukur',
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.orangeAccent,
                        ),),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 4),
                          child: Text('100 m yakında bildirildi.',
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w800
                          ),),
                        ),
                        Text('5 dakika önce',
                          style: GoogleFonts.lato(
                              fontSize: 10
                          ),)
                      ],
                    ),

                  ],
                ),
                IconButton(onPressed: (){},
                    icon: Icon(Icons.keyboard_arrow_right,
                          color: Colors.orangeAccent,
                          size: 35)),

              ],
            ),

          )
            ],
          )
        ),
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
                IconButton(onPressed: (){},
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
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetectionPage()));
            },
            child: Icon(Icons.add, color: Colors.white, size: 35),
            backgroundColor: Colors.orangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
