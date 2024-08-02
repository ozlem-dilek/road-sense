import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          leading:IconButton(
            onPressed: () {  },
            icon: Icon(Icons.account_circle),
            iconSize: 40,
          ),
          title: Text('ROADSENSE'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.location_on_sharp))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Yakındaki Olaylar'),
                  TextButton(onPressed: (){},
                      child: Text('Hepsini Gör',
                        style: TextStyle(
                            color: Colors.orange),))

              ],),
            ),
          Card(shadowColor: Colors.orange,
            elevation: 10,
            color: Colors.white,
            shape:  RoundedRectangleBorder(
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
                      Text('Konuma Göre Ara'),
                        Icon(Icons.map_outlined)

                    ],),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 270,
                          child: Container(
                            height: 250,
                              width: 250,
                              color: Colors.grey ,
                                              ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          )
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){},
                    icon: Icon(Icons.home_filled, size: 35)),
                IconButton(onPressed: (){},
                    icon: Icon(Icons.search, size: 37)),
                SizedBox(width: 20,),
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
            onPressed: (){},
          child: Icon(Icons.add, color: Colors.white, size: 35,),
          backgroundColor: Colors.orangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0), // Yuvarlaklık için ayar
            ),),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
