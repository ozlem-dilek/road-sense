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
  final TextEditingController birthController = TextEditingController();
  String? selectedLocation;

  final List<String> locations = ['Konya, Türkiye', 'İstanbul, Türkiye', 'Türkiye'];

  bool isDataAgreementAccepted = false;
  bool isMarketingEmailsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Hesap Oluştur',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700
                                )
                            ),
                          ),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
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
                                    hintText: 'Ad',
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
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
                                      hintText: 'Soyad',
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
                                width: MediaQuery.of(context).size.width * 0.8,
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
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
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
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
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 3,
                                        blurRadius: 1,
                                        offset: Offset(0, 0), // Gölgenin konumu
                                      ),
                                    ]
                                ),
                                child: DropdownButtonFormField<String>(
                                  value: selectedLocation,
                                  hint: Text('Konum Seç'),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  items: locations.map((String location) {
                                    return DropdownMenuItem<String>(
                                      value: location,
                                      child: Text(location),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedLocation = newValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 3,
                                      blurRadius: 1,
                                      offset: Offset(0, 0), // Gölgenin konumu
                                    ),
                                  ],
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2101),
                                    );

                                    if (pickedDate != null) {
                                      setState(() {
                                        birthController.text = "${pickedDate.toLocal()}".split(' ')[0];
                                      });
                                    }
                                  },
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      controller: birthController,
                                      decoration: InputDecoration(
                                        hintText: 'Doğum Tarihi',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isDataAgreementAccepted,
                                  onChanged: (newValue) {
                                    setState(() {
                                      isDataAgreementAccepted = newValue ?? false;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isDataAgreementAccepted = !isDataAgreementAccepted;
                                      });
                                    },
                                    child: Text(
                                      'Veri depolama sözleşmesini kabul ediyorum.',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isMarketingEmailsAccepted,
                                  onChanged: (newValue) {
                                    setState(() {
                                      isMarketingEmailsAccepted = newValue ?? false;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isMarketingEmailsAccepted = !isMarketingEmailsAccepted;
                                      });
                                    },
                                    child: Text(
                                      'Tanıtım ve reklam maillerini almak istiyorum.',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: isDataAgreementAccepted ? () {} : null,
                                  child: Text(
                                    "Kaydol",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:isDataAgreementAccepted
                                        ? WidgetStatePropertyAll(Colors.orangeAccent)
                                        : WidgetStatePropertyAll(Colors.grey)
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
