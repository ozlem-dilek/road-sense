import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detection.dart';
import 'homePage.dart';
import 'notificationPage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool cukur = false;
  bool catlak = false;
  bool tespit = false;
  bool harita = false;
  bool bildirim = false;
  bool diger = false;

  void toggleColor(type) {
    setState(() {
      type = !type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Arama',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900
                    ),

                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width:370,
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 1,
                            offset: Offset(0, 0), // Gölgenin konumu
                          ),
                        ]
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: '  Örn: Çukur',
                            hintStyle: TextStyle(fontSize: 20),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search_outlined,
                              size: 40,
                              weight: 10,)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    Text('Filtrele',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700
                    ),)
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(

                        width: 120,
                          height: 120,
                        decoration: BoxDecoration(
                            color: cukur
                                ? Colors.orangeAccent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow:  [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 1,
                                offset: Offset(0, 0), // Gölgenin konumu
                              ),
                            ]
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){
                              void toggleColor() {
                                setState(() {
                                  cukur = !cukur;
                                });
                              }
                            },
                                icon: Icon(Icons.circle_outlined,
                              size: 50,)),
                            Text('Çukur',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow:  [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 1,
                                offset: Offset(0, 0), // Gölgenin konumu
                              ),
                            ]
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){},
                                icon: Icon(Icons.line_axis,
                                size: 50,)),
                            Text('Çatlak',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500
                              ),)
                          ],
                        ),
                      ),
                      Container(

                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow:  [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 1,
                                offset: Offset(0, 0), // Gölgenin konumu
                              ),
                            ]
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){},
                                icon: Icon(Icons.camera_alt,
                              size: 50,)),
                            Text('Tespit',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500
                              ),)
                          ],
                        ),
                      ),
                    ],
                                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(

                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow:  [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 1,
                                  offset: Offset(0, 0), // Gölgenin konumu
                                ),
                              ]
                          ),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){},
                                icon: Icon(Icons.map_outlined,
                                size: 50,)),
                              Text('Harita',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500
                                ),)
                            ],
                          ),
                        ),
                        Container(

                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow:  [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 1,
                                  offset: Offset(0, 0), // Gölgenin konumu
                                ),
                              ]
                          ),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){},
                                  icon: Icon(Icons.notifications,
                                  size: 50,)),
                              Text('Bildirim',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500
                                ),)
                            ],
                          ),
                        ),
                        Container(

                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow:  [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 1,
                                  offset: Offset(0, 0), // Gölgenin konumu
                                ),
                              ]
                          ),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){},
                                icon: Icon(Icons.keyboard_arrow_right,
                                size: 50,)),
                              Text('Diğer',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500
                                ),)
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  

                ],
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
                IconButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                    icon: Icon(Icons.home_filled, size: 35)),
                IconButton(onPressed: (){},
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
