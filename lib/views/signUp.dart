import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController birthController = TextEditingController();


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
            height: 640,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Card(
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Köşe yarıçapı
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Sign Up',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700
                        )
                    ),
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
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: 'Name',
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
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
                          controller: surnameController,
                          decoration: InputDecoration(
                              hintText: 'Surname',
                              border: InputBorder.none
                          ),
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
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: 'E-mail',
                              border: InputBorder.none
                          ),
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
                              hintText: 'Password',
                              border: InputBorder.none
                          ),
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
                          controller: locationController,
                          decoration: InputDecoration(
                              hintText: 'Location',
                              border: InputBorder.none
                          ),
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
                          controller: birthController,
                          decoration: InputDecoration(
                              hintText: 'Birth Date',
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                  ),



                ],

              ),
            ),
          ),
        ),
        ],
      )

    );
  }
}
