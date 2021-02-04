import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:temizlik_kapinda_app/firebase/firebase_auth.dart';

import 'Login.dart';

class UyeOlScreen extends StatefulWidget {
  bool loading = false;

  UyeOlScreen({Key key, this.loading}) : super(key: key);

  @override
  _UyeOlScreenState createState() => _UyeOlScreenState();
}

class _UyeOlScreenState extends State<UyeOlScreen> {
  FirebaseAuthIslem islem = new FirebaseAuthIslem();

  bool checkBoxAnlasmaValue = false;
  bool checkBoxAKampanyaValue = false;
  final adController = TextEditingController();
  final soyadController = TextEditingController();
  final emailController = TextEditingController();
  final sifreController = TextEditingController();
  final telefonController = TextEditingController();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Text("temizlikkapında.com"),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    validator: (ad) {
                                      if (ad.isEmpty) {
                                        return "Lütfen adınızı girin";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.name,
                                    controller: adController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Adınız"),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    validator: (soyad) {
                                      if (soyad.isEmpty) {
                                        return "Lütfen adınızı girin";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.name,
                                    controller: soyadController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Soyadını"),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (email) =>
                                  EmailValidator.validate(email)
                                      ? null
                                      : "Lütfen geçerli bir mail girin",
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "E-posta"),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    validator: (sifre) {
                                      if (sifre.isEmpty) {
                                        return "Lütfen şifre girin";
                                      }
                                      if (sifre.length < 6) {
                                        return "Şifre En az 6 haneli olmalı";
                                      }
                                      return null;
                                    },
                                    controller: sifreController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Şifre"),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    validator: (sifre) {
                                      if (sifre.isEmpty) {
                                        return "Lütfen şifre girin";
                                      }
                                      if (sifre.length < 6) {
                                        return "Şifre En az 6 haneli olmalı";
                                      }
                                      return null;
                                    },
                                    obscureText: false,
                                    controller: sifreController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Şifre Tekrar"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (telefon) {
                                if (telefon.isEmpty) {
                                  return "Lütfen telefonunuzu girin";
                                }
                                return null;
                              },
                              controller: telefonController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Telefon numanız"),
                            ),
                          ),
                          ListTile(
                            leading: Checkbox(
                              value: checkBoxAnlasmaValue,
                              onChanged: (bool valuee) {
                                setState(() {
                                  checkBoxAnlasmaValue = valuee;
                                });
                              },
                            ),
                            title: Text("anlaşmayı okudum kabul ediyorum"),
                          ),
                          ListTile(
                            leading: Checkbox(
                              value: checkBoxAKampanyaValue,
                              onChanged: (bool valuee) {
                                setState(() {
                                  checkBoxAKampanyaValue = valuee;
                                });
                              },
                            ),
                            title: Text("kampanya haberleri gelsin"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: RaisedButton(
                                color: Colors.white,
                                onPressed: () {
                                  if (formKey.currentState.validate()) {
                                    setState(() {
                                      uyeOl();
                                    });
                                  }
                                },
                                child: Text(
                                  "Üye ol",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: RaisedButton(
                                color: Colors.blueAccent,
                                onPressed: () {},
                                child: Text(
                                  "Facebook ile giriş yap",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text("Zaten üyeeyim"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: RaisedButton(
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Giriş Yap",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }

  Future<void> uyeOl() async {
    await islem
        .uyeOl(context, emailController.text, sifreController.text,
            telefonController.text, adController.text, soyadController.text)
        .then((value) {
      isLoading = true;
      print("GİRİŞŞŞŞŞ");
      //isLoading=false;
      //isLoading=true;
    });
  }

  void _showDialog(BuildContext context, String title, String content) {
    // flutter defined function
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: Text(content),
          //content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Tamam"),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        );
      },
    );
  }
}
