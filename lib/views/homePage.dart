import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_damage_detection_app/views/detection.dart';
import 'package:road_damage_detection_app/views/searchPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notificationPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(246, 246, 246, 1),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle,
              color: Colors.grey,
            ),
            iconSize: 40,
          ),
          title: Text(
            'ROADSENSE',
            style: GoogleFonts.bebasNeue(
              fontSize: 35,
              letterSpacing: 5,
              color: Colors.orangeAccent,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.location_on_sharp,
                  color: Colors.grey,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 800,
                child: Card(
                  shadowColor: Colors.grey,
                  borderOnForeground: false,
                  elevation: 0.5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Köşe yarıçapı
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Yakındaki Olaylar', style:
                              GoogleFonts.lato(
                                fontSize: 14, fontWeight: FontWeight.w700
                              ),),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Hepsini Gör',
                                    style: GoogleFonts.lato(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: 250,
                                width: 250,
                                color: Color.fromRGBO(200, 230, 200, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 15, 15, 0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetectionPage()));
                              },
                              icon: Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.orangeAccent,
                              )),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(3, 0, 15, 0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetectionPage()));
                              },
                              child: Text(
                                'Yol Hasar Dedektörü',
                                style: GoogleFonts.lato(
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                ),
                              ),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                          child: Text(
                            'Yol hasarlarını tespit et ve bildir',
                            style: GoogleFonts.lato(
                                fontSize: 16, color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 20, 5, 20),
                          child: Icon(
                            Icons.warning,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Son tespit bugün 10:15'te yapıldı.",
                          style: GoogleFonts.lato(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          child: Icon(
                            Icons.notifications_active,
                            size: 40,
                            color: Colors.orangeAccent,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                          child: Text(
                            'Yakın Çevreye Uyarı Gönder',
                            style: GoogleFonts.lato(
                              color: Colors.orangeAccent,
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: Text(
                            'Tespit ettiğin hasarlar için yakın çevreyi uyar.',
                            style: GoogleFonts.lato(
                                fontSize: 16, color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 20, 5, 20),
                          child: Icon(
                            Icons.warning,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Son uyarı bugün 10:20'de yapıldı.",
                          style: GoogleFonts.lato(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 0, 10),
                    child: Text(
                      'Yol Bozuklukları Kategorileri',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.add_road,
                              size: 35,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                              child: Text(
                                'Çukur',
                                style: GoogleFonts.lato(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 20,
                        indent: 5,
                        endIndent: 5,
                        thickness: 2,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.add_road,
                              size: 35,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                              child: Text(
                                'Çatlak',
                                style: GoogleFonts.lato(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.home_filled, size: 35)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage()));
                    },
                    icon: Icon(Icons.search, size: 37)),
                SizedBox(width: 20),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationPage()));
                    },
                    icon: Icon(Icons.mode_comment, size: 33)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.account_circle, size: 35))
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          width: 65,
          height: 65,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetectionPage()));
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
            backgroundColor: Colors.orangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
