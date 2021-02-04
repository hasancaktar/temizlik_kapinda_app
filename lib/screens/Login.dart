import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:temizlik_kapinda_app/firebase/firebase_auth.dart';
import 'package:temizlik_kapinda_app/models/listenning.dart';
import 'package:temizlik_kapinda_app/screens/SifremiUnuttum.dart';
import 'package:temizlik_kapinda_app/screens/UyeOl.dart';
import 'package:temizlik_kapinda_app/screens/profil.dart';

import 'SiparisDetayı.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
  String email, sifre;
  bool siparistenMiGeldin = false;

  LoginScreen({Key key, this.email, this.sifre, this.siparistenMiGeldin})
      : super(key: key);
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  GirisYapildiMiDinleme _dinleme = new GirisYapildiMiDinleme();
  FirebaseAuthIslem islem = new FirebaseAuthIslem();
  bool oturumAcildiMi = false;
  final _mailController = TextEditingController();
  final _sifreController = TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool isLoading = false;
  Widget a;

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    a = FirebaseAuthIslem.girisyapildi == true ? profilWidget() : loginWidget();
  }

  @override
  Widget build(BuildContext context) {
    print("FirebaseIslem.girisYapildi"+FirebaseAuthIslem.girisyapildi.toString());
    return FirebaseAuthIslem.girisyapildi == true ? profilWidget() : loginWidget();
  }

  Widget loginWidget() {
    return Center(
        child: !isLoading
            ? Scaffold(
                appBar: AppBar(
                  title: Center(child: Text("Giriş")),
                ),
                backgroundColor: Colors.cyan,
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("temizlikyolda.com" +
                            _dinleme.IslemSonucuDeger.toString()),
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (email) =>
                                      EmailValidator.validate(email)
                                          ? null
                                          : "Lütfen geçerli bir mail girin",
                                  controller: _mailController,
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(color: Colors.white),
                                      hintText: "E-posta",
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              Padding(
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
                                  controller: _sifreController,
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(color: Colors.white),
                                      hintText: "Şifre",
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SifremiUnuttumScreen()));
                                    },
                                    child: Text(
                                      "Şifremi unuttum",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                              Text(
                                "****",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: RaisedButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      isLoading = true;
                                      girisYap();
                                      // FirebaseAuthIslem.siparistenMiGeldin =false;
                                    });
                                  }
                                  //firebaseAuthServis.girisMetodu(,context);
                                  //_girisYap(context);
                                },
                                child: Text("Giriş yap"),
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
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Henüz Üye Değilim",
                            style: TextStyle(color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UyeOlScreen()));
                                },
                                child: Text("Üye ol"),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
  Widget profilWidget() {
    return WillPopScope(
     // onWillPop: () => cikisYap(context),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.block_outlined),
                onPressed: () => cikisYap(context))
          ],
          title: Center(child: Text("Detay")),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    maxRadius: 55,
                    child: Icon(
                      Icons.person,
                      size: 55,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 30,
                    child: Column(
                      children: [
                        Text("İsim Soyisim"),
                        Text(
                          "Hasan Sancaktar",
                          style: TextStyle(fontSize: 30),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Text("Telefon"),
                        Text(
                          "+905052022233",
                          style: TextStyle(fontSize: 30),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Text("Adres"),
                        Text(
                          "Adres bilgisi",
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    child: Text(
                      "Devam Et",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SiparisDetayiScreen()));
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }


  Future<void> girisYap() async {
    await islem
        .girisYap(context, _mailController.text, _sifreController.text)
        .then((value) {
      print("GİRİŞŞŞŞŞ");
      setState(() {
        isLoading = false;
      });

      //isLoading=true;
    });
  }



  Future cikisYap(BuildContext context) async {
    await _cikisYapuyeOlshowDialog(context, "Dikkta", "Çıkış yapılıyor");

    print("çıkış yapılıyor");
    // islem.girisyapildi = false;
  }

  void _cikisYapuyeOlshowDialog(
      BuildContext context, String title, String content) {
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
                _auth.signOut();
                FirebaseAuthIslem.girisyapildi = false;
                FirebaseAuthIslem.girisyapildi = false;
                print(_auth.currentUser.email);

                Navigator.pushNamedAndRemoveUntil(
                    context, '/', ModalRoute.withName('/'));
              },
            ),
            new FlatButton(
              child: new Text("İptal"),
              onPressed: () async {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
