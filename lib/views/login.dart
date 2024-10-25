import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_damage_detection_app/views/homePage.dart';
import 'package:road_damage_detection_app/views/signUp.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 320,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Köşe yarıçapı
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('Giriş Yap',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700
                        ) ),
                    ),
                    Center(
                        child: Container(
                          width:350,
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
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'E-posta',
                              border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: Container(
                          width:350,
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
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                                hintText: 'Şifre',
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
                      child: ElevatedButton(onPressed: (){

                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()));

                      },
                          child: Text('Giriş Yap',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w700
                          ),),
                          style: ButtonStyle(
                          minimumSize: WidgetStatePropertyAll(Size(330, 40)),
                          backgroundColor: WidgetStatePropertyAll(Colors.orangeAccent),
                        )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Bir hesabın yok mu?"),
                          TextButton(onPressed: (){
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()));

                          },
                              child: Text('Kaydol',
                              style: TextStyle(
                                  color:Colors.deepOrange),
                              ))
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
